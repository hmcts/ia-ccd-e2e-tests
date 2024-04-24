import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class ReinstateAppealFlow {

    private ccdFormPage = new CcdFormPage();

    async reinstateAppeal(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Reinstate the appeal');
        let overviewUrl = await browser.getCurrentUrl();
        await this.ccdFormPage.flakeyClick('Go', overviewUrl)
        await this.ccdFormPage.waitForSpinner();

        await this.ccdFormPage.headingContains('Reinstate the appeal');
        await this.ccdFormPage.setFieldValue(
            'Reasons for reinstating the appeal',
            'Appeal has been paid for now',
            'text area'
        );

        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.headingContains('Check your answers');
        await this.ccdFormPage.click('Continue');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }
}
