import { CcdFormPage } from '../pages/ccd-form.page';

export class RecordAgreedRequirementsFlow {

    private ccdFormPage = new CcdFormPage();

    async recordAgreedRequirements(clickContinue = false) {

        await this.ccdFormPage.click('review and submit');

        await this.ccdFormPage.headingContains('Move appeal offline');
        await this.ccdFormPage.contentContains('You should only remove an appeal when you\'re sure it cannot continue through the online service');
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.headingContains('Move appeal offline');
        await this.ccdFormPage.setFieldValue(
            'Length of hearing',
            '6 hours'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Adjustments to accommodate vulnerabilities',
            'Adjustments to accommodate vulnerabilities will be reviewed'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Multimedia equipment',
            'Multimedia equipment requirement will be reviewed'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Single-sex court',
            'Single sex court requirement will be reviewed'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'In camera court',
            'Private hearing requirement will be reviewed'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Other adjustments',
            'Additional adjustments requirement will be reviewed'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.headingContains('Check your answers');
        await this.ccdFormPage.click('Submit');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
            await this.ccdFormPage.waitUntilLoaded();
        }
    }
}