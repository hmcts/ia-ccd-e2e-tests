const _ = require('lodash');
const glob = require('glob');
const argv = require('yargs').argv;
const retry = require('protractor-retry').retry;
const {
  PickleFilter,
  getTestCasesFromFilesystem
} = require('cucumber');
const {
  EventEmitter
} = require('events');
const eventBroadcaster = new EventEmitter();

const {generateAccessibilityReport} = require('../reporter/customReporter');
const puppeteer = require('puppeteer');
const iaConfig = require('./ia.conf');
const tsNode = require('ts-node');
const path = require('path');

let capabilities = {
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
};

class BaseConfig {
  constructor() {
    this.baseUrl = iaConfig.CcdWebUrl;
    this.allScriptsTimeout = 120000;
    this.getPageTimeout = 120000;
    if (argv.parallelFeatures || argv.parallelScenarios) {
      this.maxSessions = parseInt(iaConfig.RunWithNumberOfBrowsers, 10);
      this.getMultiCapabilities = () => {
        let self = this;
        return this.getFeaturesByTagExpression().then((results) => {
          let files;
          console.log("List of tests to run : " + JSON.stringify(results, null, 2));
          if (argv.parallelFeatures) {
            files = results.features;
          } else {
            files = results.scenarios;
          }
          return _.map(files, function (file, i) {
            let featureFile = file.replace(/^e2e/, ".");
            let config = {
              specs: featureFile,
              shardTestFiles: true,
              maxInstances: 1
            };
            return _.merge(config, capabilities);
          });
        });
      };
    } else {
      this.specs = './features/*.feature';
      this.capabilities = capabilities;
    }

    this.disableChecks = true;
    this.ignoreUncaughtExceptions = true;
    this.directConnect = true;
    this.useAllAngular2AppRoots = true;

    // this causes issues with test failing
    // so do not enable it unless all tests pass
    // on a variety of environments first :)
    this.restartBrowserBetweenTests = false;

    this.framework = 'custom';
    this.frameworkPath = require.resolve('protractor-cucumber-framework');

    this.cucumberOpts = {
      strict: true,
      format: ['node_modules/cucumber-pretty', 'json:reports/tests/functionTestResult.json'],
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
      retry: 10
    };

    this.onCleanUp = (results) => {
      //retry.onCleanUp(results);
    }

    this.onPrepare = () => {
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

      //retry.onPrepare();
    };

    //this.afterLaunch = () => {
      //return retry.afterLaunch(0);
    //}

    this.onComplete = () => {
       generateAccessibilityReport();
    };

    this.plugins = [
      {
          package: 'protractor-multiple-cucumber-html-reporter-plugin',
          options: {
              automaticallyGenerateReport: true,
              removeExistingJsonReportFile: true,
              saveCollectedJSON: true,
              reportName: 'IAC CCD E2E Tests',
              jsonDir: 'reports/tests/functional',
              reportPath: 'reports/tests/functional',
              pageFooter: '<div><p> </p></div>'
          }
      }
  ]
  }

  /*
   * Returns all feature files that match pattern
   */
  getFeatures() {
    let filesGlob = 'e2e/features/**/*.feature';
    let files = glob.sync(filesGlob);
    return _.sortedUniq(files);
  }

  /*
   * Use cucumber built in methods
   * to filter features based on expression
   */
  getFeaturesByTagExpression() {
    return getTestCasesFromFilesystem({
      cwd: '',
      eventBroadcaster: eventBroadcaster,
      featurePaths: this.getFeatures(),
      pickleFilter: new PickleFilter({
        tagExpression: this.getCucumberCliTags()
      }),
      order: 'defined'
    }).then(function (results) {
      let features = [];
      let scenarios = [];
      _.forEach(results, function (result) {
        if (argv.parallelFeatures) {
          features.push(result.uri);
        } else {
          let lineNumber = result.pickle.locations[0].line;
          let uri = result.uri;
          let scenario = `${uri}:${lineNumber}`;
          scenarios.push(scenario);
        }
      });

      return {
        features: _.sortedUniq(features),
        scenarios: scenarios
      };
    });
  }

  getCucumberCliTags() {
    let cucumberOptsTags = _.get(argv, 'cucumberOpts.tags');
    if (typeof cucumberOptsTags === 'string' || cucumberOptsTags instanceof String) {
      console.log("cucumber opts tags : " + cucumberOptsTags);
      return cucumberOptsTags;
    } else {
      console.log("cucumber opts tags : " + cucumberOptsTags);
      return cucumberOptsTags.join(" or ") || '';
    }
  }

}


exports.config = new BaseConfig();
