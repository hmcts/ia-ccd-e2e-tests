import { CcdFormPage } from '../pages/ccd-form.page';

export class CaseSummaryFlow {

    private ccdFormPage = new CcdFormPage();

    async createCaseSummary(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Create case summary');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.headingContains('Create case summary');

        await this.ccdFormPage.setFieldValue(
            'Case summary document',
            '{@CaseSummary.pdf}',
            'document'
        );

        await this.ccdFormPage.setFieldValue(
            'Describe the document (Optional)',
            'This is the case summary',
            'text area'
        );

        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Upload');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
            await this.ccdFormPage.contentContains('You have uploaded the case summary');
        }
    }
}
