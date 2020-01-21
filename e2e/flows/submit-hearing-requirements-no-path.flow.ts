import { CcdFormPage } from '../pages/ccd-form.page';

export class SubmitHearingRequirementsNoPathFlow {

    private ccdFormPage = new CcdFormPage();

    async submitHearingRequirements(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Submit hearing requirements');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.headingContains('Submit hearing requirements');
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Will the appellant attend the hearing?',
            'No'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Will the appellant give oral evidence at the hearing?',
            'No'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Will any witnesses attend the hearing?',
            'No'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Do you need interpreter services at the hearing?',
            'No'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Do you need a hearing room with step-free access?',
            'No'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Do you need a hearing loop?',
            'No'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Does the appellant have any physical or mental health issues that may impact them during the hearing?',
            'No'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Has the appellant had any past experiences that may impact them during the hearing?',
            'No'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Do you have multimedia evidence?',
            'No'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Does the appellant need a single-sex court?',
            'No'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Does the appellant need an in camera court?',
            'No'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Is there anything else you would like to request?',
            'No'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Are there any dates that the appellant or their on-day representation cannot attend a hearing?',
            'No'
        );

        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Submit');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
            await this.ccdFormPage.contentContains('You\'ve submitted your hearing requirements');
        }
    }
}
