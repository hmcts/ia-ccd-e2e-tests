
import { CcdFormPage } from '../pages/ccd-form.page';

export class RequestHomeOfficeDataFlow {

    private ccdFormPage = new CcdFormPage();

    async requestHomeOfficeData(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Request Home Office data');
        await this.ccdFormPage.click('Go');

        // await this.ccdFormPage.headingContains('Request Home Office data');
        await this.ccdFormPage.setFieldValue('Make a selection', 'No Match');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Request Home Office data');
        if (clickContinue) {
          await this.ccdFormPage.click('Close and Return to case details');
      }
    }
}
