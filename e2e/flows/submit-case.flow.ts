import { CcdFormPage } from '../pages/ccd-form.page';
import { Logger } from '../helpers/logger';

const isSaveAndContinueEnabled = require('../ia.conf').isSaveAndContinueEnabled === 'true';

export class SubmitCaseFlow {
  private ccdFormPage = new CcdFormPage();

  async submitCase(clickContinue = false) {
    if (isSaveAndContinueEnabled) {
      await this.ccdFormPage.selectNextStep('Submit your case');

      const currentUrl = await this.ccdFormPage.getCurrentUrl();
      await this.ccdFormPage.click('Submit');

      if (clickContinue) {
        await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
      }
    } else {
      Logger.log(`INFO: 'Submit your case' step is ignored because the Save and Continue feature is disabled`);
    }
  }
}
