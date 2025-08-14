const tsNode = require('ts-node');
const path = require('path');
const minimist = require('minimist');
const argv = minimist(process.argv.slice(2));
const iaConfig = require('./ia.conf');
const browserPlatformMatrix = require('./browser.platform.matrix');
const fs = require("fs");
const retry = require('protractor-retry').retry;

const config = {
    framework: 'custom',
    frameworkPath: require.resolve('protractor-cucumber-framework'),
    cucumberOpts: {
        require: ['./cucumber.crossbrowser.conf.js', './features/stepDefinitions/**/*.steps.ts', './support/hooks.js'],
        keepAlive: false,
        tags: false,
        profile: false,
        'fail-fast': iaConfig.FailFast,
        'nightly-tag': iaConfig.NightlyTag,
        'no-source': true,
        strict: true,
        format: ['node_modules/cucumber-pretty', 'json:./cb_reports/saucelab_results.json'],
        retry: 0,
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
    allScriptsTimeout: 240000,
    useAllAngular2AppRoots: true,
    multiCapabilities: browserPlatformMatrix.multiCapabilities,
    maxSessions: 1,

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
                pageFooter: '<div><p> </p></div>',
            },
        },
    ],

    onPrepare() {
        const caps = browser.getCapabilities();
        browser.manage().window().maximize();
        browser.waitForAngularEnabled(true);

        tsNode.register({
            project: path.join(__dirname, './tsconfig.e2e.json'),
        });
        retry.onPrepare();
    },
    onComplete() {
        return browser.getProcessedConfig().then(function (c) {
            return browser.getSession().then(function (session) {
                // required to be here so saucelabs picks up reports to put in jenkins
                console.log('SauceOnDemandSessionID=' + session.getId() + ' job-name=ia-ccd-e2e-tests');
            });
        });
    },

    onCleanUp(results, files) {
        retry.onCleanUp(results, files);
    },

    afterLaunch() {
        let passedTests = getPassedTestsArray();
        let totalTests = getTotalTestsArray();
        const failedTests = totalTests.filter((item) => !passedTests.includes(item));
        if (failedTests.length > 0) {
            console.log('Tests failed: ' + failedTests);
            console.log('Retrying...')
            return retry.afterLaunch(1);
        } else {
            console.log(`Tests passed after retries. Number of total tests: ${totalTests.length}. Number of passed tests: ${passedTests.length}.`);
            process.exit(0);
        }
    }
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
