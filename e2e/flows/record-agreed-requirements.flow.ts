import { CcdFormPage } from '../pages/ccd-form.page';

export class RecordAgreedRequirementsFlow {

    private ccdFormPage = new CcdFormPage();

    async recordAgreedRequirementsYesPath(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Hearing requirements');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.setFieldValue(
            'Length',
            '6 hours'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Adjustments to accommodate vulnerabilities',
            'Physical or mental health conditions will be reviewed'
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

        await this.ccdFormPage.click('Submit');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }

    async recordUpdatedHearingRequirementsYesPath(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Update hearing adjustments');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.setFieldValue(
            'Length',
            '6 hours'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Adjustments to accommodate vulnerabilities',
            'Physical or mental health conditions will be reviewed - updated'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Multimedia equipment',
            'Multimedia equipment requirement will be reviewed - updated'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Single-sex court',
            'Single sex court requirement will be reviewed - updated'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'In camera court',
            'Private hearing requirement will be reviewed - updated'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Other adjustments',
            'Additional adjustments requirement will be reviewed - updated'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.headingContains('Check your answers');
        await this.ccdFormPage.click('Update');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
            await this.ccdFormPage.waitUntilLoaded();
        }
    }

    async recordAgreedRequirementsNoPath(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Hearing requirements');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.setFieldValue(
            'Length',
            '6 hours'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.click('Submit');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }
}
