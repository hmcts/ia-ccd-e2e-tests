import { CcdPage } from '../pages/ccd.page';
import { CcdFormPage } from '../pages/ccd-form.page';
import { browser, by, element } from 'protractor';

export class PayAndSubmitAppealFlow {
  private ccdPage = new CcdPage();
  private ccdFormPage = new CcdFormPage();

  async payForAppealByPBA(clickContinue = false) {
    await element(by.xpath('//div[text()="Service Request"]')).click();
    await this.ccdPage.waitForCssElementVisible('td.govuk-table__cell > a.ng-star-inserted');
    await this.ccdFormPage.click('Pay now');
    try {
      await this.ccdPage.waitForCssElementVisible('#pbaAccount');
    } catch {
      await this.ccdFormPage.click('Pay now');
      await this.ccdPage.waitForCssElementVisible('#pbaAccount');
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
    if (clickContinue) {
      await this.ccdPage.click('View service requests');
      await this.ccdPage.click('Overview');
      let i = 0;
      while (i < 6) {
        let nextText = element(by.xpath('//p[contains(text(),"You have submitted your appeal. A Tribunal Caseworker will now review your appeal.")]'));
        if (nextText) {
          break;
        } else {
          await browser.sleep(10000);
          await this.ccdPage.refresh();
        }
      }
    }
  }

  async createServiceRequest(clickContinue = false) {
    await this.ccdFormPage.selectNextStep('Create a service request');
    let overviewUrl = await browser.getCurrentUrl();
    overviewUrl = overviewUrl.split('#')[0];
    if (overviewUrl[overviewUrl.length - 1] !== '/') {
      overviewUrl += '/';
    }
    overviewUrl += 'trigger/generateServiceRequest/generateServiceRequestcreateAServiceRequest';
    await browser.get(overviewUrl);
    await this.ccdFormPage.headingContains('Pay for this appeal');
    let currentUrl = await browser.getCurrentUrl();
    await this.ccdFormPage.click('Submit');
    await this.ccdPage.waitForConfirmationScreen(currentUrl);
    if (clickContinue) {
      await this.ccdPage.click('Close and Return to case details');
      await this.ccdPage.waitForOverviewPage();
    }
  }

  async payForAppealByCard(clickContinue = false) {
    const currentUrl = await this.ccdPage.getCurrentUrl();
    await element(by.xpath('//div[text()="Service Request"]')).click();
    await this.ccdPage.waitForCssElementVisible('td.govuk-table__cell > a.ng-star-inserted');
    await this.ccdFormPage.click('Pay now');
    try {
      await this.ccdPage.waitForCssElementVisible('#pbaAccount');
    } catch {
      await this.ccdFormPage.click('Pay now');
      await this.ccdPage.waitForCssElementVisible('#pbaAccount');
    }
    await this.ccdFormPage.click('Pay by credit or debit card');
    await this.ccdFormPage.click('Continue');
    await this.ccdPage.waitForPageNavigation(currentUrl);
    await this.ccdPage.waitForCssElementVisible('#card-no');
    await this.ccdFormPage.typeText(`card-no`, `4444333322221111`);
    await this.ccdFormPage.typeText(`expiry-month`, `10`);
    await this.ccdFormPage.typeText(`expiry-year`, `24`);
    await this.ccdFormPage.typeText(`cardholder-name`, `Test User`);
    await this.ccdFormPage.typeText(`cvc`, `123`);
    await this.ccdFormPage.typeText(`address-line-1`, `123 Fake Street`);
    await this.ccdFormPage.typeText(`address-city`, `Fakeicester`);
    await this.ccdFormPage.typeText(`address-postcode`, `FE1 2EF`);
    await this.ccdFormPage.typeText(`email`, `test@test.com`);
    await this.ccdFormPage.click('Continue');
    await this.ccdPage.waitForCssElementVisible('.confirm-page__content');
    await this.ccdFormPage.click('Confirm payment');

    if (clickContinue) {
      await this.ccdPage.click('Return to service request');
      if (currentUrl.includes('preview')) {
        await this.ccdPage.goToUrl(currentUrl);
      }
      await this.ccdPage.click('Overview');
      let i = 0;
      while (i < 6) {
        let nextText = element(by.xpath('//p[contains(text(),"You have submitted your appeal. A Tribunal Caseworker will now review your appeal.")]'));
        if (await nextText.isPresent()) {
          break;
        } else {
          await browser.sleep(10000);
          await this.ccdPage.refresh();
        }
      }
    }
  }
}
