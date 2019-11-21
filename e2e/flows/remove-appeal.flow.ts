import { CcdFormPage } from '../pages/ccd-form.page';

export class RemoveAppealFlow {

    private ccdFormPage = new CcdFormPage();

    async removeAppeal(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Move appeal offline');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.headingContains('Move appeal offline');
        await this.ccdFormPage.contentContains('You should only remove an appeal when you\'re sure it cannot continue through the online service');
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.headingContains('Move appeal offline');
        await this.ccdFormPage.setFieldValue(
            'Reasons for removal',
            'some appeal removal reason',
            'text area'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.headingContains('Check your answers');
        await this.ccdFormPage.click('Remove appeal');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
            await this.ccdFormPage.waitUntilLoaded();
        }
    }
}
