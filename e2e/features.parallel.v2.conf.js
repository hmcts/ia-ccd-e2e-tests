const tsNode = require('ts-node');
const path = require('path');
const iaConfig = require('./ia.conf');
const { generateAccessibilityReport } = require('../reporter/customReporter');
const retry = require('protractor-retry').retry;
const cucumberTaggedFiles = require('../cucumberTaggedFiles.json');

let chromeVersion = '123.0.6312.122';

let config = {
  params: {
    totalTests: [],
    passedTests: []
  },
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
    retry: process.env.RETRIES || 5,
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
      version: '115.0.5790.170',
      platform: 'macOS 10.13',
      chromeOptions: {
        args: ['--disable-dev-shm-usage', '--disable-gpu', '--no-sandbox', iaConfig.UseHeadlessBrowser ? '--headless' : '--noop', iaConfig.UseHeadlessBrowser ? '--window-size=1920,1080' : '--noop'],
        binary: process.cwd() + '/chrome/linux-' + chromeVersion + '/chrome-linux64/chrome',
      },
      name: 'ia-chrome-mac-test',
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

  onPrepare: async () => {
    const caps = browser.getCapabilities();
    browser.manage().window().maximize();
    browser.waitForAngularEnabled(true);

    tsNode.register({
      project: path.join(__dirname, './tsconfig.e2e.json'),
    });
    retry.onPrepare();
  },
  onComplete: async () => {
    await generateAccessibilityReport();
  },
  afterLaunch: async () => {
    console.log('afterLaunch Total tests: ' + this.params.totalTests);
    console.log('afterLaunch Passed tests: ' + this.params.passedTests);
    if (this.passedTests.length !== this.totalTests.length) {
      const failedTests = this.totalTests.filter(item => !this.passedTests.includes(item));
      console.log('Tests failed including retries: ' + failedTests);
      process.exit(1);
    } else {
      console.log('Tests passed after retries.');
      process.exit(0);
    }
  },
};

exports.config = config;
