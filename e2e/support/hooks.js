var { After, AfterAll} = require('cucumber');
var { browser } = require('protractor');
const fs = require('fs');
const path = require('path');
const { setup, onPrepare, postResults } = require('protractor-multiple-cucumber-html-reporter-plugin');

let count = 0;
let retryCount =  process.env.RETRIES || 5
After(async function (scenario) {
  console.log(`Scenario results are ################ ${scenario.result.status}`);
  if (scenario.result.status === 'failed') {
    if (count === parseInt(retryCount)) {
      global.failed = true;
    }
    count++;
    const stream = await browser.takeScreenshot();
    const decodedImage = new Buffer(stream.replace(/^data:image\/(png|gif|jpeg);base64,/, ''), 'base64');
    this.attach(decodedImage, 'image/png');
    let folderPath = `${process.cwd()}/reports/tests/failedScreenshots/${scenario.pickle.name}`;
    fs.mkdir(folderPath, { recursive: true }, (err) => {
      if (err) {
        console.error(`Error creating failed screenshot folder: ${scenario.pickle.name}`, err);
      }
    });
    fs.writeFileSync(path.join(folderPath, `failedScreenshot${count}.png`), decodedImage, { encoding: 'base64' });

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
});

AfterAll(async function () {
  // await setup();
  // await onPrepare();
  // await postResults();
  // if (global.failed === true) {
  //   console.log('Tests failed including retries.');
  //   process.exit(1);
  // } else {
  //   console.log('Tests passed after retries.');
  //   process.exit(0);
  // }
});
