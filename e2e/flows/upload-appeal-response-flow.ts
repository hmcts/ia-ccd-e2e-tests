import { CcdFormPage } from '../pages/ccd-form.page';

export class UploadAppealResponseFlow {
  private ccdFormPage = new CcdFormPage();

  async uploadAppealResponse(clickContinue = false) {
    await this.ccdFormPage.selectNextStep('Upload the appeal response');
    await this.ccdFormPage.headingContains('Upload the appeal response');
    await this.ccdFormPage.setFieldValue(
        "Outcome",
        "Decision maintained"
    );
    await this.ccdFormPage.click('Continue');
    await this.ccdFormPage.uploadFile('AppealResponse.pdf');
    await this.ccdFormPage.setFieldValue('Describe the document (Optional)', 'This is the appeal response', 'text area');
    await this.ccdFormPage.addCollectionItem('Add any additional evidence here (Optional)');
    await this.ccdFormPage.uploadFile('AppealResponseEvidence.pdf', 1);
    await this.ccdFormPage.setFieldValue('Describe the document (Optional)', 'This is the appeal response evidence', 'text area', 'first', 'Add any additional evidence here (Optional)', 'first');
    await this.ccdFormPage.click('Continue');
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('Upload');
    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }
}
