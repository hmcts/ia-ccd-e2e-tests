import { CcdFormPage } from '../pages/ccd-form.page';

export class SubmitHearingRequirementsFlow {

    private ccdFormPage = new CcdFormPage();

    async submitHearingRequirements(clickContinue = false, isYesPath = false) {

        await this.ccdFormPage.selectNextStep('Submit hearing requirements');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.headingContains('Submit hearing requirements');

        if (isYesPath) {
            await this.hearingRequirementsYesPath();
        } else {
            await this.hearingRequirementsNoPath();
        }
        await this.ccdFormPage.click('Submit');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }

    async updateHearingRequirements(clickContinue = false, isYesPath = false) {

        await this.ccdFormPage.selectNextStep('Update hearing requirements');
        await this.ccdFormPage.click('Go');

        if (isYesPath) {
            await this.hearingRequirementsYesPath();
        } else {
            await this.hearingRequirementsNoPath();
        }

        await this.ccdFormPage.click('Update');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }

    async hearingRequirementsYesPath() {

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Will the appellant attend the hearing?',
            'Yes'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Will the appellant give oral evidence at the hearing?',
            'Yes'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Will any witnesses attend the hearing?',
            'Yes'
        );
        await this.ccdFormPage.click('Add new');
        await this.ccdFormPage.setFieldValue(
            'Name',
            'Jenny button'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Do you need interpreter services at the hearing?',
            'Yes'
        );
        await this.ccdFormPage.click('Add new');
        await this.ccdFormPage.setFieldValue(
            'Language',
            'Zulu'
        );
        await this.ccdFormPage.setFieldValue(
            'Dialect',
            'Kwabe'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Do you need a hearing room with step-free access?',
            'Yes'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Do you need a hearing loop?',
            'Yes'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Does the appellant have any physical or mental health issues that may impact them during the hearing?',
            'Yes'
        );
        await this.ccdFormPage.setFieldValue(
            'Explain in detail how any physical or mental health issues may affect them during the hearing.',
            'The appellant is deaf in one ear',
            'text area'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Has the appellant had any past experiences that may impact them during the hearing?',
            'Yes'
        );
        await this.ccdFormPage.setFieldValue(
            'Explain in detail how any past experiences may affect them during the hearing.',
            'The appellant is fearful of the law',
            'text area'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Do you have multimedia evidence?',
            'Yes'
        );
        await this.ccdFormPage.setFieldValue(
            'You should provide the equipment to play this evidence. If this is not possible, explain why and what equipment you\'ll need to play it.',
            'The appellant has a video recording on a memory stick which needs to be played on a computer',
            'text area'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Does the appellant need a single-sex court?',
            'Yes'
        );
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.setFieldValue(
            'What type of court do they need?',
            'All female'
        );
        await this.ccdFormPage.setFieldValue(
            'Explain in detail why the appellant needs a single-sex court.',
            'The appellant is fearful of men',
            'text area'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Does the appellant need an in camera court?',
            'Yes'
        );
        await this.ccdFormPage.setFieldValue(
            'Explain in detail why the appellant needs a private hearing.',
            'The appellant is afraid of the general public',
            'text area'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Is there anything else you would like to request?',
            'Yes'
        );
        await this.ccdFormPage.setFieldValue(
            'Provide details of any additional requests and why they are necessary.',
            'The appellant would like fresh orange juice and doughnuts',
            'text area'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Are there any dates that the appellant or their on-day representation cannot attend a hearing?',
            'Yes'
        );

        await this.ccdFormPage.click('Add new');
        await this.ccdFormPage.setFieldValue(
            'Date',
            '31-12-2019'
        );
        await this.ccdFormPage.setFieldValue(
            'Reason',
            'New year\'s eve',
            'text area'
        );

        await this.ccdFormPage.click('Continue');

    }

    async hearingRequirementsNoPath() {

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
    }
}
