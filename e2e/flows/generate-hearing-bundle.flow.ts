import { CcdFormPage } from '../pages/ccd-form.page';

export class HearingBundleFlow {
  private ccdFormPage = new CcdFormPage();

  async generateHearingBundle(clickContinue = false) {
    await this.ccdFormPage.selectNextStep('Generate hearing bundle');

    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('Generate');

    await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
  }
}
