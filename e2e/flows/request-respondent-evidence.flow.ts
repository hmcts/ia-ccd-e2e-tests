import { CcdFormPage } from '../pages/ccd-form.page';

export class RequestRespondentEvidenceFlow {
  private ccdFormPage = new CcdFormPage();

  async requestRespondentEvidence(clickContinue = false) {
    await this.ccdFormPage.selectNextStep('Complete case review');
    await this.ccdFormPage.headingContains('Complete case review');
    let currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('Submit');
    await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);

    await this.ccdFormPage.selectNextStep('Request respondent evidence');
    await this.ccdFormPage.headingContains('Request respondent evidence');
    await this.ccdFormPage.click('Continue');
    await this.ccdFormPage.contentContains('Check your answers');
    currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('Send direction');

    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }
}
