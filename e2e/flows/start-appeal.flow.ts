import { CcdFormPage } from '../pages/ccd-form.page';

export class StartAppealFlow {

    private ccdFormPage = new CcdFormPage();

    async completeScreeningQuestions(clickContinue = false) {

        await this.ccdFormPage.click('My client is living in the UK');
        await this.ccdFormPage.click('My client is not in detention');
        await this.ccdFormPage.click('My client is not appealing an EU Settlement Scheme decision');
        await this.ccdFormPage.click('My client is not appealing with anyone else as part of a linked or grouped appeal');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeHomeOfficeReference(clickContinue = false) {

        await this.ccdFormPage.setFieldValue('Home Office reference', 'A123456/001');
        await this.ccdFormPage.setFieldValue('Enter the date the decision letter was sent', '{$TODAY}');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeHomeOfficeReferenceWithOutOfTimeDecisionLetter(clickContinue = false) {

        await this.ccdFormPage.setFieldValue('Home Office reference', 'A123456/001');
        await this.ccdFormPage.setFieldValue('Enter the date the decision letter was sent', '01-01-2018');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeBasicDetails(clickContinue = false) {

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

    async completeClientAddress(clickContinue = false, hasFixedAddress = false, address = '', postcode = '') {

        if (!hasFixedAddress) {
            await this.ccdFormPage.setFieldValue('Does the appellant have a fixed address?', 'No');
        } else {
            await this.ccdFormPage.setFieldValue('Does the appellant have a fixed address?', 'Yes');
            await this.ccdFormPage.setFieldValue('Enter a UK postcode', postcode);
            await this.ccdFormPage.click('Find address');
            await this.ccdFormPage.doesDropdownHaveValues('Select an address');
            await this.ccdFormPage.setFieldValue('Select an address', address);
            await this.ccdFormPage.click('Continue');
        }

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeContactPreference(clickContinue = false) {

        await this.ccdFormPage.setFieldValue('Communication Preference', 'Text message');
        await this.ccdFormPage.setFieldValue('Mobile phone number', '07977111111');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeAppealType(clickContinue = false) {

        await this.ccdFormPage.setFieldValue('Type of appeal', 'Refusal of protection claim');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeAppealGrounds(clickContinue = false) {

        await this.ccdFormPage.click('Removing the appellant from the UK would breach the UK\'s obligation under the Refugee Convention');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeNewMatters(clickContinue = false) {

        await this.ccdFormPage.setFieldValue(
            'Are there any new reasons your client wishes to remain in the UK ' +
            'or any new grounds on which they should be permitted to stay?',
            'Yes'
        );
        await this.ccdFormPage.setFieldValue(
            'Explain these new matters and their relevance to the appeal',
            'Birth of a child'
        );

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeDeportationOrder(clickContinue = false) {

      await this.ccdFormPage.setFieldValue(
        'Has a deportation order been made against the appellant?',
        'Yes'
      );

      if (clickContinue) {
        await this.ccdFormPage.click('Continue');
      }
    }

    async completeOtherAppeals(clickContinue = false) {

        await this.ccdFormPage.setFieldValue('Other appeals', 'No');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeReferenceNumber(clickContinue = false) {

        await this.ccdFormPage.setFieldValue('Company', 'IA Legal Services');
        await this.ccdFormPage.setFieldValue('Name', 'Stephen Fenn');
        await this.ccdFormPage.setFieldValue('Own reference', 'some-ref');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeLegalRepresentativeDetails(clickContinue = false) {

        await this.ccdFormPage.setFieldValue('Company', 'IA Legal Services');
        await this.ccdFormPage.setFieldValue('Name', 'Stephen Fenn');
        await this.ccdFormPage.setFieldValue('Own reference', 'ia-legal-fenn');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeCheckYourAnswers(clickContinue = false) {

        if (clickContinue) {
            await this.ccdFormPage.click('Save and continue');
        }
    }

  async saveAppeal(clickContinue = false, hasFixedAddress = false, address = '', postcode = '') {
        await this.completeScreeningQuestions(true);
        await this.completeHomeOfficeReference(true);
        await this.completeBasicDetails(true);
        await this.completeClientAddress(true, hasFixedAddress, address, postcode);
        await this.completeContactPreference(true);
        await this.completeAppealType(true);
        await this.completeAppealGrounds(true);
        await this.completeNewMatters(true);
        await this.completeDeportationOrder(true);
        await this.completeOtherAppeals(true);
        await this.completeLegalRepresentativeDetails(true);
        await this.completeCheckYourAnswers(true);

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }

    async saveOutOfTimeAppeal(clickContinue = false) {
        await this.completeScreeningQuestions(true);
        await this.completeHomeOfficeReferenceWithOutOfTimeDecisionLetter(true);
        await this.completeBasicDetails(true);
        await this.completeClientAddress(true);
        await this.completeContactPreference(true);
        await this.completeAppealType(true);
        await this.completeAppealGrounds(true);
        await this.completeNewMatters(true);
        await this.completeDeportationOrder(true);
        await this.completeOtherAppeals(true);
        await this.completeLegalRepresentativeDetails(true);
        await this.completeCheckYourAnswers(true);

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }
}
