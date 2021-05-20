import { CcdFormPage } from '../pages/ccd-form.page';

export class RequestHearingRequirementsFlow {

    private ccdFormPage = new CcdFormPage();

    async requestHearingRequirements() {

        await this.ccdFormPage.selectNextStep('Request hearing requirements');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.headingContains('Request hearing requirements');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Send direction');
    }
}
