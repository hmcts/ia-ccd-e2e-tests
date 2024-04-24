import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class SendDirection {

    private ccdFormPage = new CcdFormPage();

    async sendDirectionPage(clickContinue = false, receiver) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Explain the direction you are issuing', 'This is a test direction to the ' + receiver);
        await this.ccdFormPage.setFieldValue('Who are you giving direction to?', receiver);
        await this.ccdFormPage.setFieldValue('By what date must they comply?', '10-02-2025');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async sendDirection(clickContinue = false, receiver) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.selectNextStep('Send direction');
        let overviewUrl = await browser.getCurrentUrl();
        await this.ccdFormPage.flakeyClick('Go', overviewUrl)
        await this.ccdFormPage.waitForSpinner();
        await this.sendDirectionPage(true, receiver);
        await this.ccdFormPage.click('Send the direction');
        await browser.sleep(5000)
        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }
}
