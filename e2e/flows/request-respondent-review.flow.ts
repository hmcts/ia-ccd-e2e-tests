import { CcdFormPage } from '../pages/ccd-form.page';

export class RequestRespondentReviewFlow {
  private ccdFormPage = new CcdFormPage();

  async requestRespondentReview(clickContinue = false) {
    await this.ccdFormPage.selectNextStep('Request respondent review');

    await this.ccdFormPage.headingContains('Request respondent review');
    await this.ccdFormPage.click('Continue');
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('Send direction');

    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }

  async requestAppellantReview(clickContinue = false) {
    await this.ccdFormPage.linkContains('direct the appellant to review the Home Office response');
    await this.ccdFormPage.click('direct the appellant to review the Home Office response');

    await this.ccdFormPage.headingContains('Review Home Office response');
    await this.ccdFormPage.click('Continue');
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('Send direction');

    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }
}
