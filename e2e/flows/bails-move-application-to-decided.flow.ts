import { CcdFormPage } from '../pages/ccd-form.page';

export class MoveToDecided {
  private ccdFormPage = new CcdFormPage();

  async moveToDecided(clickContinue = false) {
    await this.ccdFormPage.runAccessbility();
    await this.ccdFormPage.selectNextStep('Move application to decided');
    await this.ccdFormPage.click('Continue');
    if (clickContinue) {
      await this.ccdFormPage.click('Submit');
    }
  }
}
