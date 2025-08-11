import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class UploadBailSummary {
  private ccdFormPage = new CcdFormPage();

  async uploadBailSummaryFile(clickContinue = false) {
    await this.ccdFormPage.runAccessbility();
    await browser.sleep(1000);
    await this.ccdFormPage.click('Add new');
    await this.ccdFormPage.uploadFile('BailSummary.pdf');
    await this.ccdFormPage.setFieldValue('Describe the document', 'This is the bail summary', 'text area', 'first', 'Upload Bail Summary', 'first');
    await browser.sleep(1000);

    if (clickContinue) {
      await this.ccdFormPage.click('Continue');
    }
  }

  async uploadBailSummary(clickContinue = false) {
    await browser.sleep(5000);
    await this.ccdFormPage.runAccessbility();
    await this.ccdFormPage.selectNextStep('Upload Bail Summary');
    await this.uploadBailSummaryFile(true);
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('Upload');
    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }
}
