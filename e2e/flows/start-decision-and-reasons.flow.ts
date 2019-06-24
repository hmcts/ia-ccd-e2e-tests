import { CcdFormPage } from '../pages/ccd-form.page';

export class StartDecisionAndReasonsFlow {

    private ccdFormPage = new CcdFormPage();

    async startDecisionAndReasons(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Start decision and reasons');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.headingContains('Start decision and reasons');
        await this.ccdFormPage.contentContains('Write a brief introduction to the case');
        await this.ccdFormPage.setFieldValue('Introduction (Optional)', 'some introduction');
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.headingContains('Start decision and reasons');
        await this.ccdFormPage.contentContains('Add the appellant\'s case summary');
        await this.ccdFormPage.setFieldValue('Appellant\'s case summary (Optional)', 'some case summary');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.headingContains('Start decision and reasons');

        await this.ccdFormPage.setFieldValue('Do both parties agree the immigration history?', 'Yes');
        await this.ccdFormPage.setFieldValue('Agreed immigration history (Optional)', 'some history');
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue('Do both parties agree the schedule of issues?', 'Yes');
        await this.ccdFormPage.setFieldValue('The appellant\'s schedule of issues (Optional)', 'some schedule');
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.contentContains('Check your answers');
        await this.ccdFormPage.click('Save');

        await this.ccdFormPage.click('Close and Return to case details');
        await this.ccdFormPage.waitUntilLoaded();

    }
}
