import { CcdFormPage } from '../pages/ccd-form.page';
import { browser, By, by, element } from 'protractor';
import { Wait } from '../enums/wait';

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
            await this.updateHearingRequirementsYesPath();
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
            'Do you need interpreter services on the day?',
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

        await this.setRemoteHearingRequirement(true, 'Yes', 'The appellant has good internet connectivity and a laptops');

        await this.ccdFormPage.setFieldValue(
            'Does the appellant have any physical or mental health issues that may impact them on the day?',
            'Yes'
        );
        await this.ccdFormPage.setFieldValue(
            'Explain in detail how any physical or mental health issues may affect them on the day.',
            'The appellant is deaf in one ear',
            'text area'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Has the appellant had any past experiences that may impact them on the day?',
            'Yes'
        );
        await this.ccdFormPage.setFieldValue(
            'Explain in detail how any past experiences may affect them on the day?',
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
            'Explain in detail why the appellant needs an in camera court.',
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
            'Are there any dates that the appellant or their on-day representation cannot attend?',
            'Yes'
        );

        await this.ccdFormPage.click('Add new');
        await browser.sleep(500);
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

    async updateHearingRequirementsYesPath() {

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
            'Do you need interpreter services on the day?',
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

        await this.setRemoteHearingRequirement(true, 'Yes', 'The appellant has good internet connectivity and a laptops');

        await this.ccdFormPage.setFieldValue(
            'Does the appellant have any physical or mental health issues that may impact them on the day?',
            'Yes'
        );
        await this.ccdFormPage.setFieldValue(
            'Explain in detail how any physical or mental health issues may affect them on the day.',
            'The appellant is deaf in one ear - updated',
            'text area'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Has the appellant had any past experiences that may impact them on the day?',
            'Yes'
        );
        await this.ccdFormPage.setFieldValue(
            'Explain in detail how any past experiences may affect them on the day?',
            'The appellant is fearful of the law - updated',
            'text area'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Do you have multimedia evidence?',
            'Yes'
        );
        await this.ccdFormPage.setFieldValue(
            'You should provide the equipment to play this evidence. If this is not possible, explain why and what equipment you\'ll need to play it.',
            'The appellant has a video recording on a memory stick which needs to be played on a computer - updated',
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
            'The appellant is fearful of men - updated',
            'text area'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Does the appellant need an in camera court?',
            'Yes'
        );
        await this.ccdFormPage.setFieldValue(
            'Explain in detail why the appellant needs an in camera court.',
            'The appellant is afraid of the general public - updated',
            'text area'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Is there anything else you would like to request?',
            'Yes'
        );
        await this.ccdFormPage.setFieldValue(
            'Provide details of any additional requests and why they are necessary.',
            'The appellant would like fresh orange juice and doughnuts - updated',
            'text area'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Are there any dates that the appellant or their on-day representation cannot attend?',
            'Yes'
        );

        await this.ccdFormPage.click('Add new');
        await browser.sleep(500);
        await this.ccdFormPage.setFieldValue(
            'Date',
            '31-12-2021'
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
            'Do you need interpreter services on the day?',
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

        await this.setRemoteHearingRequirement(true, 'No', '');

        await this.ccdFormPage.setFieldValue(
            'Does the appellant have any physical or mental health issues that may impact them on the day?',
            'No'
        );
        await this.ccdFormPage.click('Continue');

        await this.ccdFormPage.setFieldValue(
            'Has the appellant had any past experiences that may impact them on the day?',
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
            'Are there any dates that the appellant or their on-day representation cannot attend?',
            'No'
        );

        await this.ccdFormPage.click('Continue');
    }

    async setRemoteHearingRequirement(clickContinue = false, isYesPath = '', details = '') {
        if (isYesPath === 'Yes') {
            await this.ccdFormPage.setFieldValue(
                'Is there anything you\'d like the Tribunal to consider when deciding if a video call is suitable?',
                'Yes'
            );
            await this.ccdFormPage.setFieldValue(
                'Explain in detail anything you would like the Tribunal to consider',
                details
            );
        } else {
            await this.ccdFormPage.setFieldValue(
                'Is there anything you\'d like the Tribunal to consider when deciding if a video call is suitable?',
                'No'
            );
        }
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async selectVideoHearingsNoRadioButton(shortWait = false) {
        const radioButtonNoIdPath = '//*[@id=\'remoteVideoCall-No\']';

        try {
            await browser.wait(
                async () => {
                    return (await element
                        .all(by.xpath(radioButtonNoIdPath))
                        .filter(e => e.isPresent())
                        .count()) > 0;
                },
                shortWait ? Wait.minimal : Wait.normal
            );
        } catch (error) {
            throw Error('radioButtonNoIdPath radio button not found...')
        }

        browser.driver
            .findElement(By.xpath('//*[@id="remoteVideoCall-No"]'))
            .click()
    }

    async selectVideoHearingsYesRadioButton(shortWait = false) {
        const radioButtonYesIdPath = '//*[@id=\'remoteVideoCall-Yes\']';

        try {
            await browser.wait(
                async () => {
                    return (await element
                        .all(by.xpath(radioButtonYesIdPath))
                        .filter(e => e.isPresent())
                        .count()) > 0;
                },
                shortWait ? Wait.minimal : Wait.normal
            );
        } catch (error) {
            throw Error('radioButtonYesIdPath radio button not found...')
        }

        browser.driver
            .findElement(By.xpath('//*[@id="remoteVideoCall-Yes"]'))
            .click()
    }
}
