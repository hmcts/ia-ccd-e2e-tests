import { CcdFormPage } from '../pages/ccd-form.page';

export class AddAppealResponseFlow {

    private ccdFormPage = new CcdFormPage();

    async addAppealResponse(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Add appeal response');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.setFieldValue(
            'Response document',
            '{@AppealResponse.pdf}'
        );
        await this.ccdFormPage.setFieldValue(
            'Describe the document (Optional)',
            'This is the appeal response'
        );

        await this.ccdFormPage.addCollectionItem('Evidence (Optional)');

        await this.ccdFormPage.setFieldValue(
            'Document (Optional)',
            '{@AppealResponseEvidence.pdf}',
            'first',
            'Evidence (Optional)',
            'first'
        );

        await this.ccdFormPage.setFieldValue(
            'Describe the document (Optional)',
            'This is the appeal response evidence',
            'first',
            'Evidence (Optional)',
            'first'
        );

        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Upload');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
            await this.ccdFormPage.waitUntilLoaded();
        }
    }
}
