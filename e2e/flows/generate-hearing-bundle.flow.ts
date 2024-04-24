import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class HearingBundleFlow {

    private ccdFormPage = new CcdFormPage();

    async generateHearingBundle(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Generate hearing bundle');
        let overviewUrl = await browser.getCurrentUrl();
        await this.ccdFormPage.flakeyClick('Go', overviewUrl)
        await this.ccdFormPage.waitForSpinner();

        await this.ccdFormPage.click('Generate');

        await this.ccdFormPage.click('Close and Return to case details');
    }
}
