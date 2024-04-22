import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class EndApplication {

    private ccdFormPage = new CcdFormPage();

    async outcomeReasons(clickContinue = false) {
        await browser.sleep(5000)
        await this.ccdFormPage.runAccessbility();
        await browser.sleep(1000)
        await this.ccdFormPage.setFieldValue('Outcome', 'Withdrawn');
        await this.ccdFormPage.setFieldValue('Reasons', 'This is a reason to end the application. This is another reason.');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async endApplication(clickContinue = false) {
        await browser.sleep(5000)
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.selectNextStep('End the application');
        let overviewUrl = await browser.getCurrentUrl();
        await this.ccdFormPage.flakeyClick('Go', overviewUrl)
        await this.outcomeReasons(true);
        await this.ccdFormPage.click('End application');
        await browser.sleep(5000)
        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }
}
