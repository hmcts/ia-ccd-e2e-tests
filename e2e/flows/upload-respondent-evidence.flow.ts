import { CcdFormPage } from '../pages/ccd-form.page';

export class UploadRespondentEvidenceFlow {

    private ccdFormPage = new CcdFormPage();

    async uploadRespondentEvidence(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Upload respondent evidence');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.addCollectionItem('Upload case documents');
        await this.ccdFormPage.setFieldValue(
            'Document',
            '{@RespondentEvidence.pdf}',
            'document',
            'first',
            'Upload case documents',
            'first'
        );
        await this.ccdFormPage.setFieldValue(
            'Describe the document',
            'This is the respondent evidence',
            'text area',
            'first',
            'Upload case documents',
            'first'
        );

        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Upload');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }

    // Use this to upload the document by Home Office user
    async uploadHomeOfficeBundle(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Upload Home Office bundle');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.addCollectionItem('Upload Home Office bundle');
        await this.ccdFormPage.setFieldValue(
            'Upload a file',
            '{@RespondentEvidence.pdf}',
            'document',
            'first',
            'Upload Home Office bundle',
            'first'
        );
        await this.ccdFormPage.setFieldValue(
            'Describe the document',
            'This is the Home Office Bundle',
            'text area',
            'first',
            'Upload Home Office bundle',
            'first'
        );

        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Upload');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }

}
