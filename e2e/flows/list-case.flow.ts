import { CcdFormPage } from '../pages/ccd-form.page';

export class ListCaseFlow {

    private ccdFormPage = new CcdFormPage();

    async listTheCase(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('List the case');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.headingContains('List the case');
        await this.ccdFormPage.setFieldValue(
            'Listing reference',
            'LP/12345/2019'
        );
        await this.ccdFormPage.setFieldValue(
            'Hearing centre',
            'Taylor House'
        );

        await this.ccdFormPage.setFieldValue(
            'Length of hearing',
            '6 hours'
        );

        await this.ccdFormPage.setFieldValue(
            'Hearing date and time',
            '{$TODAY+14|DD-MM-YYYY} 10:30:00'
        );

        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('List case');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
            await this.ccdFormPage.contentContains('You have listed the case');
        }
    }
}
