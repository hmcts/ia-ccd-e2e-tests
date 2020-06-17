import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class HearingBundleFlow {

    private ccdFormPage = new CcdFormPage();

    async generateHearingBundle(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Generate hearing bundle');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.click('Generate');

        await this.ccdFormPage.click('Close and Return to case details');

        await browser.sleep(10 * 1000);
        await  this.ccdFormPage.refresh();
    }
}
