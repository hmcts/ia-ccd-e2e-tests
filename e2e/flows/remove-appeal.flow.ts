import { CcdFormPage } from '../pages/ccd-form.page';

export class RemoveAppealFlow {

    private ccdFormPage = new CcdFormPage();

    async removeAppeal(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Move appeal offline');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Reasons for removal',
            'some appeal removal reason',
            'text area'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.click('Remove appeal');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }
}
