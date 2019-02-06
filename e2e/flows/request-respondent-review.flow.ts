import { CcdFormPage } from '../pages/ccd-form.page';

export class RequestRespondentReviewFlow {

    private ccdFormPage = new CcdFormPage();

    async requestRespondentReview(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Request respondent review');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.headingContains('Request respondent review');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Send direction');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
            await this.ccdFormPage.waitUntilLoaded();
        }
    }
}
