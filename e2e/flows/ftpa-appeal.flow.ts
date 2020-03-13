import { CcdFormPage } from '../pages/ccd-form.page';

export class FtpaAppealFlow {

  private ccdFormPage = new CcdFormPage();

  async submitAppellantAppeal(clickContinue = false) {

    await this.ccdFormPage.selectNextStep('Apply for permission to appeal');
    await this.ccdFormPage.click('Go');

    await this.ccdFormPage.addCollectionItem('Grounds of the application');

    await this.ccdFormPage.setFieldValue(
        'Document',
        '{@FTPAAppellantGrounds.pdf}',
        'document',
        1,
        'Grounds of the application',
        1
    );

    await this.ccdFormPage.setFieldValue(
        'Describe the document',
        'This is the FTPA Appellant grounds',
        'text area',
        'first',
        'Grounds of the application',
        'first'
    );

    await this.ccdFormPage.click('Continue');
    await this.ccdFormPage.click('Submit');

    if (clickContinue) {
      await this.ccdFormPage.click('Close and Return to case details');
    }
  }

  async submitRespondentAppeal(clickContinue = false) {

    await this.ccdFormPage.selectNextStep('Apply for permission to appeal');
    await this.ccdFormPage.click('Go');

    await this.ccdFormPage.addCollectionItem('Grounds of the application');

    await this.ccdFormPage.setFieldValue(
        'Document',
        '{@FTPARespondentGrounds.pdf}',
        'document',
        'first',
        'Grounds of the application',
        'first'
    );

    await this.ccdFormPage.setFieldValue(
        'Describe the document',
        'This is the FTPA Respondent grounds',
        'text area',
        'first',
        'Grounds of the application',
        'first'
    );

    await this.ccdFormPage.addCollectionItem('Supporting evidence (Optional)');

    await this.ccdFormPage.setFieldValue(
        'Document (Optional)',
        '{@FTPARespondentEvidence.pdf}',
        'document',
        'first',
        'Supporting evidence',
        'first'
    );

    await this.ccdFormPage.setFieldValue(
        'Describe the document (Optional)',
        'This is the FTPA Respondent evidence ',
        'text area',
        'first',
        'Supporting evidence',
        'first'
    );

    await this.ccdFormPage.click('Continue');
    await this.ccdFormPage.click('Submit');

    if (clickContinue) {
      await this.ccdFormPage.click('Close and Return to case details');
    }
  }

}
