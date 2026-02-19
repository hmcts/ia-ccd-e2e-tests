const testConfig = require('../e2e/ia.conf');
const AxeRunner = require('../e2e/helpers/accessibility/axe-runner');
const fs = require('fs');

async function generateAccessibilityReport() {
  const reportJson = AxeRunner.getAccessibilityTestResult();
  const sourceReport = __dirname + '/Report.html';
  const destReport = testConfig.TestOutputDir + '/a11y.html';
  const destJson = testConfig.TestOutputDir + '/a11y_output.js';
  const existingReport = readExistingAccessibilityReport(destJson);

  // In parallel/sharded runs, onComplete can run multiple times.
  // Avoid overwriting a previously generated non-empty report with empty data.
  if (
    (!reportJson.tests || reportJson.tests.length === 0) &&
    existingReport &&
    existingReport.tests &&
    existingReport.tests.length > 0
  ) {
    return;
  }

  const result = 'var replacejsoncontent = ' + JSON.stringify(reportJson);

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
