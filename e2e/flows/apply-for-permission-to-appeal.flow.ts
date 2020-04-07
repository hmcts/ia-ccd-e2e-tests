import { CcdFormPage } from '../pages/ccd-form.page';

export class ApplyForPermissionToAppealFlow {

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
            'The is the ftpa appeal grounds',
            'text area',
            'first',
            'Grounds of the application',
            'first'
        );

        await this.ccdFormPage.addCollectionItem('Supporting evidence (Optional)');

        await this.ccdFormPage.setFieldValue(
            'Document',
            '{@FTPASupportingEvidence.pdf}',
            'document',
            'first',
            'Supporting evidence',
            'first'
        );

        await this.ccdFormPage.setFieldValue(
            'Describe the document',
            'The is the ftpa appeal supporting evidence',
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
