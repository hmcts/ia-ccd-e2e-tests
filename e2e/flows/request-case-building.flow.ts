import { CcdFormPage } from '../pages/ccd-form.page';

export class RequestCaseBuildingFlow {
  private ccdFormPage = new CcdFormPage();

  async requestCaseBuilding() {
    await this.ccdFormPage.selectNextStep('Request case building');

    await this.ccdFormPage.headingContains('Request case building');
    await this.ccdFormPage.click('Continue');
    await this.ccdFormPage.click('Send direction');
  }
}
