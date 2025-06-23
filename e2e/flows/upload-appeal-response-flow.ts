import { CcdFormPage } from '../pages/ccd-form.page';

export class UploadAppealResponseFlow {
  private ccdFormPage = new CcdFormPage();

  async uploadAppealResponse(clickContinue = false) {
    await this.ccdFormPage.clickLinkText("add the Home Office's response");
    await this.ccdFormPage.setFieldValue('Upload the appeal response', '{@AppealResponse.pdf}', 'document');
    await this.ccdFormPage.setFieldValue('Describe the document (Optional)', 'This is the appeal response', 'text area');

    await this.ccdFormPage.addCollectionItem('Add any additional evidence here (Optional)');

    await this.ccdFormPage.setFieldValue('Document (Optional)', '{@AppealResponseEvidence.pdf}', 'document', 'first', 'Evidence (Optional)', 'first');

    await this.ccdFormPage.setFieldValue('Describe the document (Optional)', 'This is the appeal response evidence', 'text area', 'first', 'Evidence (Optional)', 'first');

    await this.ccdFormPage.click('Continue');
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('Upload');

    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }
}
