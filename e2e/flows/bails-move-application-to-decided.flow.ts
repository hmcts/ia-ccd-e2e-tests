import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class MoveToDecided {

    private ccdFormPage = new CcdFormPage();

    async moveToDecided(clickContinue = false) {
        await browser.sleep(5000)
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.selectNextStep('Move application to decided');
        await this.ccdFormPage.click('Go');
        await this.ccdFormPage.click('Continue');
        await browser.sleep(5000)
        if (clickContinue) {
            await this.ccdFormPage.click('Submit');
        }
    }
}
