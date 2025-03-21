import { CcdPage } from '../pages/ccd.page';
import { CcdFormPage } from '../pages/ccd-form.page';
import { browser, by, element } from 'protractor';

export class SubmitAppealFlow {
  private ccdPage = new CcdPage();
  private ccdFormPage = new CcdFormPage();

  async completeDeclaration(clickContinue = false) {
    await this.ccdPage.headingContains('Declaration');
    await element(by.css('#legalRepDeclaration-hasDeclared')).click();

    if (clickContinue) {
      await this.ccdPage.click('Submit');
    }
  }

  async submitAppeal(clickContinue = false) {
    await this.ccdPage.selectNextStep('Submit your appeal');
    await browser.sleep(500);
    let overviewUrl = await browser.getCurrentUrl();
    await this.ccdPage.flakeyClick('Go', overviewUrl);
    await this.ccdPage.contentContains("The appellant or legal representative has indicated that the facts entered on the appeal form and any continuation sheets are true and complete.");
    let currentUrl = await browser.getCurrentUrl();
    await this.completeDeclaration(true);
    await this.ccdPage.waitForConfirmationScreen(currentUrl);
    if (clickContinue) {
      await this.ccdPage.click('Close and Return to case details');
      await this.ccdPage.waitForOverviewPage();
    }
  }

  async submitLateAppeal(clickContinue = false) {
    await this.ccdPage.selectNextStep('Submit your appeal');
    await this.ccdPage.click('Go');

    await this.ccdFormPage.setFieldValue('You can upload a document or fill out the box below. (Optional)', 'I was on holiday', 'text area');
    if (clickContinue) {
      await this.ccdPage.click('Continue');
    }
    await this.completeDeclaration(true);

    if (clickContinue) {
      await this.ccdPage.click('Close and Return to case details');
    }
  }
}
