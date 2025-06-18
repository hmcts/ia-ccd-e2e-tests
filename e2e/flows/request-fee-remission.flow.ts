import { CcdFormPage } from '../pages/ccd-form.page';

export class RequestFeeRemissionFlow {
  private ccdFormPage = new CcdFormPage();

  async legalAid(clickContinue = false) {
    await this.ccdFormPage.selectNextStep('Request a fee remission');

    await this.ccdFormPage.headingContains('Request a fee remission');
    await this.ccdFormPage.click('The appellant has a remission, e.g. Asylum support, Legal Aid, Home Office waiver, Section 17/20');
    await this.ccdFormPage.click('Continue');

    await this.ccdFormPage.click('The appellant receives Legal Aid');
    await this.ccdFormPage.click('Continue');

    await this.ccdFormPage.setFieldValue('Legal Aid account number', '1A234B');

    await this.ccdFormPage.click('Continue');

    await this.ccdFormPage.headingContains('Check your answers');
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('Submit');

    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }

  async helpWithFees(clickContinue = false) {
    await this.ccdFormPage.selectNextStep('Request a fee remission');

    await this.ccdFormPage.headingContains('Request a fee remission');
    await this.ccdFormPage.click('The appellant has applied for help with fees');
    await this.ccdFormPage.click('Continue');

    await this.ccdFormPage.setFieldValue('Help with Fees reference number', 'HWF-A1B-23');
    await this.ccdFormPage.click('Continue');

    await this.ccdFormPage.headingContains('Check your answers');
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('Submit');

    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }
}
