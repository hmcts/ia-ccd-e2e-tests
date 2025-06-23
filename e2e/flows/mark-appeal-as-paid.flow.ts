import { CcdFormPage } from '../pages/ccd-form.page';

export class MarkAppealAsPaidFlow {
  private ccdFormPage = new CcdFormPage();

  async markAppealAsPaid(clickContinue = false) {
    await this.ccdFormPage.selectNextStep('Mark appeal as paid');

    await this.ccdFormPage.headingContains('Mark appeal as paid');
    await this.ccdFormPage.setFieldValue('Payment date', '{$TODAY|DD-MM-YYYY}');

    await this.ccdFormPage.setFieldValue('Amount paid', '140');

    await this.ccdFormPage.setFieldValue('Amount paid', '40');
    await this.ccdFormPage.setFieldValue('Additional payment information (Optional)', 'The fee for the appeal has been paid now.', 'text area');

    await this.ccdFormPage.click('Continue');

    await this.ccdFormPage.headingContains('Check your answers');
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('Mark as paid');

    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }
}
