import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class MarkAppealAsPaidFlow {

    private ccdFormPage = new CcdFormPage();

    async markAppealAsPaid(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Mark appeal as paid');
        let overviewUrl = await browser.getCurrentUrl();
        await this.ccdFormPage.flakeyClick('Go', overviewUrl)
        await this.ccdFormPage.waitForSpinner();

        await this.ccdFormPage.headingContains('Mark appeal as paid');
        await this.ccdFormPage.setFieldValue(
            'Payment date',
            '{$TODAY|DD-MM-YYYY}'
        );

        await this.ccdFormPage.setFieldValue(
            'Amount paid',
            '140'
        );

        await this.ccdFormPage.setFieldValue('Amount paid', '40');
        await this.ccdFormPage.setFieldValue(
            'Additional payment information (Optional)',
            'The fee for the appeal has been paid now.',
            'text area'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.headingContains('Check your answers');
        await this.ccdFormPage.click('Mark as paid');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }
}
