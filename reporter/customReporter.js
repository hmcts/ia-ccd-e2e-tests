const testConfig = require('../e2e/ia.conf');
const AxeRunner = require('../e2e/helpers/accessibility/axe-runner');
const fs = require('fs');

async function generateAccessibilityReport() {
  const reportJson = AxeRunner.getAccessibilityTestResult();
  const result = 'var replacejsoncontent = ' + JSON.stringify(reportJson);

  const sourceReport = __dirname + '/Report.html';
  const destReport = testConfig.TestOutputDir + '/a11y.html';
  const destJson = testConfig.TestOutputDir + '/a11y_output.js';
   browser.sleep(5000)
   fs.copyFileSync(sourceReport, destReport);
   fs.writeFileSync(destJson, result);
   copyResources()
  
}

function copyResources() {
  const resourceDir = testConfig.TestOutputDir + '/resources/';
  const cssDir = resourceDir + 'css/';
  if (!fs.existsSync(cssDir)) {
    fs.mkdirSync(cssDir, {recursive: true});
  }
  
  const webfontsDir = resourceDir + 'webfonts/';
  if (!fs.existsSync(webfontsDir)) {
    fs.mkdirSync(webfontsDir, {recursive: true});
  }
  
  browser.sleep(5000)
  fs.copyFileSync(__dirname + '/resources/angular.min.js', resourceDir + 'angular.min.js');
  fs.copyFileSync(__dirname + '/resources/css/all.css', cssDir + 'all.css');
  fs.copyFileSync(__dirname + '/resources/webfonts/fa-solid-900.woff2', webfontsDir + 'fa-solid-900.woff2');
}

module.exports = {generateAccessibilityReport};