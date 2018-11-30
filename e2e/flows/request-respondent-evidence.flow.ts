import { CcdFormPage } from '../pages/ccd-form.page';

export class RequestRespondentEvidenceFlow {

    private ccdFormPage = new CcdFormPage();

    async requestRespondentEvidence(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Request respondent evidence');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Send direction');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
            await this.ccdFormPage.waitUntilLoaded();
        }
    }
}
