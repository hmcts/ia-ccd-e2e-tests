var EC = protractor.ExpectedConditions;

class BrowserWaits {
  constructor() {
    this.waitTime = 30000;
  }

  async waitForSeconds(waitInSec) {
    await browser.sleep(waitInSec * 1000);
  }

  async waitForElement(element, message) {
    await browser.wait(EC.visibilityOf(element), this.waitTime, 'Error : ' + element.locator().toString() + ' => ' + message);
  }

  async waitForCondition(condition) {
    await browser.wait(condition(), this.waitTime);
  }
  async waitForelementToBeClickable(element) {
    await browser.executeScript('arguments[0].scrollIntoView()', element.getWebElement());
    await browser.wait(EC.elementToBeClickable(element), this.waitTime, 'Error : ' + element.locator().toString());
  }
}

module.exports = new BrowserWaits();
