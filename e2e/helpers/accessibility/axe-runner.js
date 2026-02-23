const fs = require('fs');
const AxeBuilder = require('@axe-core/webdriverjs');
const iaconfig = require('../../ia.conf');

const result = {
  PASSED: 'passed',
  FAILED: 'failed',
};

const resultObj = {
  appName: 'Manage cases',
  passCount: 0,
  failCount: 0,
  tests: [],
};

function normalizePageUrl(pageUrl) {
  if (!pageUrl) {
    return '';
  }

  try {
    const parsedUrl = new URL(pageUrl);
    const pathname = parsedUrl.pathname.replace(/\/+$/, '');
    return `${parsedUrl.origin}${pathname || '/'}`;
  } catch (error) {
    return pageUrl.split('?')[0].split('#')[0];
  }
}

function sanitizePathSegment(segment) {
  if (!segment) {
    return 'unknown-page';
  }

  if (/^\d+$/.test(segment)) {
    return ':id';
  }

  if (/^[0-9a-f]{8,}$/i.test(segment)) {
    return ':id';
  }

  return segment;
}

function isGenericSegment(segment) {
  const generic = new Set(['cases', 'case-details', 'case-create', 'ia', 'asylum', 'bail', ':id']);
  return generic.has((segment || '').toLowerCase());
}

function buildFromKnownPatterns(pathSegments, fallbackLabel) {
  const triggerIndex = pathSegments.lastIndexOf('trigger');
  if (triggerIndex >= 0 && pathSegments.length > triggerIndex + 2) {
    return `${pathSegments[triggerIndex + 1]}/${pathSegments[triggerIndex + 2]}`;
  }

  const createIndex = pathSegments.lastIndexOf('case-create');
  if (createIndex >= 0 && pathSegments.length > createIndex + 2) {
    return `${pathSegments[createIndex + 1]}/${pathSegments[createIndex + 2]}`;
  }

  const detailsIndex = pathSegments.lastIndexOf('case-details');
  if (detailsIndex >= 0) {
    const root = pathSegments[detailsIndex - 1] || fallbackLabel;
    return `${root}/case-details`;
  }

  const meaningful = pathSegments.filter((segment) => !isGenericSegment(segment));
  if (meaningful.length >= 2) {
    return `${meaningful[meaningful.length - 2]}/${meaningful[meaningful.length - 1]}`;
  }
  if (meaningful.length === 1) {
    return meaningful[0];
  }

  if (pathSegments.length >= 2 && pathSegments[pathSegments.length - 1] === ':id') {
    return `${pathSegments[pathSegments.length - 2]}/details`;
  }

  return pathSegments.slice(-2).join('/');
}

function buildTestName(pageUrl) {
  const normalizedUrl = normalizePageUrl(pageUrl);

  try {
    const parsedUrl = new URL(normalizedUrl);
    const pathSegments = parsedUrl.pathname.split('/').filter(Boolean).map(sanitizePathSegment);
    if (pathSegments.length === 0) {
      return parsedUrl.hostname || 'unknown-page';
    }
    const shortPath = buildFromKnownPatterns(pathSegments, parsedUrl.hostname || 'cases');
    return shortPath || pathSegments[pathSegments.length - 1] || parsedUrl.hostname || 'unknown-page';
  } catch (error) {
    const withoutHost = normalizedUrl.replace(/^https?:\/\/[^/]+/i, '');
    const pathSegments = withoutHost.split('/').filter(Boolean).map(sanitizePathSegment);
    if (pathSegments.length === 0) {
      return 'unknown-page';
    }
    return buildFromKnownPatterns(pathSegments, 'cases') || 'unknown-page';
  }
}

module.exports = {
  async runAndReportAccessibility() {
    const screenshotPath = iaconfig.TestOutputDir + '/assets';
    const screenshotName = Date.now() + '.png';
    const screenshotReportRef = 'assets/' + screenshotName;

    const accessibilityErrorsOnThePage = await new AxeBuilder(browser.driver).withTags(['wcag2a', 'wcag2aa']).analyze();

    await browser.takeScreenshot().then(async (screenShot) => {
      if (!(await fs.existsSync(screenshotPath))) {
        fs.mkdirSync(screenshotPath, { recursive: true });
      }
      fs.writeFile(screenshotPath + '/' + screenshotName, screenShot, 'base64', (err) => {
        if (err) {
          console.log('Failed to copy the screenshot', err);
        }
      });
    });

    const processIssue = function (issue) {
      return {
        code: issue.id,
        type: issue.impact,
        message: issue.description,
        helpurl: issue.helpUrl,
        tags: issue.tags,
        runner: 'axe',
      };
    };
    const violations = accessibilityErrorsOnThePage.violations.map(processIssue);
    const isPageAccessible = violations.length === 0 ? result.PASSED : result.FAILED;
    const normalizedPageUrl = normalizePageUrl(accessibilityErrorsOnThePage.url);

    if (isPageAccessible === result.PASSED) {
      resultObj.passCount += 1;
    } else {
      resultObj.failCount += 1;
    }

    resultObj.tests.push({
      name: buildTestName(accessibilityErrorsOnThePage.url),
      pageUrl: normalizedPageUrl,
      rawPageUrl: accessibilityErrorsOnThePage.url,
      normalizedPageUrl,
      status: isPageAccessible,
      screenshot: screenshotReportRef,
      a11yIssues: violations,
    });
  },

  getAccessibilityTestResult() {
    return resultObj;
  },
};
