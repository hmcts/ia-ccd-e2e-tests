import { CcdFormPage } from '../pages/ccd-form.page';

export class CaseSummaryFlow {
  private ccdFormPage = new CcdFormPage();

  async createCaseSummary(clickContinue = false) {
    await this.ccdFormPage.selectNextStep('Create case summary');
    try {
      await this.ccdFormPage.headingContains('Create case summary');
      await this.ccdFormPage.uploadFile('CaseSummary.pdf');
      await this.ccdFormPage.setFieldValue('Describe the document (Optional)', 'This is the case summary', 'text area');
      await this.ccdFormPage.click('Continue');
    } catch {
      await this.ccdFormPage.headingContains('Create case summary');
      await this.ccdFormPage.uploadFile('CaseSummary.pdf');
      await this.ccdFormPage.setFieldValue('Describe the document (Optional)', 'This is the case summary', 'text area');
      await this.ccdFormPage.click('Continue');
    }
    await this.ccdFormPage.waitForXpathElementVisible('//button[contains(text(), "Upload")]');
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('Upload');

    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }
}
