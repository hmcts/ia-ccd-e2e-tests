import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class CaseSummaryFlow {
  private ccdFormPage = new CcdFormPage();

  async createCaseSummary(clickContinue = false) {
    await this.ccdFormPage.selectNextStep('Create case summary');
    let overviewUrl = await browser.getCurrentUrl();
    await this.ccdFormPage.flakeyClick('Go', overviewUrl);
    await this.ccdFormPage.waitForSpinner();
    await this.ccdFormPage.headingContains('Create case summary');
    await this.ccdFormPage.uploadFile('CaseSummary.pdf');
    await this.ccdFormPage.setFieldValue('Describe the document (Optional)', 'This is the case summary', 'text area');
    await this.ccdFormPage.click('Continue');
    await this.ccdFormPage.click('Upload');

    if (clickContinue) {
      await this.ccdFormPage.click('Close and Return to case details');
    }
  }
}
