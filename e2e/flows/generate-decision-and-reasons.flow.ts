import { CcdFormPage } from '../pages/ccd-form.page';

export class GenerateDecisionAndReasonsFlow {

    private ccdFormPage = new CcdFormPage();

    async generateDecisionAndReasons(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Generate decision and reasons');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.headingContains('Start decision and reasons');
        await this.ccdFormPage.contentContains('Are you giving an anonymity direction?');
        await this.ccdFormPage.setFieldValue('Anonymity direction', 'Yes');
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.headingContains('Start decision and reasons');
        await this.ccdFormPage.contentContains('Give the names of the legal representatives in this case');
        await this.ccdFormPage.setFieldValue('Legal representative for the appellant', 'Atticus Finch');
        await this.ccdFormPage.setFieldValue('Legal representative for the respondent', 'Perry Mason');
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.contentContains('Check your answers');
        await this.ccdFormPage.click('Generate');

        await this.ccdFormPage.click('Close and Return to case details');
        await this.ccdFormPage.waitUntilLoaded();

    }
}
