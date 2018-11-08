/* eslint-disable no-negated-condition, multiline-ternary */

const puppeteer = require('puppeteer');
const iaConfig = require('./ia.conf');
const tsNode = require('ts-node');
const path = require('path');

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
        iaConfig.UseHeadlessBrowser ? '--headless' : '--noop',
        iaConfig.UseHeadlessBrowser ? '--window-size=1920,1080' : '--noop'
      ],
      binary: puppeteer.executablePath()
    },
    acceptInsecureCerts: true,
    maxInstances: iaConfig.RunWithNumberOfBrowsers,
    proxy: (!iaConfig.UseProxy) ? null : {
      proxyType: 'manual',
      httpProxy: iaConfig.ProxyUrl.replace('http://', ''),
      sslProxy: iaConfig.ProxyUrl.replace('http://', '')
    },
    loggingPrefs: {
      driver: 'INFO',
      browser: 'INFO'
    },
    shardTestFiles: (iaConfig.RunWithNumberOfBrowsers > 1)
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
      './cucumber.conf.js',
      './features/stepDefinitions/**/*.steps.ts'
    ],
    keepAlive: false,
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
      .then({
        // noop
      });

    tsNode.register({
      project: path.join(__dirname, './tsconfig.e2e.json')
    });
  }
};
