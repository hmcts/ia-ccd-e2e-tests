import { CcdFormPage } from '../pages/ccd-form.page';

export class SubmitBailApplicationFlow {
  private ccdFormPage = new CcdFormPage();

  async submitBailApplication(clickContinue = false, user: string) {
    await this.ccdFormPage.runAccessbility();
    await this.ccdFormPage.selectNextStep('Submit the application');
    if (user === 'Legal Rep') {
      const declarationPath = '//label[contains(text(), "The applicant has confirmed that the facts stated in this application are true.")]';
      await this.ccdFormPage.waitForXpathElementVisible(declarationPath);
      await this.ccdFormPage.clickElement('declarationOnSubmit-declarationOnSubmit');
    }
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('Submit');
    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }
}
