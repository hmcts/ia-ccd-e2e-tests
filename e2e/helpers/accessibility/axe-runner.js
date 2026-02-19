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

function buildTestName(pageUrl) {
  const normalizedUrl = normalizePageUrl(pageUrl);

  try {
    const parsedUrl = new URL(normalizedUrl);
    const pathSegments = parsedUrl.pathname.split('/').filter(Boolean).map(sanitizePathSegment);
    if (pathSegments.length === 0) {
      return parsedUrl.hostname || 'unknown-page';
    }
    const shortPath = pathSegments.slice(-2).join('/');
    return shortPath || pathSegments[pathSegments.length - 1] || parsedUrl.hostname || 'unknown-page';
  } catch (error) {
    const withoutHost = normalizedUrl.replace(/^https?:\/\/[^/]+/i, '');
    const pathSegments = withoutHost.split('/').filter(Boolean).map(sanitizePathSegment);
    if (pathSegments.length === 0) {
      return 'unknown-page';
    }
    if (pathSegments.length === 1) {
      return pathSegments[0];
    }
    return pathSegments.slice(-2).join('/');
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
