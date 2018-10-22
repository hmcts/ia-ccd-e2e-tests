const puppeteer = require('puppeteer');
const iaConfig = require('./ia.conf');

exports.config = {

  baseUrl: iaConfig.CcdWebUrl,
  specs: ['./features/*.feature'],

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

  framework: 'custom',
  frameworkPath: require.resolve('protractor-cucumber-framework'),

  cucumberOpts: {
    require: [
      './features/stepDefinitions/**/*.steps.ts'
    ],
    tags: false,
    profile: false,
    'no-source': true
  },

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
  }
};
