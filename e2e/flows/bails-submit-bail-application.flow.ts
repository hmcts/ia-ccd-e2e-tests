import { CcdFormPage } from '../pages/ccd-form.page';

export class SubmitBailApplicationFlow {
  private ccdFormPage = new CcdFormPage();

  async submitBailApplication(clickContinue = false, user: string) {
    await this.ccdFormPage.runAccessbility();
    await this.ccdFormPage.selectNextStep('Submit the application');

    let currentUrl: string;
    try {
      currentUrl = await this.submitStepsAndGetUrl(user)
      await this.ccdFormPage.click('Submit');
    } catch (error) {
      await this.ccdFormPage.clickButtonIfVisible('Ok');
      currentUrl = await this.submitStepsAndGetUrl(user)
      await this.ccdFormPage.click('Submit');
    }
    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }

  async submitStepsAndGetUrl(user: string): Promise<string> {
    if (user === 'Legal Rep') {
      const declarationPath = '//label[contains(text(), "The applicant has confirmed that the facts stated in this application are true.")]';
      await this.ccdFormPage.waitForXpathElementVisible(declarationPath);
      await this.ccdFormPage.clickElement('declarationOnSubmit-declarationOnSubmit');
    }
    return this.ccdFormPage.getCurrentUrl();
  }
}
