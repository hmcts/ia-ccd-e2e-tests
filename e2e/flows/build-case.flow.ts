import { CcdFormPage } from '../pages/ccd-form.page';

export class BuildCaseFlow {
  private ccdFormPage = new CcdFormPage();

  async buildCase(clickContinue = false) {
    await this.ccdFormPage.selectNextStep('Build your case');
    await this.ccdFormPage.uploadFile('CaseArgument.pdf');
    await this.ccdFormPage.setFieldValue('Describe the document (Optional)', 'This is the case argument', 'text area');

    await this.ccdFormPage.addCollectionItem('Evidence (Optional)');
   await this.ccdFormPage.uploadFile('CaseArgumentEvidence.pdf', 1);

   //  await this.ccdFormPage.setFieldValue('Document (Optional)', '{@CaseArgumentEvidence.pdf}', 'document', 'first', 'Evidence (Optional)', 'first');

    await this.ccdFormPage.setFieldValue('Describe the document (Optional)', 'The is the case argument evidence', 'text area', 'first', 'Evidence (Optional)', 'first');
    await this.ccdFormPage.click('Continue');

    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('Submit Case');
    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }
}
