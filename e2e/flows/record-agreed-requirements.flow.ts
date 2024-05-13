import { CcdFormPage } from '../pages/ccd-form.page';

export class RecordAgreedRequirementsFlow {

    private ccdFormPage = new CcdFormPage();

    async recordAgreedRequirementsYesPath(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Hearing requirements');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.setFieldValue(
            'Length',
            '3 hours'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.click('Granted');

        

        await this.setRemoteHearingAdjustment(true, true, 'Remote hearing requirement will be reviewed');

        await this.ccdFormPage.click('Granted');

        await this.ccdFormPage.setFieldValue(
            'Adjustments to accommodate vulnerabilities',
            'Physical or mental health conditions will be reviewed'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.click('Granted');

        await this.ccdFormPage.setFieldValue(
            'Multimedia equipment',
            'Multimedia equipment requirement will be reviewed'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.click('Granted');

        await this.ccdFormPage.setFieldValue(
            'Single-sex court',
            'Single sex court requirement will be reviewed'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.click('Granted');

        await this.ccdFormPage.setFieldValue(
            'In camera court',
            'Private hearing requirement will be reviewed'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.click('Granted');

        await this.ccdFormPage.setFieldValue(
            'Other adjustments',
            'Additional adjustments requirement will be reviewed'
        );

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.click('In Person');
        await this.ccdFormPage.click('Continue');
        
        await this.ccdFormPage.setFieldValue(
            'Is the appeal suitable to float?',
            'No'
        );
        await this.ccdFormPage.click('Continue');

        // await this.ccdFormPage.setFieldValue(
        //     'Will this hearing need to be linked to other hearings?',
        //     'No'
        // );
        // await this.ccdFormPage.click('Continue');
        
        await this.ccdFormPage.setFieldValue(
            'Are there any additional instructions for the hearing?',
            'Yes'
        );
        await this.ccdFormPage.setFieldValue(
            'Additional Instructions',
            'Adding Additional instructions for the test'
        );

        await this.ccdFormPage.click('Continue');

        // await this.ccdFormPage.click('Continue');

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

        await this.setRemoteHearingAdjustment(true, true, 'Remote hearing requirement will be reviewed');

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

        await this.setRemoteHearingAdjustment(true, false, 'Remote hearing requirement will be reviewed');

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

    async setRemoteHearingAdjustment(clickContinue = false, yesPath = false, details = '') {
        await this.ccdFormPage.setFieldValue( 'Remote hearing', details);

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }
}
