const {After, Before, BeforeAll, AfterAll} = require('@cucumber/cucumber');
const {browser} = require('protractor');
const fs = require('fs');
const path = require('path');
let count = 0;
let testData;

Before(async function (scenario) {
    let test = `${scenario.pickle.uri}:${scenario.pickle.name}`;
    if (!testData) {
        testData = {
            totalTests: [test],
            passedTests: []
        }
    } else if (!testData.totalTests.includes(test)) {
        testData.totalTests.push(test);
    }
});

After(async function (scenario) {
    console.log(`Scenario results are ################ ${scenario.result.status}`);
    if (scenario.result.status.toLowerCase() === 'failed') {
        count++;
        const stream = await browser.takeScreenshot();
        const decodedImage = new Buffer(stream.replace(/^data:image\/(png|gif|jpeg);base64,/, ''), 'base64');
        this.attach(decodedImage, 'image/png');
        let folderPath = `${process.cwd()}/reports/tests/failedScreenshots/${scenario.pickle.name}`;
        await fs.mkdir(folderPath, {recursive: true}, (err) => {
            if (err) {
                console.error(`Error creating failed screenshot folder: ${scenario.pickle.name}`, err);
            }
        })
        try {
            await fs.writeFileSync(path.join(folderPath, `failedScreenshot${count}.png`), decodedImage, {encoding: 'base64'});
        } catch {
            await fs.mkdir(folderPath, {recursive: true}, (err) => {
                if (err) {
                    console.error(`Error creating failed screenshot folder: ${scenario.pickle.name}`, err);
                }
            })
            try {
                await fs.writeFileSync(path.join(folderPath, `failedScreenshot${count}.png`), decodedImage, {encoding: 'base64'});
            } catch {
                console.error(`Error writing failed screenshot ${count} for scenario: ${scenario.pickle.name}`);
            }
        }
        const browserLogPath = `${process.cwd()}/reports/tests/functional`;
        await fs.mkdir(browserLogPath, {recursive: true}, (err) => {
            if (err) {
                console.error(`Error creating browser log folder`, err);
            }
        })
        //fetch browser logs
        let browserLog = await browser.manage().logs().get('browser');
        let browserErrorLogs = [];
        for (let browserLogCounter = 0; browserLogCounter < browserLog.length; browserLogCounter++) {
            if (browserLog[browserLogCounter].level.value > 900) {
                browserErrorLogs.push(browserLog[browserLogCounter]);
            }
        }
        try {
            await fs.writeFileSync(path.join(browserLogPath, `${scenario.pickle.name}-browser-logs.log`), browserErrorLogs);
        } catch {
            console.error(`Error writing browser logs for scenario: ${scenario.pickle.name}`);
        }
    }
    if (scenario.result.status.toLowerCase() === 'passed') {
        let test = `${scenario.pickle.uri}:${scenario.pickle.name}`;
        if (!testData.passedTests.includes(test)) {
            testData.passedTests.push(test);
        }
    }
});

AfterAll(async function () {
    const sessionId = process.pid
    const testCounterPath = path.join(process.cwd(), 'e2e', `testCounter-${sessionId}.json`);
    const dir = path.dirname(testCounterPath);
    await fs.mkdir(dir, {recursive: true}, async (err) => {
        if (err) {
            console.error('Error creating directory:', err);
        }
    });
    const dataString = JSON.stringify(testData, null, 2)
    await fs.writeFile(testCounterPath, dataString, 'utf8', (err) => {
        if (err) {
            console.error('Error creating file:', err);
        }
    });
});
