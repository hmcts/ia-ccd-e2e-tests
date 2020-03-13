import { CcdFormPage } from '../pages/ccd-form.page';

export class PrepareDecisionAndReasonsFlow {

    private ccdFormPage = new CcdFormPage();

    async prepareDecisionAndReasons(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Prepare Decision and Reasons');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.headingContains('Prepare Decision and Reasons');
        await this.ccdFormPage.contentContains('Are you giving an anonymity direction?');
        await this.ccdFormPage.setFieldValue('Anonymity direction', 'Yes');
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.headingContains('Prepare Decision and Reasons');
        await this.ccdFormPage.contentContains('Give the names of the legal representatives in this case');
        await this.ccdFormPage.setFieldValue('Legal representative for the appellant', 'Atticus Finch');
        await this.ccdFormPage.setFieldValue('Legal representative for the respondent', 'Perry Mason');
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.contentContains('Check your answers');
        await this.ccdFormPage.click('Generate');

        await this.ccdFormPage.click('Close and Return to case details');
    }
}
