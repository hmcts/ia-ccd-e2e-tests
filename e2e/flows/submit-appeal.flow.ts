import { CcdPage } from '../pages/ccd.page';
import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class SubmitAppealFlow {
  private ccdPage = new CcdPage();
  private ccdFormPage = new CcdFormPage();

  async completeDeclaration(clickContinue = false) {
    await this.ccdPage.headingContains('Declaration');
    await this.ccdPage.click(
      'The appellant or legal representative has indicated that the facts entered on the appeal form and any continuation sheets are true and complete.'
    );
    if (clickContinue) {
      await this.ccdPage.click('Submit');
    }
  }

  async submitAppeal() {
    await this.ccdPage.selectNextStep('Submit your appeal');
    await this.ccdPage.contentContains("The appellant or legal representative has indicated that the facts entered on the appeal form and any continuation sheets are true and complete.");
    let currentUrl = await browser.getCurrentUrl();
    await this.completeDeclaration(true);
    await this.ccdPage.waitForConfirmationScreenAndContinue(currentUrl);
  }

  async submitLateAppeal() {
    await this.ccdPage.selectNextStep('Submit your appeal');

    await this.ccdFormPage.setFieldValue('You can upload a document or fill out the box below. (Optional)', 'I was on holiday', 'text area');
    await this.ccdPage.click('Continue');
    await this.completeDeclaration(true);
    await this.ccdPage.waitForConfirmationScreenAndContinue(await browser.getCurrentUrl());
  }
}
