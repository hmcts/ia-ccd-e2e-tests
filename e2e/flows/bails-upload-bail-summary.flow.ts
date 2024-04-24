import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class UploadBailSummary {

    private ccdFormPage = new CcdFormPage();

    async uploadBailSummaryFile(clickContinue = false) {
        await browser.sleep(5000)
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
        await browser.sleep(1000)

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async uploadBailSummary(clickContinue = false) {
        await browser.sleep(5000)
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.selectNextStep('Upload Bail Summary');
        let overviewUrl = await browser.getCurrentUrl();
        await this.ccdFormPage.flakeyClick('Go', overviewUrl)
        await this.ccdFormPage.waitForSpinner();
        await this.uploadBailSummaryFile(true);
        await this.ccdFormPage.click('Upload');
        await browser.sleep(5000)
        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }
}
