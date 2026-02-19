const testConfig = require('../e2e/ia.conf');
const AxeRunner = require('../e2e/helpers/accessibility/axe-runner');
const fs = require('fs');

async function generateAccessibilityReport() {
  const reportJson = normalizeAccessibilityReport(AxeRunner.getAccessibilityTestResult());
  const sourceReport = __dirname + '/Report.html';
  const destReport = testConfig.TestOutputDir + '/a11y.html';
  const destJson = testConfig.TestOutputDir + '/a11y_output.js';
  const existingReport = normalizeAccessibilityReport(readExistingAccessibilityReport(destJson));

  // In parallel/sharded runs, onComplete can run multiple times.
  // Avoid overwriting a previously generated non-empty report with empty data.
  if (
    reportJson.tests.length === 0 &&
    existingReport.tests.length > 0
  ) {
    return;
  }

  const mergedReport = mergeAccessibilityReports(existingReport, reportJson);
  const filteredReport = filterLoginPages(mergedReport);
  const sortedReport = sortAccessibilityTests(filteredReport);
  console.log(`[a11y-report] incoming=${reportJson.tests.length} existing=${existingReport.tests.length} merged=${mergedReport.tests.length} filtered=${sortedReport.tests.length}`);
  const result = 'var replacejsoncontent = ' + JSON.stringify(sortedReport);

  fs.copyFileSync(sourceReport, destReport);
  fs.writeFileSync(destJson, result);
  copyResources();
}

function readExistingAccessibilityReport(destJson) {
  if (!fs.existsSync(destJson)) {
    return null;
  }

  try {
    const fileContent = fs.readFileSync(destJson, 'utf8');
    const marker = 'var replacejsoncontent = ';
    if (!fileContent.startsWith(marker)) {
      return null;
    }
    return JSON.parse(fileContent.slice(marker.length));
  } catch (error) {
    return null;
  }
}

function normalizeAccessibilityReport(report) {
  const normalized = report && typeof report === 'object' ? report : {};
  const tests = Array.isArray(normalized.tests) ? normalized.tests : [];
  return {
    appName: normalized.appName || 'Manage cases',
    passCount: Number(normalized.passCount) || 0,
    failCount: Number(normalized.failCount) || 0,
    tests,
  };
}

function mergeAccessibilityReports(existingReport, incomingReport) {
  const mergedByKey = new Map();

  const upsert = (test) => {
    if (!test || typeof test !== 'object') {
      return;
    }

    const normalizedPageUrl = test.normalizedPageUrl || normalizePageUrl(test.pageUrl);
    const key = normalizedPageUrl || test.name || test.screenshot;
    if (!key) {
      return;
    }

    if (!mergedByKey.has(key)) {
      mergedByKey.set(key, {
        ...test,
        normalizedPageUrl,
        pageUrl: test.pageUrl || normalizedPageUrl,
        a11yIssues: Array.isArray(test.a11yIssues) ? test.a11yIssues : [],
      });
      return;
    }

    const existing = mergedByKey.get(key);
    const existingIssues = Array.isArray(existing.a11yIssues) ? existing.a11yIssues : [];
    const incomingIssues = Array.isArray(test.a11yIssues) ? test.a11yIssues : [];
    const mergedIssuesByKey = new Map();

    for (const issue of existingIssues.concat(incomingIssues)) {
      const issueKey = [issue.code, issue.type, issue.message].join('|');
      if (!mergedIssuesByKey.has(issueKey)) {
        mergedIssuesByKey.set(issueKey, issue);
      }
    }

    const existingFailed = existing.status === 'failed';
    const incomingFailed = test.status === 'failed';

    mergedByKey.set(key, {
      ...existing,
      ...test,
      status: existingFailed || incomingFailed ? 'failed' : 'passed',
      a11yIssues: Array.from(mergedIssuesByKey.values()),
      screenshot: test.screenshot || existing.screenshot,
      name: test.name || existing.name,
      pageUrl: test.pageUrl || existing.pageUrl || normalizedPageUrl,
      normalizedPageUrl: normalizedPageUrl || existing.normalizedPageUrl,
    });
  };

  existingReport.tests.forEach(upsert);
  incomingReport.tests.forEach(upsert);

  const tests = Array.from(mergedByKey.values());
  const passCount = tests.filter((test) => test.status === 'passed').length;
  const failCount = tests.filter((test) => test.status === 'failed').length;

  return {
    appName: incomingReport.appName || existingReport.appName || 'Manage cases',
    passCount,
    failCount,
    tests,
  };
}

function filterLoginPages(report) {
  const tests = report.tests.filter((test) => !isLoginPage(test.pageUrl));
  return {
    ...report,
    passCount: tests.filter((test) => test.status === 'passed').length,
    failCount: tests.filter((test) => test.status === 'failed').length,
    tests,
  };
}

function sortAccessibilityTests(report) {
  const tests = [...report.tests].sort((left, right) => {
    const leftFailed = left.status === 'failed' ? 0 : 1;
    const rightFailed = right.status === 'failed' ? 0 : 1;
    if (leftFailed !== rightFailed) {
      return leftFailed - rightFailed;
    }

    const leftUrl = (left.pageUrl || '').toLowerCase();
    const rightUrl = (right.pageUrl || '').toLowerCase();
    return leftUrl.localeCompare(rightUrl);
  });

  return {
    ...report,
    passCount: tests.filter((test) => test.status === 'passed').length,
    failCount: tests.filter((test) => test.status === 'failed').length,
    tests,
  };
}

function normalizePageUrl(pageUrl) {
  if (!pageUrl || typeof pageUrl !== 'string') {
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

function isLoginPage(pageUrl) {
  const normalized = normalizePageUrl(pageUrl);
  if (!normalized) {
    return false;
  }

  try {
    const parsed = new URL(normalized);
    return parsed.pathname === '/login';
  } catch (error) {
    return normalized.endsWith('/login');
  }
}

function copyResources() {
  const resourceDir = testConfig.TestOutputDir + '/resources/';
  const cssDir = resourceDir + 'css/';
  if (!fs.existsSync(cssDir)) {
    fs.mkdirSync(cssDir, { recursive: true });
  }

  const webfontsDir = resourceDir + 'webfonts/';
  if (!fs.existsSync(webfontsDir)) {
    fs.mkdirSync(webfontsDir, { recursive: true });
  }

  fs.copyFileSync(__dirname + '/resources/angular.min.js', resourceDir + 'angular.min.js');
  fs.copyFileSync(__dirname + '/resources/css/all.css', cssDir + 'all.css');
  fs.copyFileSync(__dirname + '/resources/webfonts/fa-solid-900.woff2', webfontsDir + 'fa-solid-900.woff2');
}

module.exports = { generateAccessibilityReport };
