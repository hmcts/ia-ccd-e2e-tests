import { CcdFormPage } from '../pages/ccd-form.page';

export class StartBailApplicationFlow {

    private ccdFormPage = new CcdFormPage();

    async completeBeforeYouStart(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    /*async selectPartyApplication(party) {
        await this.ccdFormPage.setFieldValue('Application sent by', party);
    }*/
}