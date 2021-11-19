import { CcdFormPage } from '../pages/ccd-form.page';

export class UploadAdditionalEvidenceFlow {

    private ccdFormPage = new CcdFormPage();

    async uploadAdditionalEvidence(clickContinue = false) {

            await this.ccdFormPage.selectNextStep('Upload additional evidence');
        await this.ccdFormPage.click('Go');
        await this.ccdFormPage.addCollectionItem('Upload documents');
        await this.ccdFormPage.setFieldValue(
            'Document',
            '{@AdditionalEvidence1.pdf}',
            'document',
            'first',
            'Upload documents',
            'first'
        );
        await this.ccdFormPage.setFieldValue(
            'Explain why you are submitting this evidence after the appeal skeleton argument.',
            'This is the additional evidence',
            'text area',
            'first',
            'Upload documents',
            'first'
        );
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Upload');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }
}
