import { CcdFormPage } from '../pages/ccd-form.page';

export class ReinstateAppealFlow {
  private ccdFormPage = new CcdFormPage();

  async reinstateAppeal(clickContinue = false) {
    await this.ccdFormPage.selectNextStep('Reinstate the appeal');

    await this.ccdFormPage.headingContains('Reinstate the appeal');
    await this.ccdFormPage.setFieldValue('Reasons for reinstating the appeal', 'Appeal has been paid for now', 'text area');

    await this.ccdFormPage.click('Continue');
    await this.ccdFormPage.headingContains('Check your answers');
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('Continue');

    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }
}
