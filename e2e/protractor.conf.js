const { SpecReporter } = require('jasmine-spec-reporter');
const puppeteer = require('puppeteer');
const iaConfig = require('./ia.conf');

exports.config = {

  baseUrl: iaConfig.CcdWebUrl,
  specs: ['./**/*.spec.ts'],

  capabilities: {
    browserName: 'chrome',
    chromeOptions: {
      args: [
        '--disable-dev-shm-usage',
        '--disable-gpu',
        '--no-sandbox',
        iaConfig.UseHeadlessBrowser ? '--headless' : '--noop'
      ],
      binary: puppeteer.executablePath()
    },
    acceptInsecureCerts: true,
    maxInstances: 1,
    proxy: (!iaConfig.UseProxy) ? {} : {
      proxyType: 'manual',
      httpProxy: iaConfig.UseProxy.replace('http://', ''),
      sslProxy: iaConfig.UseProxy.replace('http://', '')
    },
    loggingPrefs: {
      'driver': 'INFO',
      'browser': 'INFO'
    }
  },

  directConnect: true,
  useAllAngular2AppRoots: true,

  // this causes issues with test failing
  // so do not enable it unless all tests pass
  // on a variety of environments first :)
  restartBrowserBetweenTests: false,

  framework: 'jasmine2',
  jasmineNodeOpts: {
    defaultTimeoutInterval: 60000,
    includeStackTrace: true,
    isVerbose: true,
    showColors: true,
    showTiming: true,
    print: function() {
      /* disable dot-printer*/
    }
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

    require('ts-node').register({
      project: require('path').join(__dirname, './tsconfig.e2e.json')
    });

    jasmine
      .getEnv()
      .addReporter(new SpecReporter({
        spec: {
          displayStacktrace: true
        }
      }));
  }
};
