import { CcdFormPage } from '../pages/ccd-form.page';
import { element, by, browser } from "protractor";
import { expect } from "chai";

export class HearingBundleFlow {
  private ccdFormPage = new CcdFormPage();

  async generateHearingBundle(clickContinue = false) {
    await this.ccdFormPage.selectNextStep('Generate hearing bundle');

    let currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('Submit');

    await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);

    const locator = '//p[contains(text(), "The hearing bundle is being generated")]';
    await browser.wait(
      async () => element(by.xpath(locator)).isPresent(),
      30000,
      `Expected ${locator} to be present in DOM within 30 seconds`
    );
    expect(await element(by.xpath(locator)).isPresent()).to.equal(true);
    currentUrl = await this.ccdFormPage.getCurrentUrl();
    let hasBundleBeenGenerated = await this.ccdFormPage.verifyHiddenByXpath(locator);
    while (!hasBundleBeenGenerated) {
      await browser.sleep(5000);
      await browser.refresh();
      await browser.get(currentUrl);
      await this.ccdFormPage.waitForOverviewPage(this.ccdFormPage.getStoredCaseUrl());
      hasBundleBeenGenerated = await this.ccdFormPage.verifyHiddenByXpath(locator);
    }
  }
}
