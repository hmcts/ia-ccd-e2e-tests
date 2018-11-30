import { CcdFormPage } from '../pages/ccd-form.page';

export class SubmitCaseFlow {

    private ccdFormPage = new CcdFormPage();

    async submitCase(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Submit your case');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.click('Submit');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
            await this.ccdFormPage.waitUntilLoaded();
        }
    }
}
