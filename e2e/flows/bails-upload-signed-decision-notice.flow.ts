import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class UploadSignedDecisionNotice {

    private ccdFormPage = new CcdFormPage();

    async uploadSignedDecisionNoticeFile(clickContinue = false, decision) {
        await this.ccdFormPage.runAccessbility();
        if (decision === 'Refused') {
            await this.ccdFormPage.setFieldValue(
                'Decision Document',
                '{@SignedDecisionNoticeRefused.pdf}',
            );
        } else {
            await this.ccdFormPage.setFieldValue(
                'Decision Document',
                '{@SignedDecisionNoticeGranted.pdf}',
            );
        }
        await browser.sleep(3000)
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async uploadSignedDecisionNotice(clickContinue = false, decision) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.selectNextStep('Upload signed decision notice');
        await this.ccdFormPage.click('Go');
        await this.uploadSignedDecisionNoticeFile(true, decision);
        await this.ccdFormPage.click('Upload');
        await browser.sleep(5000)
        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }
}
