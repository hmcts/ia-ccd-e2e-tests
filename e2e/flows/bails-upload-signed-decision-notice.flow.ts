import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class UploadSignedDecisionNotice {
  private ccdFormPage = new CcdFormPage();

  async uploadSignedDecisionNoticeFile(clickContinue = false, decision) {
    await this.ccdFormPage.runAccessbility();
    if (decision === 'Refused') {
      await this.ccdFormPage.setFieldValue('Decision document', '{@SignedDecisionNoticeRefused.pdf}', 'document');
    } else {
      await this.ccdFormPage.setFieldValue('Decision document', '{@SignedDecisionNoticeGranted.pdf}', 'document');
    }
    await browser.sleep(3000);
    if (clickContinue) {
      await this.ccdFormPage.click('Continue');
    }
  }

  async uploadSignedDecisionNotice(clickContinue = false, decision) {
    await browser.sleep(5000);
    await this.ccdFormPage.runAccessbility();
    await this.ccdFormPage.selectNextStep('Upload signed decision notice');
    await this.uploadSignedDecisionNoticeFile(true, decision);
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('Upload');
    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }
}
