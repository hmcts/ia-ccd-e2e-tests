import { CcdFormPage } from '../pages/ccd-form.page';
import { Logger } from '../helpers/logger';
import { browser } from 'protractor';

const isSaveAndContinueEnabled = require('../ia.conf').isSaveAndContinueEnabled === 'true';

export class SubmitCaseFlow {

    private ccdFormPage = new CcdFormPage();

    async submitCase(clickContinue = false) {

      if (isSaveAndContinueEnabled) {
        await this.ccdFormPage.selectNextStep('Submit your case');
        let overviewUrl = await browser.getCurrentUrl();
        await this.ccdFormPage.flakeyClick('Go', overviewUrl)

        await this.ccdFormPage.click('Submit');

        if (clickContinue) {
          await this.ccdFormPage.click('Close and Return to case details');
        }
      } else {
        Logger.log(`INFO: 'Submit your case' step is ignored because the Save and Continue feature is disabled`);
      }
    }
}
