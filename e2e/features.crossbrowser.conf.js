const tsNode = require('ts-node');
const path = require('path');
const minimist = require('minimist');
const argv = minimist(process.argv.slice(2));
const iaConfig = require('./ia.conf');
const browserPlatformMatrix = require('./browser.platform.matrix');
const retry = require('protractor-retry').retry;

const config = {
  framework: 'custom',
  frameworkPath: require.resolve('protractor-cucumber-framework'),
  cucumberOpts: {
    require: [
      './cucumber.crossbrowser.conf.js',
      './features/stepDefinitions/**/*.steps.ts'
    ],
    keepAlive: false,
    tags: false,
    profile: false,
    'fail-fast': iaConfig.FailFast,
    'nightly-tag': iaConfig.NightlyTag,
    'no-source': true,
    strict: true,
    format: ['node_modules/cucumber-pretty', 'json:./cb_reports/saucelab_results.json'],
  },

  sauceSeleniumAddress: 'ondemand.eu-central-1.saucelabs.com:443/wd/hub',
  host: 'ondemand.eu-central-1.saucelabs.com',
  sauceRegion: 'eu',
  port: 80,
  sauceConnect: true,
  sauceUser: process.env.SAUCE_USERNAME,
  sauceKey: process.env.SAUCE_ACCESS_KEY,
  SAUCE_REST_ENDPOINT: 'https://eu-central-1.saucelabs.com/rest/v1/',

  specs: ['./features/*.feature'],
  baseUrl: iaConfig.CcdWebUrl,
  allScriptsTimeout: 220000,
  useAllAngular2AppRoots: true,
  multiCapabilities: browserPlatformMatrix.multiCapabilities,
  maxSessions: 4,

  plugins: [
    {
      package: 'protractor-multiple-cucumber-html-reporter-plugin',
      options: {
        saveCollectedJSON: true,
        automaticallyGenerateReport: true,
        removeExistingJsonReportFile: false,
        reportName: 'IA Service Cross Browser Test',
        jsonDir: 'reports/tests/crossbrowser',
        reportPath: 'reports/tests/crossbrowser',
        pageFooter: '<div><p> </p></div>'
      }
    }
  ],

  onCleanUp(results,files) {
    retry.onCleanUp(results, files);
  },

  onPrepare() {
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
  afterLaunch() {
    return retry.afterLaunch(1);
  },
  onComplete() {
    return browser.getProcessedConfig().then(function (c) {
      return browser.getSession().then(function (session) {
        // required to be here so saucelabs picks up reports to put in jenkins
        console.log('SauceOnDemandSessionID=' + session.getId() + ' job-name=ia-ccd-e2e-tests');
      });
    });
  }
};


exports.config = config;