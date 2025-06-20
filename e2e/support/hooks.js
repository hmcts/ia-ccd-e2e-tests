var { After, Before, BeforeAll} = require('cucumber');
var { browser } = require('protractor');
const fs = require('fs');
const path = require('path');
let count = 0;

BeforeAll(async function () {
  await createTestCounterIfNone();

});

Before(async function (scenario) {
  let test = `${scenario.sourceLocation.uri}:${scenario.sourceLocation.line}`;
  await createTestCounterIfNone();
  await addToTotalTestsIfNotExists(test);
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
    })
    try {
      await fs.writeFileSync(path.join(folderPath, `failedScreenshot${count}.png`), decodedImage, {encoding: 'base64'});
    } catch {
      await fs.mkdir(folderPath, { recursive: true }, (err) => {
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
    let test = `${scenario.sourceLocation.uri}:${scenario.sourceLocation.line}`;
    await addToPassedTests(test);
  }
});

async function addToTotalTestsIfNotExists(stringVar) {
  const testCounterPath = path.join(process.cwd(), 'e2e', 'testCounter.json');
  await fs.readFile(testCounterPath, 'utf8', async (err, data) => {
    if (err) {
      console.error('Error reading file:', err);
      return;
    }
    try {
      const counterData = JSON.parse(data);
      if (!counterData.totalTests.includes(stringVar)) {
        counterData.totalTests.push(stringVar);
        await fs.writeFile(testCounterPath, JSON.stringify(counterData, null, 2), 'utf8', (err) => {
          if (err) {
            console.error('Error writing file:', err);
            return;
          }
          console.log('String variable added to totalTests array:', stringVar);
        });
      }
    } catch (error) {
      console.error('Error parsing JSON:', error);
    }
  });
  sleep(1000);
}

async function addToPassedTests(stringVar) {
  const testCounterPath = path.join(process.cwd(), 'e2e', 'testCounter.json');
  await fs.readFile(testCounterPath, 'utf8', async (err, data) => {
    if (err) {
      console.error('Error reading file:', err);
      return;
    }
    try {
      const counterData = JSON.parse(data);
      counterData.passedTests.push(stringVar);
      await fs.writeFile(testCounterPath, JSON.stringify(counterData, null, 2), 'utf8', (err) => {
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
  sleep(1000);
}

function sleep(milliseconds) {
  let start = new Date().getTime();
  for (let i = 0; i < 1e7; i++) {
    if (new Date().getTime() - start > milliseconds) {
      break;
    }
  }
}

async function createTestCounterIfNone() {
  const filePath = path.join(process.cwd(), 'e2e', 'testCounter.json');
  const defaultContent = {
    totalTests: [],
    passedTests: [],
  };

  // Check if the file exists
  await fs.access(filePath, fs.constants.F_OK, async (err) => {
    if (err) {
      // File doesn't exist, create it with default content
      await fs.writeFile(filePath, JSON.stringify(defaultContent, null, 2), (err) => {
        if (err) {
          console.error('Error creating testCounter.json:', err);
        } else {
          console.log('testCounter.json created successfully.');
        }
      });
    } else {
      console.log('File already exists.');
    }
  });
}
