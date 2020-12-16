import { CcdFormPage } from '../pages/ccd-form.page';

export class RecordRemissionDecisionFlow {

    private ccdFormPage = new CcdFormPage();

    async partiallyApproved(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Record remission decision');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.headingContains('Record remission decision');
        await this.ccdFormPage.click('Partially approved');

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue('Amount remitted', '100');
        await this.ccdFormPage.setFieldValue('Amount left to pay', '40');
        await this.ccdFormPage.setFieldValue(
            'Reason for decision',
            'This remission is partially approved',
            'text area'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.headingContains('Check your answers');
        await this.ccdFormPage.click('Record decision');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }
}
