import { CcdFormPage } from '../pages/ccd-form.page';

export class SubmitBailApplicationFlow {
  private ccdFormPage = new CcdFormPage();

  async submitBailApplication(clickContinue = false, user: string) {
    await this.ccdFormPage.runAccessbility();
    await this.ccdFormPage.selectNextStep('Submit the application');
    if (user === 'Legal Rep') {
      let loaded = false;
      for (let i = 0; i < 3; i++) {
        loaded = await this.ccdFormPage.contentContains('The applicant has confirmed that the facts stated in this application are true.');
        if (loaded) {
          break;
        }
      }
      await this.ccdFormPage.click('The applicant has confirmed that the facts stated in this application are true.');
    }
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('Submit');
    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }
}
