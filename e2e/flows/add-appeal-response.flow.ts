import { CcdFormPage } from '../pages/ccd-form.page';

export class AddAppealResponseFlow {

    private ccdFormPage = new CcdFormPage();

    async addAppealResponse(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Add appeal response');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.headingContains('Add appeal response');
        await this.ccdFormPage.setFieldValue(
            'Response document',
            '{@AppealResponse.pdf}',
            'document'
        );
        await this.ccdFormPage.setFieldValue(
            'Describe the document (Optional)',
            'This is the appeal response',
            'text area'
        );

        await this.ccdFormPage.addCollectionItem('Evidence (Optional)');

        await this.ccdFormPage.setFieldValue(
            'Document (Optional)',
            '{@AppealResponseEvidence.pdf}',
            'document',
            'first',
            'Evidence (Optional)',
            'first'
        );

        await this.ccdFormPage.setFieldValue(
            'Describe the document (Optional)',
            'This is the appeal response evidence',
            'text area',
            'first',
            'Evidence (Optional)',
            'first'
        );
        await this.ccdFormPage.hideSpinner();
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Upload');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }
}
