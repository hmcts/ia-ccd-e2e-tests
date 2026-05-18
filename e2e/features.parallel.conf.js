const tsNode = require('ts-node');
const path = require('path');
const iaConfig = require('./ia.conf');
const {generateAccessibilityReport} = require('../reporter/customReporter');
const retry = require('protractor-retry').retry;
const cucumberTaggedFiles = require('../cucumberTaggedFiles.json');
const {runAfterLaunch} = require("./support/hooks");

const chromeVersion = '123.0.6312.122';

export function getConfig(platform) {
    let chromeDriverPath;
    let chromeBinaryPath;
    switch (platform) {
        case 'mac':
            chromeDriverPath = `${process.cwd()}/chromedriver/mac-${chromeVersion}/chromedriver-mac-x64/chromedriver`;
            chromeBinaryPath = `${process.cwd()}/chrome/mac-${chromeVersion}/chrome-mac-x64/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing`;
            break;
        case 'win64':
            chromeDriverPath = `${process.cwd()}/chromedriver/win64-${chromeVersion}/chromedriver-win64/chromedriver.exe`
            chromeBinaryPath = `${process.cwd()}/chrome/win64-${chromeVersion}/chrome-win64/chrome.exe`;
            break;
        case 'linux':
            chromeDriverPath = `${process.cwd()}/chromedriver/linux-${chromeVersion}/chromedriver-linux64/chromedriver`;
            chromeBinaryPath = `${process.cwd()}/chrome/linux-${chromeVersion}/chrome-linux64/chrome`;
            break;
        default:
            throw new Error(`Unsupported platform: ${platform}`);
    }
    return {
        framework: 'custom',
        frameworkPath: require.resolve('protractor-cucumber-framework'),
        cucumberOpts: {
            require: ['./cucumber.conf.js', './features/stepDefinitions/**/*.steps.ts', './support/hooks.js'],
            keepAlive: false,
            tags: false,
            profile: false,
            'fail-fast': iaConfig.FailFast,
            format: ['html:./reports/tests/functional/results.html', 'json:./reports/tests/functional/results.json'],
            retry: parseInt(process.env.RETRIES || 3)
        },

        directConnect: true,
        chromeDriver: chromeDriverPath,

        specs: cucumberTaggedFiles,

        baseUrl: iaConfig.CcdWebUrl,
        allScriptsTimeout: 300000,
        getPageTimeout: 300000,
        useAllAngular2AppRoots: true,
        multiCapabilities: [
            {
                browserName: 'chrome',
                version: chromeVersion,
                chromeOptions: {
                    args: ['--disable-dev-shm-usage', '--disable-gpu', '--no-sandbox', iaConfig.UseHeadlessBrowser ? '--headless' : '--noop', iaConfig.UseHeadlessBrowser ? '--window-size=1920,1080' : '--noop'],
                    binary: chromeBinaryPath,
                },
                name: `ia-chrome-${platform}-test`,
                extendedDebugging: true,
                sharedTestFiles: iaConfig.RunWithNumberOfBrowsers > 1,
                shardTestFiles: iaConfig.RunWithNumberOfBrowsers > 1,
                capturePerformance: false,
                maxInstances: iaConfig.RunWithNumberOfBrowsers,
            },
        ],
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
                    pageFooter: '<div><p> </p></div>',
                },
            },
        ],

        onCleanUp(results, files) {
            retry.onCleanUp(results, files);
        },

        onPrepare: () => {
            const caps = browser.getCapabilities();
            browser.manage().window().maximize();
            browser.waitForAngularEnabled(true);

            tsNode.register({
                project: path.join(__dirname, './tsconfig.e2e.json'),
            });
            retry.onPrepare();
        },
        onComplete: async () => {
            await generateAccessibilityReport();
        },
        afterLaunch: () => runAfterLaunch()
    };
}
