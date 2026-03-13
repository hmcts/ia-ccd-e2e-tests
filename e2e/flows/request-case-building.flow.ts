import { CcdFormPage } from '../pages/ccd-form.page';

export class RequestCaseBuildingFlow {
  private ccdFormPage = new CcdFormPage();

  async requestCaseBuilding(clickContinue = false) {
    await this.ccdFormPage.selectNextStep('Request case building');

    await this.ccdFormPage.headingContains('Request case building');
    await this.ccdFormPage.click('Continue');
    await this.ccdFormPage.contentContains('Check your answers');
    const currentUrl = clickContinue ? await this.ccdFormPage.getCurrentUrl() : '';
    await this.ccdFormPage.click('Send direction');
    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }
}
