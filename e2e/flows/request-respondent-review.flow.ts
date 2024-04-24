import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class RequestRespondentReviewFlow {

    private ccdFormPage = new CcdFormPage();

    async requestRespondentReview(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Request respondent review');
        let overviewUrl = await browser.getCurrentUrl();
        await this.ccdFormPage.flakeyClick('Go', overviewUrl)
        await this.ccdFormPage.waitForSpinner();

        await this.ccdFormPage.headingContains('Request respondent review');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Send direction');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }

    async requestAppellantReview(clickContinue = false) {

        await this.ccdFormPage.linkContains('direct the appellant to review the Home Office response');
        await this.ccdFormPage.click('direct the appellant to review the Home Office response');

        await this.ccdFormPage.headingContains('Review Home Office response');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Send direction');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }
}
