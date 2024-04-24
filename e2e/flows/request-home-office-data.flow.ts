import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class RequestHomeOfficeDataFlow {

    private ccdFormPage = new CcdFormPage();

    async requestHomeOfficeData(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Request Home Office data');
        let overviewUrl = await browser.getCurrentUrl();
        await this.ccdFormPage.flakeyClick('Go', overviewUrl)
        await this.ccdFormPage.waitForSpinner();

        // await this.ccdFormPage.headingContains('Request Home Office data');
        await this.ccdFormPage.setFieldValue('Make a selection', 'No Match');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Request Home Office data');
        if (clickContinue) {
          await this.ccdFormPage.click('Close and Return to case details');
      }
    }
}
