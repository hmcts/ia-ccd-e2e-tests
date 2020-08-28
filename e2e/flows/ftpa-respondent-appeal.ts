import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class FtpaRespondentAppealFlow {

    private ccdFormPage = new CcdFormPage();

    async appeal(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Apply for permission to appeal');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.addCollectionItem('Grounds of the application');

        await this.ccdFormPage.setFieldValue(
            'Document',
            '{@FTPAAppealGrounds.pdf}',
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
            'This is the FTPA Respondent evidence',
            'text area',
            'first',
            'Supporting evidence',
            'first'
        );
        await browser.sleep(1000);
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Submit');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }
}
