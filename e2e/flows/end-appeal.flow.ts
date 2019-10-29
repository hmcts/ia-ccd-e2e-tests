import { CcdFormPage } from '../pages/ccd-form.page';

export class EndAppealFlow {

    private ccdFormPage = new CcdFormPage();

    async endAppeal(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('End the appeal');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.headingContains('End the appeal');
        await this.ccdFormPage.click('Struck out');
        await this.ccdFormPage.setFieldValue(
            'Reasons for this outcome',
            'some end appeal reason',
            'text area'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.click('Judge');
        await this.ccdFormPage.setFieldValue(
            'Name of approver',
            'John Doe',
            'text'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.headingContains('Check your answers');
        await this.ccdFormPage.click('End appeal');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
            await this.ccdFormPage.waitUntilLoaded();
        }
    }
}
