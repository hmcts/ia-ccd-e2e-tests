var { After, Before} = require('cucumber');
var { browser } = require('protractor');
const fs = require('fs');
const path = require('path');
let count = 0;

Before(async function (scenario) {
  let test = `${scenario.sourceLocation.uri}:${scenario.sourceLocation.line}`
  addToTotalTestsIfNotExists(test);
});

After(async function (scenario) {
  console.log(`Scenario results are ################ ${scenario.result.status}`);
  if (scenario.result.status === 'failed') {
    count++;
    const stream = await browser.takeScreenshot();
    const decodedImage = new Buffer(stream.replace(/^data:image\/(png|gif|jpeg);base64,/, ''), 'base64');
    this.attach(decodedImage, 'image/png');
    let folderPath = `${process.cwd()}/reports/tests/failedScreenshots/${scenario.pickle.name}`;
    await fs.mkdir(folderPath, { recursive: true }, (err) => {
      if (err) {
        console.error(`Error creating failed screenshot folder: ${scenario.pickle.name}`, err);
      }
    });
    await fs.writeFileSync(path.join(folderPath, `failedScreenshot${count}.png`), decodedImage, { encoding: 'base64' });

    //fetch browser logs
    let browserLog = await browser.manage().logs().get('browser');
    let browserErrorLogs = [];
    for (let browserLogCounter = 0; browserLogCounter < browserLog.length; browserLogCounter++) {
      if (browserLog[browserLogCounter].level.value > 900) {
        browserErrorLogs.push(browserLog[browserLogCounter]);
      }
    }
    try {
      this.attach(JSON.stringify(browserErrorLogs, null, 2));
    } catch (err) {
      console.log('Error occurred adding message to report. ' + err.stack);
    }
  }
  if (scenario.result.status === 'passed') {
    let test = `${scenario.sourceLocation.uri}:${scenario.sourceLocation.line}`
    addToPassedTests(test);
  }
});

function addToTotalTestsIfNotExists(stringVar) {
  let testCounterPath = `${process.cwd()}/e2e/testCounter.json`
  fs.readFile(testCounterPath, 'utf8', (err, data) => {
    if (err) {
      console.error('Error reading file:', err);
      return;
    }
    try {
      const counterData = JSON.parse(data);
      if (!counterData.totalTests.includes(stringVar)) {
        counterData.totalTests.push(stringVar);
        fs.writeFile(testCounterPath, JSON.stringify(counterData, null, 2), 'utf8', (err) => {
          if (err) {
            console.error('Error writing file:', err);
            return;
          }
          console.log('String variable added to totalTests array:', stringVar);
        });
      } else {
        console.log('String variable already exists in totalTests array:', stringVar);
      }
    } catch (error) {
      console.error('Error parsing JSON:', error);
    }
  });
}

function addToPassedTests(stringVar) {
  let testCounterPath = `${process.cwd()}/e2e/testCounter.json`
  fs.readFile(testCounterPath, 'utf8', (err, data) => {
    if (err) {
      console.error('Error reading file:', err);
      return;
    }
    try {
      const counterData = JSON.parse(data);
      counterData.passedTests.push(stringVar);
      fs.writeFile(testCounterPath, JSON.stringify(counterData, null, 2), 'utf8', (err) => {
        if (err) {
          console.error('Error writing file:', err);
          return;
        }
        console.log('String variable added to passedTests array:', stringVar);
      });
    } catch (error) {
      console.error('Error parsing JSON:', error);
    }
  });
}