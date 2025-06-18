import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class EndApplication {
  private ccdFormPage = new CcdFormPage();

  async outcomeReasons(clickContinue = false) {
    await this.ccdFormPage.runAccessbility();
    await browser.sleep(1000);
    await this.ccdFormPage.setFieldValue('Outcome', 'Withdrawn');
    await this.ccdFormPage.setFieldValue('Reasons', 'This is a reason to end the application. This is another reason.');
    if (clickContinue) {
      await this.ccdFormPage.click('Continue');
    }
  }

  async endApplication(clickContinue = false) {
    await this.ccdFormPage.runAccessbility();
    await this.ccdFormPage.selectNextStep('End the application');
    await this.outcomeReasons(true);
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('End application');
    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }
}
