import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class UploadBailSummary {

    private ccdFormPage = new CcdFormPage();

    async uploadBailSummaryFile(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await browser.sleep(1000)
        await this.ccdFormPage.click('Add new');
        await this.ccdFormPage.setFieldValue(
            'Document',
            '{@BailSummary.pdf}',
            'document',
            'first',
            'Upload Bail Summary',
            'first'
        );
        await this.ccdFormPage.setFieldValue(
            'Describe the document',
            'This is the bail summary',
            'text area',
            'first',
            'Upload Bail Summary',
            'first'
        );
        await browser.sleep(3000)

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async uploadBailSummary(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.selectNextStep('Upload Bail Summary');
        await this.ccdFormPage.click('Go');
        await this.uploadBailSummaryFile(true);
        await this.ccdFormPage.click('Upload');
        await browser.sleep(10000)
        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }
}
