import { CcdFormPage } from '../pages/ccd-form.page';

export class SendDecisionAndReasonsFlow {

    private ccdFormPage = new CcdFormPage();

    async sendDecisionAndReasons() {
        await this.ccdFormPage.selectNextStep('Complete decision and reasons');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.setFieldValue('Decision', 'Allowed');
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue('Decision and reasons', '{@test.docx}');
        await this.ccdFormPage.click('I confirm this document is signed with today\'s date.');
        await this.ccdFormPage.click('Ensure that the fee award is consistent with your decision.');
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.click('Upload');

        await this.ccdFormPage.click('Close and Return to case details');
    }
}
