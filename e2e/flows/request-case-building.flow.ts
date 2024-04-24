import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class RequestCaseBuildingFlow {

    private ccdFormPage = new CcdFormPage();

    async requestCaseBuilding() {

        await this.ccdFormPage.selectNextStep('Request case building');
        let overviewUrl = await browser.getCurrentUrl();
        await this.ccdFormPage.flakeyClick('Go', overviewUrl)
        await this.ccdFormPage.waitForSpinner();

        await this.ccdFormPage.headingContains('Request case building');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Send direction');
    }
}
