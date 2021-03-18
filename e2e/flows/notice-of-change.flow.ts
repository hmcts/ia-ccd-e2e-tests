import { CcdFormPage } from '../pages/ccd-form.page';
import { NoticeOfChangePage } from '../pages/notice-of-change.page';

export class NoticeOfChangeFlow {

    private ccdFormPage = new CcdFormPage();
    private noticeOfChangePage = new NoticeOfChangePage();

    async selectShareCase() {
        await this.noticeOfChangePage.selectLastCaseCheckbox();
        await this.ccdFormPage.isButtonEnabled('Share Case');
        await this.ccdFormPage.click('Share Case');
    }
}
