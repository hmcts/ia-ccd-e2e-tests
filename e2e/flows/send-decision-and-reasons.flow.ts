import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class SendDecisionAndReasonsFlow {

    private ccdFormPage = new CcdFormPage();

    async sendDecisionAndReasons() {
        await this.ccdFormPage.selectNextStep('Complete decision and reasons');
        let overviewUrl = await browser.getCurrentUrl();
        await this.ccdFormPage.flakeyClick('Go', overviewUrl)
        await this.ccdFormPage.waitForSpinner();

        await this.ccdFormPage.headingContains('Complete decision and reasons');
        await this.ccdFormPage.setFieldValue('Decision', 'Allowed');
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue('Decision and reasons', '{@test.pdf}');
        await browser.sleep(5000);
        await this.ccdFormPage.click('I confirm this document is signed with today\'s date.');
        await this.ccdFormPage.click('Ensure that the fee award is consistent with your decision.');
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.click('Upload');

        await this.ccdFormPage.click('Close and Return to case details');
    }

    async sendDecisionAndReasonsDismissed() {
        await this.ccdFormPage.selectNextStep('Complete decision and reasons');
        let overviewUrl = await browser.getCurrentUrl();
        await this.ccdFormPage.flakeyClick('Go', overviewUrl)
        await this.ccdFormPage.waitForSpinner();

        await this.ccdFormPage.headingContains('Complete decision and reasons');
        await this.ccdFormPage.setFieldValue('Decision', 'Dismissed on all grounds');
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue('Decision and reasons', '{@test.pdf}');
        await browser.sleep(5000);
        await this.ccdFormPage.click('I confirm this document is signed with today\'s date.');
        await this.ccdFormPage.click('Ensure that the fee award is consistent with your decision.');
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.click('Upload');

        await this.ccdFormPage.click('Close and Return to case details');
    }
}
