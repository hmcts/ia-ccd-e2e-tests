import { CcdPage } from '../pages/ccd.page';
import { CcdFormPage } from '../pages/ccd-form.page';
import { browser, by, element } from 'protractor';

export class PayAndSubmitAppealFlow {
  private ccdPage = new CcdPage();
  private ccdFormPage = new CcdFormPage();

  async payForAppealByPBA() {
    await element(by.xpath('//div[text()="Service Request"][contains(@class, "mat-tab-label-content")]')).click();
    await this.ccdPage.waitForCssElementVisible('td.govuk-table__cell > a.ng-star-inserted');
    await this.ccdFormPage.click('Pay now');
    try {
      await this.ccdPage.waitForXpathElementVisible('//*[contains(text(), "Pay fee using Payment by Account")]');
    } catch {
      await this.ccdFormPage.click('Pay now');
      await this.ccdPage.waitForXpathElementVisible('//*[contains(text(), "Pay fee using Payment by Account")]');
    }
    await this.ccdFormPage.click('Pay fee using Payment by Account (PBA)');
    await this.ccdPage.waitForCssElementVisible('#pbaAccountNumber');
    await this.ccdFormPage.typeText('pbaAccountNumber', 'PBA0087412');
    await browser.sleep(1000);
    await this.ccdFormPage.typeText('pbaAccountRef', 'Unique Reference');
    await this.ccdFormPage.typeEnter('pbaAccountRef');
    let confirmPaymentButton = element(by.css('button.pba-payments-19-font'));
    await confirmPaymentButton.click();
    await this.ccdPage.waitForCssElementVisible('div.pba-payments--confirmation');
    await this.ccdPage.click('View service requests');
    await this.ccdPage.click('Overview');
    await this.waitForPaymentRecognition();
  }

  async waitForPaymentRecognition() {
    const currentUrl = await this.ccdPage.getCaseUrl();
    const nextStepPath = '//select[@id="next-step"]';
    const appealDetailsPath = '//h2[contains(text(), "Appeal details")]';
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

  async createServiceRequest() {
    await this.ccdFormPage.selectNextStep('Create a service request');
    await this.ccdFormPage.headingContains('Pay for this appeal');
    let currentUrl = await browser.getCurrentUrl();
    await this.ccdFormPage.click('Submit');
    await this.ccdPage.waitForConfirmationScreenAndContinue(currentUrl);
    await this.ccdPage.waitForOverviewPage(this.ccdPage.getStoredCaseUrl());
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

  async markAppealAsPaid() {
    await this.ccdFormPage.selectNextStep('Mark appeal as paid');
    await this.ccdFormPage.headingContains('Mark appeal as paid');
    await this.ccdFormPage.setFieldValue('Amount paid', '140');
    await this.ccdFormPage.setFieldValue('Payment date', '22-07-2025');
    await this.ccdFormPage.setFieldValue('Additional payment information (Optional)', 'Payment is now complete');
    await this.ccdFormPage.click('Continue');
    await this.ccdFormPage.contentContains('Check your answers');
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('Mark as paid');

    await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
  }
}
