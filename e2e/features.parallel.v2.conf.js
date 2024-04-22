const tsNode = require('ts-node');
const path = require('path');
const iaConfig = require('./ia.conf');
const {generateAccessibilityReport} = require("../reporter/customReporter");
const retry = require('protractor-retry').retry;
const cucumberTaggedFiles = require('../cucumberTaggedFiles.json');

let chromeVersion = '123.0.6312.122'

let config = {
  framework: 'custom',
  frameworkPath: require.resolve('protractor-cucumber-framework'),
  cucumberOpts: {
    require: [
      './cucumber.conf.js',
      './features/stepDefinitions/**/*.steps.ts',
      './support/hooks.js'
    ],
    keepAlive: false,
    tags: false,
    profile: false,
    'fail-fast': iaConfig.FailFast,
    'nightly-tag': iaConfig.NightlyTag,
    'no-source': true,
    strict: true,
    format: ['node_modules/cucumber-pretty', 'json:./cb_reports/saucelab_results.json'],
    retry: 5
  },

  directConnect: true,
  chromeDriver: process.cwd() + '/chromedriver/linux-' + chromeVersion + '/chromedriver-linux64/chromedriver',

  specs: cucumberTaggedFiles,

  baseUrl: iaConfig.CcdWebUrl,
  allScriptsTimeout: 120000,
  getPageTimeout: 120000,
  useAllAngular2AppRoots: true,
  multiCapabilities: [{
    browserName: 'chrome',
    version: '115.0.5790.170',
    platform: 'macOS 10.13',
    chromeOptions: {
      args: [
        '--disable-dev-shm-usage',
        '--disable-gpu',
        '--no-sandbox',
        iaConfig.UseHeadlessBrowser ? '--headless' : '--noop',
        iaConfig.UseHeadlessBrowser ? '--window-size=1920,1080' : '--noop'
      ],
      binary: process.cwd() + '/chrome/linux-' + chromeVersion + '/chrome-linux64/chrome'
    },
    name: 'ia-chrome-mac-test',
    extendedDebugging: true,
    sharedTestFiles: (iaConfig.RunWithNumberOfBrowsers > 1),
    shardTestFiles: (iaConfig.RunWithNumberOfBrowsers > 1),
    capturePerformance: false,
    maxInstances: iaConfig.RunWithNumberOfBrowsers
  }],
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
        pageFooter: '<div><p> </p></div>'
      }
    }
  ],

  onCleanUp(results,files) {
    retry.onCleanUp(results, files);
  },

  onPrepare: async() => {
    const caps = browser.getCapabilities();
    browser.manage()
      .window()
      .maximize();
    browser.waitForAngularEnabled(true);

    tsNode.register({
      project: path.join(__dirname, './tsconfig.e2e.json')
    });
    retry.onPrepare();
  },
  // afterLaunch() {
  //   return retry.afterLaunch(1);
  // },
  onComplete() {
    generateAccessibilityReport();
  }
};

exports.config = config;