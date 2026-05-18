import { CcdPage } from '../pages/ccd.page';
import { CcdFormPage } from '../pages/ccd-form.page';
import { browser, by, element } from 'protractor';
import CaseHelper from "../helpers/CaseHelper";

export class PayAndSubmitAppealFlow {
  private ccdPage = new CcdPage();
  private ccdFormPage = new CcdFormPage();

  async payForAppealByPBA() {
    await element(by.xpath('//div[text()="Service Request"][contains(@class, "mat-tab-label-content")]')).click();
    console.log('Clicked on Service Request tab');
    await this.ccdPage.waitForCssElementVisible('td.govuk-table__cell > a.ng-star-inserted');
    console.log('css element visible after clicking on Service Request tab');
    await this.ccdFormPage.click('Pay now');
    console.log('Clicked on Pay now button');
    try {
      await this.ccdPage.waitForXpathElementVisible('//*[contains(text(), "Pay fee using Payment by Account")]');
      console.log('pay fee using payment by account text visible');
    } catch {
      await this.ccdFormPage.click('Pay now');
      console.log('Clicked on Pay now button again after failure');
      await this.ccdPage.waitForXpathElementVisible('//*[contains(text(), "Pay fee using Payment by Account")]');
      console.log('pay fee using payment by account text visible after clicking Pay now again');
    }
    await this.ccdFormPage.click('Pay fee using Payment by Account (PBA)');
    console.log('Clicked on pay by pba link');
    await this.ccdPage.waitForCssElementVisible('#pbaAccountNumber');
    console.log('pba account number field visible');
    await this.ccdFormPage.typeText('pbaAccountNumber', 'PBA0087412');
    console.log('pba account number filled in');
    await browser.sleep(1000);
    await this.ccdFormPage.typeText('pbaAccountRef', 'Unique Reference');
    console.log('pba account reference filled in');
    await this.ccdFormPage.typeEnter('pbaAccountRef');
    console.log('pba account enter key pressed');
    const confirmPaymentButton = element(by.css('button.pba-payments-19-font'));
    await confirmPaymentButton.click();
    console.log('Confirm payment button clicked');
    await this.ccdPage.waitForCssElementVisible('div.pba-payments--confirmation');
    console.log('confirmation message visible');
    await this.ccdPage.click('View service requests');
    console.log('view service requests link clicked');
    await this.ccdPage.click('Overview');
    console.log('overview tab clicked');
    await this.waitForPaymentRecognition();
  }

  async waitForPaymentRecognition() {
    const currentUrl = await this.ccdPage.getCaseUrl();
    const nextStepPath = '//select[@id="next-step"]';
    const appealDetailsPath = '//h2[contains(text(), "Appeal details")]';
    if (!currentUrl.includes('preview')) {
      let isPaymentPending = true;
      while (isPaymentPending) {
        await browser.sleep(10000);
        await this.ccdPage.refresh();
        await this.ccdPage.goToUrl(currentUrl);
        try {
          await this.ccdPage.waitForXpathElementVisible(nextStepPath);
        } catch {
          await this.ccdPage.goToUrl(currentUrl);
          await this.ccdPage.waitForXpathElementVisible(nextStepPath);
        }
        await this.ccdPage.gotoTabs('Appeal');
        await this.ccdPage.waitForXpathElementVisible(appealDetailsPath);

        const isPaymentPendingCount: number = await element
          .all(by.xpath('//span[contains(text(), "Payment pending")]'))
          .filter(async e => await e.isPresent())
          .count();
        isPaymentPending = isPaymentPendingCount > 0;
      }
    }
  }

  async createServiceRequest() {
    await this.ccdFormPage.selectNextStep('Create a service request');
    console.log('Selected Create a service request next step');
    await this.ccdFormPage.headingContains('Pay for this appeal');
    console.log('Heading contains Pay for this appeal');
    const currentUrl = await browser.getCurrentUrl();
    await this.ccdFormPage.click('Submit');
    console.log('Create service request Submit clicked');
    await this.ccdPage.waitForConfirmationScreenAndContinue(currentUrl);
    console.log('waited for confirmation screen and continued');
    await this.ccdPage.waitForOverviewPage(this.ccdPage.getStoredCaseUrl());
    console.log('Waiting for waitForOverviewPage complete after creating service request');
  }

  async payForAppealByCard() {
    const currentUrl = await this.ccdPage.getCurrentUrl();
    await element(by.xpath('//div[text()="Service Request"][contains(@class, "mat-tab-label-content")]')).click();
    try {
      await this.ccdPage.waitForCssElementVisible('td.govuk-table__cell > a.ng-star-inserted');
    } catch {
      await element(by.xpath('//div[text()="Service Request"][contains(@class, "mat-tab-label-content")]')).click();
      await this.ccdPage.waitForCssElementVisible('td.govuk-table__cell > a.ng-star-inserted');
    }
    await this.ccdFormPage.click('Pay now');
    try {
      await this.ccdPage.waitForXpathElementVisible('//*[contains(text(), "Pay fee using Payment by Account")]');
    } catch {
      await this.ccdFormPage.click('Pay now');
      await this.ccdPage.waitForXpathElementVisible('//*[contains(text(), "Pay fee using Payment by Account")]');
    }
    await this.ccdFormPage.click('Pay by credit or debit card');
    await this.ccdFormPage.click('Continue');
    await this.ccdPage.waitForCssElementVisible('#card-no');
    await this.ccdFormPage.typeText(`card-no`, `4444333322221111`);
    await this.ccdFormPage.typeText(`expiry-month`, `10`);
    await this.ccdFormPage.typeText(`expiry-year`, `30`);
    await this.ccdFormPage.typeText(`cardholder-name`, `Test User`);
    await this.ccdFormPage.typeText(`cvc`, `123`);
    await this.ccdFormPage.typeText(`address-line-1`, `123 Fake Street`);
    await this.ccdFormPage.typeText(`address-city`, `London`);
    await this.ccdFormPage.typeText(`address-postcode`, `FE1 2EF`);
    await this.ccdFormPage.typeText(`email`, `test@test.com`);
    try {
      await this.ccdFormPage.click('Continue');
    } catch {
      await this.ccdFormPage.click('Continue');
    }
    await this.ccdPage.waitForCssElementVisible('.confirm-page__content');
    await this.ccdFormPage.click('Confirm payment');

    await this.ccdPage.click('Return to service request');
    if (['demo', 'preview'].some(testEnv => currentUrl.includes(testEnv))) {
      await this.ccdPage.goToUrl(currentUrl);
    }
    await this.ccdPage.gotoTabs('Overview');
    await this.waitForPaymentRecognition();
  }

  async checkCasePaidCaseOfficer() {
    const badNextTextCount = element
      .all(by.xpath('//p[contains(text(), "This appeal is awaiting payment.")]'))
      .filter(e => e.isDisplayed())
      .count();
    const nextStepPath = '//select[@id="next-step"]';
    const url = await this.ccdPage.getCurrentUrl();
    await this.ccdPage.waitForXpathElementVisible(nextStepPath);
    let isBadTextPresent = (await badNextTextCount) > 0;
    while (isBadTextPresent) {
      await browser.sleep(10000);
      await this.ccdPage.refresh();
      await this.ccdPage.goToUrl(url);
      await this.ccdPage.waitForXpathElementVisible(nextStepPath);
      isBadTextPresent = (await badNextTextCount) > 0;
    }
    await browser.sleep(1000);
  }

  async continuePayByCard() {
    try {
      await this.ccdFormPage.click('Continue');
    } catch {
      await this.ccdFormPage.click('Continue');
    }
  }

  async returnToServiceRequest() {
    await this.ccdPage.get(CaseHelper.getInstance().getStoredCaseUrl());
    await this.ccdPage.waitForOverviewPage(CaseHelper.getInstance().getStoredCaseUrl());
    await this.ccdPage.gotoTabs('Service Request');
  }
}
