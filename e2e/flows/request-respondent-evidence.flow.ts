import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class RequestRespondentEvidenceFlow {

    private ccdFormPage = new CcdFormPage();

    async requestRespondentEvidence(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Request respondent evidence');
        let overviewUrl = await browser.getCurrentUrl();
        await this.ccdFormPage.flakeyClick('Go', overviewUrl)
        await this.ccdFormPage.waitForSpinner();

        await this.ccdFormPage.headingContains('Request respondent evidence');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.contentContains('Check your answers');
        await this.ccdFormPage.click('Send direction');
        await this.ccdFormPage.contentContains('You have sent a direction');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }
}
