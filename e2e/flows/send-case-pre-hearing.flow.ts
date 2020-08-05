import { CcdFormPage } from '../pages/ccd-form.page';

export class SendCasePreHearingFlow {

  private ccdFormPage = new CcdFormPage();

  async sendCasePreHearingFlow(clickContinue = false) {

    await this.ccdFormPage.selectNextStep('Send to pre hearing');
    await this.ccdFormPage.click('Go');
    await this.ccdFormPage.click('Submit');
  }
}
