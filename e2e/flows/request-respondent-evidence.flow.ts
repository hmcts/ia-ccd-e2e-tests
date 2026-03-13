import { CcdFormPage } from '../pages/ccd-form.page';

export class RequestRespondentEvidenceFlow {
  private ccdFormPage = new CcdFormPage();

  async requestRespondentEvidence(clickContinue = false) {
    await this.ccdFormPage.selectNextStep('Request respondent evidence');

    await this.ccdFormPage.headingContains('Request respondent evidence');
    await this.ccdFormPage.click('Continue');
    await this.ccdFormPage.contentContains('Check your answers');
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('Send direction');

    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }
  async progressMigratedCase(clickContinue = false) {
    await this.ccdFormPage.selectNextStep('Progress Migrated Case');

    await this.ccdFormPage.headingContains('Progress Migrated Case');
    await this.ccdFormPage.setFieldValue(
        "Is the desired state correct?",
        "Yes"
    );
    await this.ccdFormPage.click('Continue');
    await this.ccdFormPage.setFieldValue(
        "Do you want to add a case note?",
        "No"
    );
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('Submit');

    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }
}
