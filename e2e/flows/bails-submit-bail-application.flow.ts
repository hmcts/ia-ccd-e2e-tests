import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class SubmitBailApplicationFlow {

    private ccdFormPage = new CcdFormPage();

    async submitBailApplication(clickContinue = false, user: string) {
        await browser.sleep(5000)
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.selectNextStep('Submit the application');
        let overviewUrl = await browser.getCurrentUrl();
        await this.ccdFormPage.flakeyClick('Go', overviewUrl)
        if (user === 'Legal Rep') {
            let loaded = false;
            for (let i = 0; i < 3; i++) {
              loaded = await this.ccdFormPage.contentContains('The applicant has confirmed that the facts stated in this application are true.');
              if (loaded) { break; }
            };
            await this.ccdFormPage.click('The applicant has confirmed that the facts stated in this application are true.');
        }
        await this.ccdFormPage.click('Submit');
        if (user !== 'Legal Rep') {
            if (clickContinue) {
                await this.ccdFormPage.click('Close and Return to case details');
            }
        }
    }
}
