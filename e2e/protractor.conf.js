const { SpecReporter } = require('jasmine-spec-reporter');
const puppeteer = require('puppeteer');

exports.config = {

  baseUrl: 'https://angularjs.org',
  specs: ['./specs/todo-spec.js'],

  capabilities: {
    browserName: 'chrome',
    chromeOptions: {
      args: [
        '--headless',
        '--no-sandbox',
        '--disable-dev-shm-usage'
      ],
      binary: puppeteer.executablePath(),
    },
    acceptInsecureCerts: true,
    maxInstances: 1
  },

  useAllAngular2AppRoots: true,

  framework: 'jasmine2',
  jasmineNodeOpts: {
    defaultTimeoutInterval: 120000,
    includeStackTrace: false,
    isVerbose: false,
    showColors: true,
    showTiming: true,
    print: function () { /* disable dot-printer*/ }
  },

  plugins: [{
    package: 'protractor-screenshoter-plugin',
    screenshotPath: './functional-output/e2e',
    screenshotOnExpect: 'failure+success',
    screenshotOnSpec: 'none',
    withLogs: true,
    writeReportFreq: 'asap',
    verbose: 'info',
    imageToAscii: 'none',
    clearFoldersBeforeTest: true
  }],

  onPrepare() {

    // returning the promise makes protractor wait for
    // the reporter config before executing tests
    global
      .browser
      .getProcessedConfig()
      .then(function(config) {
        // noop
      });

    jasmine
      .getEnv()
      .addReporter(new SpecReporter({
        spec: {
          displayStacktrace: false
        }
      }));

    return browser.get('/');
  }
};
