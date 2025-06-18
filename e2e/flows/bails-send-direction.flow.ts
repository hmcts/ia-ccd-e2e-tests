import { CcdFormPage } from '../pages/ccd-form.page';

export class SendDirection {
  private ccdFormPage = new CcdFormPage();

  async sendDirectionPage(clickContinue = false, receiver) {
    await this.ccdFormPage.runAccessbility();
    await this.ccdFormPage.setFieldValue('Explain the direction you are issuing', 'This is a test direction to the ' + receiver);
    await this.ccdFormPage.setFieldValue('Who are you giving direction to?', receiver);
    await this.ccdFormPage.setFieldValue('By what date must they comply?', '{$TODAY+2|DD MM YYYY}');
    if (clickContinue) {
      await this.ccdFormPage.click('Continue');
    }
  }

  async sendDirection(clickContinue = false, receiver) {
    await this.ccdFormPage.runAccessbility();
    await this.ccdFormPage.selectNextStep('Send direction');
    await this.sendDirectionPage(true, receiver);
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('Send the direction');
    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }
}
