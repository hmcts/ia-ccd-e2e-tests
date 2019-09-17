import { CcdFormPage } from '../pages/ccd-form.page';

export class StartAppealFlow {

    private ccdFormPage = new CcdFormPage();

    async completeScreeningQuestions(clickContinue = false) {

        await this.ccdFormPage.headingContains('Tell us about your client');
        await this.ccdFormPage.contentContains('My client is at least 18 years old');
        await this.ccdFormPage.click('My client is at least 18 years old');
        await this.ccdFormPage.click('My client is not currently in detention');
        await this.ccdFormPage.click('My client isn\'t appealing with other people as part of a family appeal');
        await this.ccdFormPage.click('My client is presently in the UK');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeHomeOfficeReference(clickContinue = false) {

        await this.ccdFormPage.headingContains('Home Office reference');
        await this.ccdFormPage.setFieldValue('Home Office reference number', 'A123456/001');
        await this.ccdFormPage.setFieldValue('Date on the decision letter', '{$TODAY}');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeHomeOfficeReferenceWithOutOfTimeDecisionLetter(clickContinue = false) {

        await this.ccdFormPage.setFieldValue('Home Office reference number', 'A123456/001');
        await this.ccdFormPage.setFieldValue('Date on the decision letter', '01-01-2018');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeBasicDetails(clickContinue = false) {

        await this.ccdFormPage.headingContains('Basic details');
        await this.ccdFormPage.setFieldValue('Title', 'Mr');
        await this.ccdFormPage.setFieldValue('Given names', 'José');
        await this.ccdFormPage.setFieldValue('Family name', 'González');
        await this.ccdFormPage.setFieldValue('Date of birth', '31-12-1999');
        await this.ccdFormPage.addCollectionItem('Nationality');
        await this.ccdFormPage.setFieldValue('Nationality', 'Finland', 'select list', 'first', 'Nationality', 'first');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeClientAddress(clickContinue = false, hasFixedAddress = false) {

        await this.ccdFormPage.headingContains('Your client\'s address');

        if (!hasFixedAddress) {
            await this.ccdFormPage.setFieldValue('Does the appellant have a fixed address?', 'No');
        } else {
            await this.ccdFormPage.setFieldValue('Does the appellant have a fixed address?', 'Yes');
            await this.ccdFormPage.setFieldValue('Enter a UK postcode', 'M1 4AH');
            await this.ccdFormPage.click('Find address');
            await this.ccdFormPage.doesDropdownHaveValues('Select an address');
            await this.ccdFormPage.setFieldValue('Select an address', 'Quality Save, The Exchange, Piccadilly Plaza, Manchester');
            await this.ccdFormPage.click('Continue');
        }

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async whatTypeOfDecisionIsYourClientAppealingAgainst(clickContinue = false) {

        await this.ccdFormPage.headingContains('What type of decision');
        await this.ccdFormPage.setFieldValue('Decision type', 'The refusal of a protection claim');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeAppealGrounds(clickContinue = false) {

        await this.ccdFormPage.headingContains('On which grounds');
        await this.ccdFormPage.click('Removing the appellant from the UK would breach the UK\'s obligation under the Refugee Convention');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeNewMatters(clickContinue = false) {

        await this.ccdFormPage.headingContains('New matters');
        await this.ccdFormPage.setFieldValue(
            'Are there any new reasons your client wishes to remain in the UK ' +
            'or any new grounds on which they should be permitted to stay?',
            'Yes'
        );
        await this.ccdFormPage.setFieldValue(
            'Explain what the new matters are and why they are relevant to this appeal.',
            'Birth of a child'
        );

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeOtherAppeals(clickContinue = false) {

        await this.ccdFormPage.headingContains('Has your client appealed');
        await this.ccdFormPage.setFieldValue('Other appeals', 'No');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeReferenceNumber(clickContinue = false) {

        await this.ccdFormPage.headingContains('Your own reference number');
        await this.ccdFormPage.setFieldValue(
            'If you prefer to use your own reference number for this case, you can enter it here. (Optional)',
            'some-ref'
        );

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeCheckYourAnswers(clickContinue = false) {

        await this.ccdFormPage.headingContains('Check your answers');

        if (clickContinue) {
            await this.ccdFormPage.click('Save and continue');
        }
    }

    async saveAppeal(clickContinue = false, hasFixedAddress = false) {
        await this.completeScreeningQuestions(true);
        await this.completeHomeOfficeReference(true);
        await this.completeBasicDetails(true);
        await this.completeClientAddress(true, hasFixedAddress);
        await this.whatTypeOfDecisionIsYourClientAppealingAgainst(true);
        await this.completeAppealGrounds(true);
        await this.completeNewMatters(true);
        await this.completeOtherAppeals(true);
        await this.completeReferenceNumber(true);
        await this.completeCheckYourAnswers(true);

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
            await this.ccdFormPage.waitUntilLoaded();
        }
    }

    async saveOutOfTimeAppeal(clickContinue = false) {
        await this.completeScreeningQuestions(true);
        await this.completeHomeOfficeReferenceWithOutOfTimeDecisionLetter(true);
        await this.completeBasicDetails(true);
        await this.completeClientAddress(true);
        await this.whatTypeOfDecisionIsYourClientAppealingAgainst(true);
        await this.completeAppealGrounds(true);
        await this.completeNewMatters(true);
        await this.completeOtherAppeals(true);
        await this.completeReferenceNumber(true);
        await this.completeCheckYourAnswers(true);

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
            await this.ccdFormPage.waitUntilLoaded();
        }
    }
}
