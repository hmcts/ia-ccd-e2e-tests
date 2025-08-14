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
        require: ['./cucumber.crossbrowser.conf.js', './features/stepDefinitions/**/*.steps.ts'],
        keepAlive: false,
        tags: false,
        profile: false,
        'fail-fast': iaConfig.FailFast,
        'nightly-tag': iaConfig.NightlyTag,
        'no-source': true,
        strict: true,
        format: ['node_modules/cucumber-pretty', 'json:./cb_reports/saucelab_results.json'],
        retry: 1,
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
        updatePassedTests()
        let passedTests = getTestsArray('passedTests');
        let totalTests = getTestsArray('totalTests');
        const failedTests = totalTests.filter((item) => !passedTests.includes(item));
        console.log(passedTests, totalTests, failedTests);
        if (failedTests.length > 0) {
            console.log('Tests failed. Retrying. Failed tests: ' + failedTests);
            return retry.afterLaunch(1);
        } else {
            console.log('Tests passed.');
            process.exit(0);
        }
    }
};

function updatePassedTests() {
    const filePath = path.join(__dirname, '../reports/tests/crossbrowser/enriched-output.json');
    try {
        const data = fs.readFileSync(filePath, 'utf8');
        const jsonData = JSON.parse(data);
        if (jsonData && jsonData.features && typeof jsonData.features === 'object') {
            jsonData.features.forEach((feature => {
                addToTestsIfNotExists('totalTests', `${feature.metadata.browser.name}-${feature.metadata.platform.name}`);
                if (!feature.isFailed) {
                    addToTestsIfNotExists('passedTests', `${feature.metadata.browser.name}-${feature.metadata.platform.name}`);
                }
            }))
        } else {
            console.error('"features" not found in the file.');
        }
    } catch (err) {
        console.error('Error reading or parsing the file:', err);
    }
}

function getTestsArray(object) {
    let testCounterPath = `${process.cwd()}/e2e/testCounter.json`;
    try {
        const data = fs.readFileSync(testCounterPath, 'utf8');
        const counterData = JSON.parse(data);
        return counterData[object];
    } catch (err) {
        console.error('Error reading file:', err);
        return [];
    }
}

function addToTestsIfNotExists(object, stringVar) {
    const testCounterPath = path.join(process.cwd(), 'e2e', 'testCounter.json');
    const data = fs.readFileSync(testCounterPath, 'utf8');
    try {
        const counterData = JSON.parse(data);
        if (!counterData[object].includes(stringVar)) {
            counterData[object].push(stringVar);
            fs.writeFileSync(testCounterPath, JSON.stringify(counterData, null, 2), 'utf8');
        }
    } catch (error) {
        console.error('Error parsing JSON:', error);
    }
}

exports.config = config;
