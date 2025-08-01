const tsNode = require('ts-node');
const path = require('path');
const iaConfig = require('./ia.conf');
const { generateAccessibilityReport } = require('../reporter/customReporter');
const retry = require('protractor-retry').retry;
const cucumberTaggedFiles = require('../cucumberTaggedFiles.json');
const fs = require('fs');

let chromeVersion = '123.0.6312.122';

let config = {
  framework: 'custom',
  frameworkPath: require.resolve('protractor-cucumber-framework'),
  cucumberOpts: {
    require: ['./cucumber.conf.js', './features/stepDefinitions/**/*.steps.ts', './support/hooks.js'],
    keepAlive: false,
    tags: false,
    profile: false,
    'fail-fast': iaConfig.FailFast,
    'nightly-tag': iaConfig.NightlyTag,
    'no-source': true,
    strict: true,
    format: ['node_modules/cucumber-pretty', 'json:./reports/tests/functional/results.json'],
    retry: parseInt(process.env.RETRIES || 3)
  },

  directConnect: true,
  chromeDriver: process.cwd() + '/chromedriver/linux-' + chromeVersion + '/chromedriver-linux64/chromedriver',

  specs: cucumberTaggedFiles,

  baseUrl: iaConfig.CcdWebUrl,
  allScriptsTimeout: 300000,
  getPageTimeout: 300000,
  useAllAngular2AppRoots: true,
  multiCapabilities: [
    {
      browserName: 'chrome',
      version: chromeVersion,
      chromeOptions: {
        args: ['--disable-dev-shm-usage', '--disable-gpu', '--no-sandbox', iaConfig.UseHeadlessBrowser ? '--headless' : '--noop', iaConfig.UseHeadlessBrowser ? '--window-size=1920,1080' : '--noop'],
        binary: process.cwd() + '/chrome/linux-' + chromeVersion + '/chrome-linux64/chrome',
      },
      name: 'ia-chrome-linux-test',
      extendedDebugging: true,
      sharedTestFiles: iaConfig.RunWithNumberOfBrowsers > 1,
      shardTestFiles: iaConfig.RunWithNumberOfBrowsers > 1,
      capturePerformance: false,
      maxInstances: iaConfig.RunWithNumberOfBrowsers,
    },
  ],
  maxSessions: parseInt(iaConfig.RunWithNumberOfBrowsers, 10),

  plugins: [
    {
      package: 'protractor-multiple-cucumber-html-reporter-plugin',
      options: {
        saveCollectedJSON: true,
        automaticallyGenerateReport: true,
        removeExistingJsonReportFile: true,
        reportName: 'IAC CCD E2E Tests',
        jsonDir: 'reports/tests/functional',
        reportPath: 'reports/tests/functional',
        pageFooter: '<div><p> </p></div>',
      },
    },
  ],

  onCleanUp(results, files) {
    retry.onCleanUp(results, files);
  },

  onPrepare: () => {
    const caps = browser.getCapabilities();
    browser.manage().window().maximize();
    browser.waitForAngularEnabled(true);

    tsNode.register({
      project: path.join(__dirname, './tsconfig.e2e.json'),
    });
    retry.onPrepare();
  },
  onComplete: async () => {
    generateAccessibilityReport();
  },
  afterLaunch: () => {
    let passedTests = getPassedTestsArray();
    let totalTests = getTotalTestsArray();
    const failedTests = totalTests.filter((item) => !passedTests.includes(item));
    if (failedTests.length > 0) {
      console.log('Tests failed including retries: ' + failedTests);
      process.exit(1);
    } else {
      console.log(`Tests passed after retries. Number of total tests: ${totalTests.length}. Number of passed tests: ${passedTests.length}.`);
      process.exit(0);
    }
  },
};

function getTotalTestsArray() {
  let testCounterPath = `${process.cwd()}/e2e/testCounter.json`;
  try {
    const data = fs.readFileSync(testCounterPath, 'utf8');
    const counterData = JSON.parse(data);
    return counterData.totalTests;
  } catch (err) {
    console.error('Error reading file:', err);
    return [];
  }
}

function getPassedTestsArray() {
  let testCounterPath = `${process.cwd()}/e2e/testCounter.json`;
  try {
    const data = fs.readFileSync(testCounterPath, 'utf8');
    const counterData = JSON.parse(data);
    return counterData.passedTests;
  } catch (err) {
    console.error('Error reading file:', err);
    return [];
  }
}

exports.config = config;
