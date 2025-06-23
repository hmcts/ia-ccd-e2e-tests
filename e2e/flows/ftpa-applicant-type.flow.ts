import { CcdFormPage } from '../pages/ccd-form.page';

export class SelectFtpaApplicantType {
  private ccdFormPage = new CcdFormPage();

  async choseAppellant(clickContinue = false) {
    await this.ccdFormPage.click('Appellant');
  }

  async choseHomeOffice(clickContinue = false) {
    await this.ccdFormPage.click('Home Office');
  }
}
