const tsNode = require('ts-node');
const _ = require('lodash');
const glob = require('glob');
const path = require('path');
const argv = require('yargs').argv;
const iaConfig = require('./ia.conf');
const {generateAccessibilityReport} = require("../reporter/customReporter");
const {getTestCasesFromFilesystem, PickleFilter} = require("cucumber");
const retry = require('protractor-retry').retry;
const cucumberTaggedFiles = require('../cucumberTaggedFiles.json');

const {
  EventEmitter
} = require('events');
const eventBroadcaster = new EventEmitter();

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
    retry: 0
  },

  sauceSeleniumAddress: 'ondemand.eu-central-1.saucelabs.com:443/wd/hub',
  host: 'ondemand.eu-central-1.saucelabs.com',
  sauceRegion: 'eu',
  port: 80,
  directConnect: true,
  sauceUser: process.env.SAUCE_USERNAME,
  sauceKey: process.env.SAUCE_ACCESS_KEY,
  SAUCE_REST_ENDPOINT: 'https://eu-central-1.saucelabs.com/rest/v1/',

  specs: cucumberTaggedFiles,

  baseUrl: iaConfig.CcdWebUrl,
  allScriptsTimeout: 240000,
  useAllAngular2AppRoots: true,
  multiCapabilities: [{
    browserName: 'firefox',
    version: 'latest',
    platform: 'macOS 10.13',
    name: 'ia-firefox-mac-test',
    'moz:firefoxOptions': {
      binary: '/firefox/linux-nightly_127.0a1/firefox/firefox'
    },
    tunnelIdentifier: process.env.TUNNEL_IDENTIFIER || 'reformtunnel',
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
    return browser.getProcessedConfig().then(function (c) {
      return browser.getSession().then(function (session) {
        // required to be here so saucelabs picks up reports to put in jenkins
        console.log('SauceOnDemandSessionID=' + session.getId() + ' job-name=ia-ccd-e2e-tests');
      });
    });
  }
};

exports.config = config;