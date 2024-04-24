import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class SendCasePreHearingFlow {

  private ccdFormPage = new CcdFormPage();

  async sendCasePreHearingFlow(clickContinue = false) {

    await this.ccdFormPage.selectNextStep('Send to pre hearing');
    let overviewUrl = await browser.getCurrentUrl();
        await this.ccdFormPage.flakeyClick('Go', overviewUrl)
        await this.ccdFormPage.waitForSpinner();
    await this.ccdFormPage.click('Submit');
  }
}
