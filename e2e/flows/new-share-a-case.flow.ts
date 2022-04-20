import { CcdFormPage } from '../pages/ccd-form.page';
import { ShareCasePage } from '../pages/share-case.page';

export class NewShareACaseFlow {

    private ccdFormPage = new CcdFormPage();
    private shareCasePage = new ShareCasePage();

    async selectCaseToShare() {
        await this.shareCasePage.selectAllCaseCheckbox();
        await this.ccdFormPage.isButtonEnabled('Share Case');
        await this.ccdFormPage.click('Share Case');
    }

    async getAndSaveAppealReference() {
        await this.shareCasePage.getAppealReference();
    }

    async filterBySavedAppealReference() {
        await this.shareCasePage.filterByAppealReference();
    }
}
