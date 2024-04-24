import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class RemoveAppealFlow {

    private ccdFormPage = new CcdFormPage();

    async removeAppeal(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Move appeal offline');
        let overviewUrl = await browser.getCurrentUrl();
        await this.ccdFormPage.flakeyClick('Go', overviewUrl)
        await this.ccdFormPage.waitForSpinner();

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Reasons for removal',
            'some appeal removal reason',
            'text area'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.click('Remove appeal');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }
}
