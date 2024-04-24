import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class RequestFeeRemissionFlow {

    private ccdFormPage = new CcdFormPage();

    async legalAid(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Request a fee remission');
        let overviewUrl = await browser.getCurrentUrl();
        await this.ccdFormPage.flakeyClick('Go', overviewUrl)
        await this.ccdFormPage.waitForSpinner();

        await this.ccdFormPage.headingContains('Request a fee remission');
        await this.ccdFormPage.click('My client has a remission, e.g. Asylum support, Legal Aid, Home Office waiver, Section 17/20');
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.click('My client receives Legal Aid');
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue('Legal Aid account number', '1A234B');

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.headingContains('Check your answers');
        await this.ccdFormPage.click('Submit');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }

    async helpWithFees(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Request a fee remission');
        let overviewUrl = await browser.getCurrentUrl();
        await this.ccdFormPage.flakeyClick('Go', overviewUrl)
        await this.ccdFormPage.waitForSpinner();

        await this.ccdFormPage.headingContains('Request a fee remission');
        await this.ccdFormPage.click('My client has a Help with Fees reference number');
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue('Help with Fees reference number', 'HWF-A1B-23');
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.headingContains('Check your answers');
        await this.ccdFormPage.click('Submit');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }
}
