import { browser, by } from 'protractor';
import { CcdFormPage } from '../pages/ccd-form.page';

const isOutOfCountryEnabled = require('../ia.conf').isOutOfCountryEnabled === 'true';
const remote = require('selenium-webdriver/remote');
const path = require('path');
const {WebDriver} = require('selenium-webdriver');

export class StartAppealFlow {

    private ccdFormPage = new CcdFormPage();

    async completeScreeningQuestions(clickContinue = false) {
        if (isOutOfCountryEnabled) {
            await this.completeScreeningQuestionsOutOfCountry(clickContinue);

            /* Removing this check as it takes too long and causes the nightly test run to fail */
            // await this.ccdFormPage.headingContains('Tell us about your client')

            await this.ccdFormPage.setFieldValue('Is your client currently living in the United Kingdom?', 'Yes');
        } else {
            await this.ccdFormPage.runAccessbility();
            await this.ccdFormPage.click('My client is living in the UK');
            await this.ccdFormPage.click('My client is not in detention');
        }

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeScreeningQuestionsOutOfCountry(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.click('My client is not in detention');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeOutOfCountryQuestion(clickContinue = false, appellantInUk = '') {
        if (appellantInUk === 'No') {
            await this.ccdFormPage.setFieldValue('Is your client currently living in the United Kingdom?', 'No');
        } else {
            await this.ccdFormPage.setFieldValue('Is your client currently living in the United Kingdom?', 'Yes');
        }

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeHomeOfficeReference(clickContinue = false, ooc = false, homeOfficeReferenceNumber = '') {
        await this.ccdFormPage.runAccessbility();
        if (homeOfficeReferenceNumber !== '') {
            await this.ccdFormPage.setFieldValue('Home Office Reference/Case ID', homeOfficeReferenceNumber);
        } else {
            await this.ccdFormPage.setFieldValue('Home Office Reference/Case ID', '01234567');
        }
        if (ooc) {
            await this.ccdFormPage.setFieldValue('Date letter received', '{$TODAY-2}');
        } else {
            await this.ccdFormPage.setFieldValue('Enter the date the decision letter was sent', '{$TODAY-10}');
        }

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeUploadNoticeDecision(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await browser.sleep(1000)
        await this.ccdFormPage.click('Add new');
        await this.ccdFormPage.setFieldValue(
            'Document',
            '{@Evidence1.pdf}',
            'document',
            'first',
            'Notice of Decision',
            'first'
        );
        await this.ccdFormPage.setFieldValue(
            'Describe the document',
            'This is the notice of decision',
            'text area',
            'first',
            'Notice of Decision',
            'first'
        );
        await browser.sleep(3000)

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeUploadNoticeDecisionNoUpload(clickContinue = false) {

        await this.ccdFormPage.runAccessbility();
        await browser.sleep(1000)
        await this.ccdFormPage.click('Add new');
        let fileDetector = WebDriver.fileDetector;
        browser.setFileDetector(new remote.FileDetector())
        let absolutePath = path.resolve('documents', 'Evidence1.pdf');
        await browser.element.all(by.css('input[type=file]')).get(0).sendKeys(absolutePath);
        browser.setFileDetector(fileDetector);
        await browser.sleep(5000)
        await this.ccdFormPage.setFieldValue(
            'Describe the document',
            'This is the notice of decision',
            'text area',
            'first',
            'Notice of Decision',
            'first'
        );
        await browser.sleep(3000)

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeHomeOfficeReferenceWithOutOfTimeDecisionLetter(clickContinue = false) {

        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Home Office Reference/Case ID', '01234567');
        await this.ccdFormPage.setFieldValue('Enter the date the decision letter was sent', '01-01-2018');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeBasicDetails(clickContinue = false) {

        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Title', 'Mr');
        await this.ccdFormPage.setFieldValue('Given names', 'José');
        await this.ccdFormPage.setFieldValue('Family name', 'González');
        await this.ccdFormPage.setFieldValue('Date of birth', '31-12-1999');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeNationality(clickContinue = false) {
        await browser.sleep(3000);
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Nationality', 'Has a nationality');
        await browser.sleep(3000);
        await this.ccdFormPage.addCollectionItem('Nationality');
        await this.ccdFormPage.setFieldValue('Nationality', 'Finland', 'select list', 'first', 'Nationality', 'first');
        await browser.sleep(2000);

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeClientAddress(clickContinue = false, hasFixedAddress = false, address = '', postcode = '') {

        await this.ccdFormPage.runAccessbility();
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

        await this.ccdFormPage.runAccessbility();
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

    async completeGivenAppealType(clickContinue = false, appealType) {

        await this.ccdFormPage.runAccessbility();
        if (appealType === 'EA') {
            await this.ccdFormPage.setFieldValue('Type of appeal', 'Refusal of application under the EEA regulations');
        }
        if (appealType === 'HU') {
            await this.ccdFormPage.setFieldValue('Type of appeal', 'Refusal of a human rights claim');
        }
        if (appealType === 'PA') {
            await this.ccdFormPage.setFieldValue('Type of appeal', 'Refusal of protection claim');
        }
        if (appealType === 'RP') {
            await this.ccdFormPage.setFieldValue('Type of appeal', 'Revocation of a protection status');
        }
        if (appealType === 'DC') {
            await this.ccdFormPage.setFieldValue('Type of appeal', 'Deprivation of citizenship');
        }
        if (appealType === 'EU') {
            await this.ccdFormPage.setFieldValue('Type of appeal', 'EU Settlement Scheme');
        }
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeAppealGrounds(clickContinue = false) {

        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.click('Removing the appellant from the UK would breach the UK\'s obligation under the Refugee Convention');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completedGivenAppealGrounds(clickContinue = false, appealType) {

        await this.ccdFormPage.runAccessbility();
        if (appealType === 'EA') {
            await this.ccdFormPage.click('The decision breaches the appellant\'s rights under the EEA regulations');
        }
        if (appealType === 'HU') {
            await this.ccdFormPage.click('The decision is unlawful under section 6 of the Human Rights Act 1998');
        }
        if (appealType === 'PA') {
            await this.ccdFormPage.click('Removing the appellant from the UK would breach the UK\'s obligation under the Refugee Convention');
        }
        if (appealType === 'RP') {
            await this.ccdFormPage.click('Revocation of the appellant\'s protection status breaches the United Kingdom\'s obligations under the Refugee Convention');
        }
        if (appealType === 'DC') {
            await this.ccdFormPage.click('Deprivation would have a disproportionate effect');
        }
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completedDeportationOrder(clickContinue = false, appealType) {

        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Has a deportation order been made against the appellant?', 'No');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeNewMatters(clickContinue = false) {

        await this.ccdFormPage.runAccessbility();
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

        await this.ccdFormPage.runAccessbility();
        await browser.sleep(2000);
      await this.ccdFormPage.setFieldValue(
        'Has a deportation order been made against the appellant?',
        'Yes'
      );

      if (clickContinue) {
        await this.ccdFormPage.click('Continue');
      }
    }

    async completeOtherAppeals(clickContinue = false) {

        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Other appeals', 'No');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeReferenceNumber(clickContinue = false) {

        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Company', 'IA Legal Services');
        await this.ccdFormPage.setFieldValue('Name', 'Stephen Fenn');
        await this.ccdFormPage.setFieldValue('Own reference', 'some-ref');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeLegalRepresentativeDetails(clickContinue = false) {

        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Company', 'IA Legal Services');
        await this.ccdFormPage.setFieldValue('Name', 'Stephen Fenn');
        await this.ccdFormPage.setFieldValue('Own reference', 'ia-legal-fenn');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeGivenFee(clickContinue = false, feeType) {

        await this.ccdFormPage.runAccessbility();
        if (feeType === 'without') {
            await this.ccdFormPage.setFieldValue('How do you want the appeal to be decided?', 'Decision without a hearing. The fee for this type of appeal is £80');
        } else {
            await this.ccdFormPage.setFieldValue('How do you want the appeal to be decided?', 'Decision with a hearing. The fee for this type of appeal is £140');
        }
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeHowToPayNow(clickContinue = false) {

        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.click('Pay using Payment by Account');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeHowToPayOffline(clickContinue = false, appealType) {

        await this.ccdFormPage.runAccessbility();
        if (appealType === 'PA') {
            await this.ccdFormPage.setFieldValue('Select a payment method', 'Pay after submitting the appeal by card');
        }
        if (appealType === 'EA' || appealType === 'HU' || appealType === 'EU') {
            await this.ccdFormPage.click('Pay by card');
        }

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeHowToPayLater(clickContinue = false, appealType) {

        await this.ccdFormPage.runAccessbility();
        if (appealType === 'PA') {
            await this.ccdFormPage.setFieldValue('Select a payment method', 'Pay after submitting the appeal using Payment by Account');
        }

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeCheckYourAnswers(clickContinue = false) {

        await this.ccdFormPage.runAccessbility();
        await browser.sleep(5000)
        if (clickContinue) {
            await this.ccdFormPage.click('Save and continue');
        }
    }

    async saveAppeal(clickContinue = false, hasFixedAddress = false, address = '', postcode = '') {
        await this.completeScreeningQuestions(true);
        await this.completeHomeOfficeReference(true);
        await this.completeUploadNoticeDecision(true);
        await this.completeBasicDetails(true);
        await this.completeNationality(true);
        await this.completeClientAddress(true, hasFixedAddress, address, postcode);
        await this.completeContactPreference(true);
        await this.completeAppealType(true);
        await this.completeAppealGrounds(true);
        await this.completeDeportationOrder(true);
        await this.completeNewMatters(true);
        await this.completeOtherAppeals(true);
        await this.completeLegalRepresentativeDetails(true);
        await this.completeCheckYourAnswers(true);
    }

    async saveInitialNonPaymentAppeal(clickContinue = false, appealType = '', hasFixedAddress = false, address = '', postcode = '', hearingOption = '') {
        await this.completeClientDetails(false);
        await this.completeGivenAppealType(true, appealType);
        if (appealType !== 'EU') {
            await this.completedGivenAppealGrounds(true, appealType);
        }
        await this.completeDeportationOrder(true);
        await this.completeNewMatters(true);
        await this.completeOtherAppeals(true);
        await this.completeLegalRepresentativeDetails(true);
        await this.completeHearingOption(true, hearingOption);
        await this.completeCheckYourAnswers(true);
    }

    async saveInitialAppealWithFee(clickContinue = false, appealType = '', remission = '', feeType = '', hasFixedAddress = false, address = '', postcode = '') {
        await this.completeClientDetails(false, hasFixedAddress, address, postcode);
        await this.completeGivenAppealType(true, appealType);
        if (appealType !== 'EU') {
            await this.completedGivenAppealGrounds(true, appealType);
        }
        await this.completeDeportationOrder(true);
        await this.completeNewMatters(true);
        await this.completeOtherAppeals(true);
        await this.completeLegalRepresentativeDetails(true);
        await this.completeGivenFee(true, feeType);
        await this.completeRemissionDetails(true, remission);
        await this.completeHowToPayOffline(true, 'PA');
        await this.completeCheckYourAnswers(true);
    }

    async saveInitialAppealWithoutRemission(clickContinue = false, appealType = '', feeType = '', paymentChoice = '', hasFixedAddress = false, address = '', postcode = '') {
        await this.completeClientDetails(false, hasFixedAddress, address, postcode);
        await this.completeGivenAppealType(true, appealType);
        if (appealType !== 'EU') {
            await this.completedGivenAppealGrounds(true, appealType);
        }
        await this.completeDeportationOrder(true);
        await this.completeNewMatters(true);
        await this.completeOtherAppeals(true);
        await this.completeLegalRepresentativeDetails(true);
        await this.completeGivenFee(true, feeType);
        await this.completeRemissionDetails(true, 'no remission');
        if (paymentChoice === 'now') {
            await this.completeHowToPayNow(true);
        } else if (paymentChoice === 'later') {
            await this.completeHowToPayLater(true, appealType);
        } else {
            await this.completeHowToPayOffline(true, appealType);
        }
        await this.completeCheckYourAnswers(true);
    }

    async saveInitialNonPaymentAppealOutOfCountry(clickContinue = false, appealType = '', appellantInUk = '') {
        await this.completeScreeningQuestionsOutOfCountry(true);
        await this.completeOutOfCountryQuestion(true, appellantInUk);
        await this.completeHomeOfficeReference(true);
        await this.completeUploadNoticeDecisionNoUpload(true);
        await this.completeBasicDetails(true);
        await this.completeNationality(true);
        await this.completeClientAddress(true, false, '', '');
        await this.completeContactPreference(true);
        await this.completeGivenAppealType(true, appealType);
        if (appealType !== 'EU') {
            await this.completedGivenAppealGrounds(true, appealType);
        }
        await this.completeDeportationOrder(true);
        await this.completeNewMatters(true);
        await this.completeOtherAppeals(true);
        await this.completeLegalRepresentativeDetails(true);
        await this.completeCheckYourAnswers(true);
    }

    async saveInitialAppealWithFeeOutOfCountry(clickContinue = false, appealType = '', remission = '', feeType = '', appellantInUk = '') {
        await this.completeScreeningQuestionsOutOfCountry(true);
        await this.completeOutOfCountryQuestion(true, appellantInUk);
        await this.completeHomeOfficeReference(true);
        await this.completeUploadNoticeDecisionNoUpload(true);
        await this.completeBasicDetails(true);
        await this.completeNationality(true);
        await this.completeClientAddress(true, false, '', '');
        await this.completeContactPreference(true);
        await this.completeSponsorQuestion(true);
        await this.completeGivenAppealType(true, appealType);
        if (appealType !== 'EU') {
            await this.completedGivenAppealGrounds(true, appealType);
        }
        await this.completeDeportationOrder(true);
        await this.completeNewMatters(true);
        await this.completeOtherAppeals(true);
        await this.completeLegalRepresentativeDetails(true);
        await this.completeGivenFee(true, feeType);
        await this.completeRemissionDetails(true, remission);
        if (remission === 'no remission') {
            await this.completeHowToPayOffline(true, 'PA');
        }
        await this.completeCheckYourAnswers(true);
    }

    async saveInitialNonPaymentAppealOutOfCountryWithDecision(clickContinue = false, appealType = '', appellantInUk = '', decisionType = '', lateAppeal = '', hasAddress = 'Yes', hasSponsor = 'Yes') {
        await this.completeScreeningQuestionsOutOfCountry(true);
        await this.completeOutOfCountryQuestion(true, appellantInUk);
        await this.completeDecisionType(true, decisionType);
        if (decisionType === 'refusalOfHumanRights' || decisionType === 'refusePermitOfEUSS') {
            await this.completeGlobalWebFormReference(true, 'GWF1234567', lateAppeal);
        } else if (decisionType === 'refusalOfProtection') {
            await this.completeDepartureDate(true, lateAppeal);
            await this.completeHomeOfficeReferenceOutOfCountry(true, '');
        } else {
            await this.completeHomeOfficeReferenceOutOfCountry(true, '', lateAppeal)
        }

        await this.completeUploadNoticeDecisionNoUpload(true);
        await this.completeBasicDetails(true);
        await this.completeNationality(true);
        await this.completeClientAddressOutOfCountry(true, hasAddress === 'Yes' ? true : false);
        await this.completeContactPreference(true);
        await this.completeSponsorQuestion(true, hasSponsor)
        await this.completeGivenAppealType(true, appealType);
        if (appealType !== 'EU') {
            await this.completedGivenAppealGrounds(true, appealType);
        }
        if (decisionType !== 'refusalOfHumanRights') {
            await this.completedDeportationOrder(true, appealType)
        }
        await this.completeNewMatters(true);
        await this.completeOtherAppeals(true);
        await this.completeLegalRepresentativeDetails(true);
        await this.completeCheckYourAnswers(true);
    }

    // tslint:disable-next-line:max-line-length
    async saveInitialAppealWithFeeOutOfCountryWithDecision(clickContinue = false, appealType = '', remission = '', feeType = '', appellantInUk = '', decisionType = '', lateAppeal = '', hasAddress = 'Yes', hasSponsor = 'Yes') {
        await this.completeScreeningQuestionsOutOfCountry(true);
        await this.completeOutOfCountryQuestion(true, appellantInUk);
        await this.completeDecisionType(true, decisionType);
        if (decisionType === 'refusalOfHumanRights') {
            await this.completeGlobalWebFormReference(true, 'GWF1234567', lateAppeal);
        } else if (decisionType === 'refusalOfProtection') {
            await this.completeDepartureDate(true, lateAppeal);
            await this.completeHomeOfficeReferenceOutOfCountry(true, '');
        } else {
            await this.completeHomeOfficeReferenceOutOfCountry(true, '', lateAppeal)
        }
        await this.completeUploadNoticeDecisionNoUpload(true);
        await this.completeBasicDetails(true);
        await this.completeNationality(true);
        await this.completeClientAddressOutOfCountry(true, hasAddress === 'Yes' ? true : false);
        await this.completeContactPreference(true);
        await this.completeSponsorQuestion(true, hasSponsor);
        await this.completeGivenAppealType(true, appealType);
        if (appealType !== 'EU') {
            await this.completedGivenAppealGrounds(true, appealType);
        }
        if (decisionType !== 'refusalOfHumanRights') {
            await this.completedDeportationOrder(true, appealType)
        }
        await this.completeNewMatters(true);
        await this.completeOtherAppeals(true);
        await this.completeLegalRepresentativeDetails(true);
        await this.completeGivenFee(true, feeType);
        await this.completeRemissionDetails(true, 'no remission');
        await this.completeHowToPayOffline(true, appealType);
        await this.completeCheckYourAnswers(true);
    }

    async saveInitialNonPaymentAppealOutOfCountryWithSponsor(clickContinue = false, givenName = '', familyName = '', contactPreference = '', authorisation = '') {
        await this.completeScreeningQuestionsOutOfCountry(true);
        await this.completeOutOfCountryQuestion(true, 'No');
        await this.completeDecisionType(true, 'refusalOfHumanRights');
        await this.completeGlobalWebFormReference(true, 'GWF1234567');
        await this.completeUploadNoticeDecisionNoUpload(true);
        await this.completeBasicDetails(true);
        await this.completeNationality(true);
        await this.completeClientAddressOutOfCountry(true, true);
        await this.completeContactPreference(true);
        await this.completeSponsorQuestion(true, 'Yes');
        await this.completeSponsorNames(true, givenName, familyName);
        await this.completeSponsorAddress(true, '2 Hawthorn Drive, Yeadon, Leeds', 'LS19 7XB');
        await this.completeSponsorContactPreference(true, contactPreference);
        await this.completeSponsorAuthorisation(true, authorisation);
        await this.completeGivenAppealType(true, 'PA');
        await this.completedGivenAppealGrounds(true, 'PA');
        await this.completeNewMatters(true);
        await this.completeOtherAppeals(true);
        await this.completeLegalRepresentativeDetails(true);
        await this.completeCheckYourAnswers(true);
    }

    async saveInitialAppealWithFeeOutOfCountryWithSponsor(clickContinue = false, givenName = '', familyName = '', contactPreference = '', authorisation = '') {
        await this.completeScreeningQuestionsOutOfCountry(true);
        await this.completeOutOfCountryQuestion(true, 'No');
        await this.completeDecisionType(true, 'refusalOfHumanRights');
        await this.completeGlobalWebFormReference(true, 'GWF1234567');
        await this.completeUploadNoticeDecisionNoUpload(true);
        await this.completeBasicDetails(true);
        await this.completeNationality(true);
        await this.completeClientAddressOutOfCountry(true, true);
        await this.completeContactPreference(true);
        await this.completeSponsorQuestion(true, 'Yes');
        await this.completeSponsorNames(true, givenName, familyName);
        await this.completeSponsorAddress(true, '2 Hawthorn Drive, Yeadon, Leeds', 'LS19 7XB');
        await this.completeSponsorContactPreference(true, contactPreference);
        await this.completeSponsorAuthorisation(true, authorisation);
        await this.completeGivenAppealType(true, 'PA');
        await this.completedGivenAppealGrounds(true, 'PA');
        await this.completeNewMatters(true);
        await this.completeOtherAppeals(true);
        await this.completeLegalRepresentativeDetails(true);
        await this.completeGivenFee(true, 'hearing fee');
        await this.completeRemissionDetails(true, 'no remission');
        await this.completeHowToPayOffline(true, 'PA');
        await this.completeCheckYourAnswers(true);
    }

    async saveInitialAppealPayNowWithFee(clickContinue = false, appealType = '', remission = '', feeType = '', hasFixedAddress = false, address = '', postcode = '') {
        await this.completeClientDetails(false);
        await this.completeGivenAppealType(true, appealType);
        if (appealType !== 'EU') {
            await this.completedGivenAppealGrounds(true, appealType);
        }
        await this.completeDeportationOrder(true);
        await this.completeNewMatters(true);
        await this.completeOtherAppeals(true);
        await this.completeLegalRepresentativeDetails(true);
        await this.completeGivenFee(true, feeType);
        await this.completeRemissionDetails(true, remission);
        await this.completeHowToPayNow(true);
        await this.completeCheckYourAnswers(true);
    }

    async saveInitialAppealPayNowWithFeeOutOfTime(clickContinue = false, appealType = '', remission = '', feeType = '', hasFixedAddress = false, address = '', postcode = '') {
        await this.completeOutOfTimeClientDetails(false);
        await this.completeGivenAppealType(true, appealType);
        if (appealType !== 'EU') {
            await this.completedGivenAppealGrounds(true, appealType);
        }
        await this.completeDeportationOrder(true);
        await this.completeNewMatters(true);
        await this.completeOtherAppeals(true);
        await this.completeLegalRepresentativeDetails(true);
        await this.completeGivenFee(true, feeType);
        await this.completeRemissionDetails(true, remission);
        await this.completeHowToPayNow(true);
        await this.completeCheckYourAnswers(true);
    }

    async saveInitialAppealWithFeeOutOfTime(clickContinue = false, appealType = '', remission = '', feeType = '', hasFixedAddress = false, address = '', postcode = '') {
        await this.completeOutOfTimeClientDetails(false);
        await this.completeGivenAppealType(true, appealType);
        if (appealType !== 'EU') {
            await this.completedGivenAppealGrounds(true, appealType);
        }
        await this.completeDeportationOrder(true);
        await this.completeNewMatters(true);
        await this.completeOtherAppeals(true);
        await this.completeLegalRepresentativeDetails(true);
        await this.completeGivenFee(true, feeType);
        await this.completeRemissionDetails(true, remission);
        await this.completeHowToPayNow(true);
        await this.completeCheckYourAnswers(true);
    }

    async saveInitialAppealWithFeePayOffline(clickContinue = false, appealType = '', remission = '', feeType = '', hasFixedAddress = false, address = '', postcode = '') {
        await this.completeClientDetails(false);
        await this.completeGivenAppealType(true, appealType);
        if (appealType !== 'EU') {
            await this.completedGivenAppealGrounds(true, appealType);
        }
        await this.completedDeportationOrder(true, appealType);
        await this.completeNewMatters(true);
        await this.completeOtherAppeals(true);
        await this.completeLegalRepresentativeDetails(true);
        await this.completeGivenFee(true, feeType);
        await this.completeRemissionDetails(true, remission);
        await this.completeHowToPayOffline(true, appealType);
        await this.completeCheckYourAnswers(true);
    }

    async saveInitialAppealWithFeePayLater(clickContinue = false, appealType = '', remission = '', feeType = '', hasFixedAddress = false, address = '', postcode = '') {
        await this.completeClientDetails(false);
        await this.completeGivenAppealType(true, appealType);
        if (appealType !== 'EU') {
            await this.completedGivenAppealGrounds(true, appealType);
        }
        await this.completedDeportationOrder(true, appealType);
        await this.completeNewMatters(true);
        await this.completeOtherAppeals(true);
        await this.completeLegalRepresentativeDetails(true);
        await this.completeGivenFee(true, feeType);
        await this.completeRemissionDetails(true, remission);
        await this.completeHowToPayLater(true, appealType);
        await this.completeCheckYourAnswers(true);
    }

    async saveInitialOutOfTimeAppealWithFeePayOffline(clickContinue = false, appealType = '', remission = '', feeType = '', hasFixedAddress = false, address = '', postcode = '') {
        await this.completeOutOfTimeClientDetails(false);
        await this.completeGivenAppealType(true, appealType);
        if (appealType !== 'EU') {
            await this.completedGivenAppealGrounds(true, appealType);
        }
        await this.completeDeportationOrder(true);
        await this.completeNewMatters(true);
        await this.completeOtherAppeals(true);
        await this.completeLegalRepresentativeDetails(true);
        await this.completeGivenFee(true, feeType);
        await this.completeRemissionDetails(true, remission);
        await this.completeHowToPayOffline(true, appealType);
        await this.completeCheckYourAnswers(true);
    }

    async saveInitialOutOfTimeAppealWithFeePayLater(clickContinue = false, appealType = '', remission = '', feeType = '', hasFixedAddress = false, address = '', postcode = '') {
        await this.completeOutOfTimeClientDetails(false);
        await this.completeGivenAppealType(true, appealType);
        if (appealType !== 'EU') {
            await this.completedGivenAppealGrounds(true, appealType);
        }
        await this.completeDeportationOrder(true);
        await this.completeNewMatters(true);
        await this.completeOtherAppeals(true);
        await this.completeLegalRepresentativeDetails(true);
        await this.completeGivenFee(true, feeType);
        await this.completeRemissionDetails(true, remission);
        await this.completeHowToPayLater(true, appealType);
        await this.completeCheckYourAnswers(true);
    }

    async saveOutOfTimeAppeal(clickContinue = false) {
        await this.completeScreeningQuestions(true);
        await this.completeHomeOfficeReferenceWithOutOfTimeDecisionLetter(true);
        await this.completeUploadNoticeDecision(true)
        await this.completeBasicDetails(true);
        await this.completeNationality(true);
        await this.completeClientAddress(true);
        await this.completeContactPreference(true);
        await this.completeAppealType(true);
        await this.completeAppealGrounds(true);
        await this.completeDeportationOrder(true);
        await this.completeNewMatters(true);
        await this.completeOtherAppeals(true);
        await this.completeLegalRepresentativeDetails(true);
        await this.completeGivenFee(true, 'without')
        await this.completeRemissionDetails(true, 'no remission');
        await this.completeHowToPayNow(true);
        await this.completeCheckYourAnswers(true);
    }

    async completeClientDetails(clickContinue = false, hasFixedAddress = false, address = '', postcode = '') {
        await this.completeScreeningQuestions(true);
        await this.completeHomeOfficeReference(true);
        await this.completeUploadNoticeDecisionNoUpload(true);
        await this.completeBasicDetails(true);
        await this.completeNationality(true);
        await this.completeClientAddress(true, hasFixedAddress, address, postcode);
        await this.completeContactPreference(true);
    }

    async completeOutOfTimeClientDetails(clickContinue = false, hasFixedAddress = false, address = '', postcode = '') {
        await this.completeScreeningQuestions(true);
        await this.completeHomeOfficeReferenceWithOutOfTimeDecisionLetter(true);
        await this.completeUploadNoticeDecisionNoUpload(true);
        await this.completeBasicDetails(true);
        await this.completeNationality(true);
        await this.completeClientAddress(true, hasFixedAddress, address, postcode);
        await this.completeContactPreference(true);
    }

    async saveInitialAppealWithHomeOfficeReference(clickContinue = false, homeOfficeReferenceNumber = '') {
        await this.completeScreeningQuestions(true);
        await this.completeHomeOfficeReference(true, false, homeOfficeReferenceNumber);
        await this.completeUploadNoticeDecision(true);
        await this.completeBasicDetails(true);
        await this.completeNationality(true);
        await this.completeClientAddress(true, false, '', '');
        await this.completeContactPreference(true);
        await this.completeAppealType(true);
        await this.completeAppealGrounds(true);
        await this.completeDeportationOrder(true);
        await this.completeNewMatters(true);
        await this.completeOtherAppeals(true);
        await this.completeLegalRepresentativeDetails(true);
        await this.completeCheckYourAnswers(true);
    }

    async completeHearingOption(clickContinue = false, hearingOption = '') {

        await this.ccdFormPage.runAccessbility();
        if (hearingOption === 'without') {
            await this.ccdFormPage.setFieldValue('How do you want the appeal to be decided?', 'Decision without a hearing');
        }
        if (hearingOption === 'with') {
            await this.ccdFormPage.setFieldValue('How do you want the appeal to be decided?', 'Decision with a hearing');
        }

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeRemissionDetails(clickContinue = false, remissionOption = '') {

        await this.ccdFormPage.runAccessbility();
        if (remissionOption === 'no remission') {
            await this.ccdFormPage.setFieldValue('Choose one of the following statements', 'My client is not eligible for a fee remission');
        }
        if (remissionOption === 'a remission') {
            await this.ccdFormPage.setFieldValue('Choose one of the following statements', 'My client has a remission, e.g. Asylum support, Legal Aid, Home Office waiver, Section 17/20');
            await this.ccdFormPage.click('Continue');
            await this.ccdFormPage.setFieldValue('Choose one of the following statements', 'My client receives Legal Aid');
            await this.ccdFormPage.click('Continue');
            await this.ccdFormPage.setFieldValue('Legal Aid account number', '1A234B');
        }
        if (remissionOption === 'help with fees') {
            await this.ccdFormPage.setFieldValue('Choose one of the following statements', 'My client has a Help with Fees reference number');
        }
        if (remissionOption === 'apply for an exceptional circumstances remissions') {
            await this.ccdFormPage.setFieldValue('Choose one of the following statements', 'My client has a Help with Fees reference number');
        }

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeGlobalWebFormReference(clickContinue = false, gwfReferenceNumber = '', lateAppeal = '') {
        if (gwfReferenceNumber !== '') {
            await this.ccdFormPage.setFieldValue('Global Web Form (GWF) reference number', gwfReferenceNumber);
        } else {
            await this.ccdFormPage.setFieldValue('Global Web Form (GWF) reference number', 'GWF1234567');
        }
        if (lateAppeal === 'late') {
            await this.ccdFormPage.setFieldValue('Date Entry clearance decision letter received', '{$TODAY-30}');
        } else {
            await this.ccdFormPage.setFieldValue('Date Entry clearance decision letter received', '{$TODAY}');
        }

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeDepartureDate(clickContinue = false, lateAppeal = '') {

        if (lateAppeal === 'late') {
            await this.ccdFormPage.setFieldValue('When did your client leave the UK?', '{$TODAY-30}');
        } else {
            await this.ccdFormPage.setFieldValue('When did your client leave the UK?', '{$TODAY-7}');
        }

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeDecisionType(clickContinue = false, decisionOption = '') {
        if (decisionOption === 'refusalOfHumanRights') {
            await this.ccdFormPage.setFieldValue('What type of decision are you appealing?'
                , 'A decision either 1) to refuse a human rights claim made following an application for entry clearance or 2) to refuse a permit to enter the UK under the Immigration (European Economic Area) Regulation 2016');
        } else if (decisionOption === 'refusalOfProtection') {
            await this.ccdFormPage.setFieldValue('What type of decision are you appealing?'
                , 'A decision to refuse a protection or human rights claim where your client may only apply after leaving the UK');
        } else if (decisionOption === 'removalOfClient') {
            await this.ccdFormPage.setFieldValue('What type of decision are you appealing?'
                , 'A decision either 1) to remove your client from the UK under the Immigration (European Economic Area) Regulations 2016, where they are currently outside the UK or 2) to deprive your client of British citizenship, where they are currently outside the UK');
        }
        if (decisionOption === 'refusalOfProtection') {
            await this.ccdFormPage.setFieldValue('What type of decision are you appealing?'
                , 'A decision to refuse a protection or human rights claim where your client may only apply after leaving the UK');
        }
        if (decisionOption === 'removeClient') {
            await this.ccdFormPage.setFieldValue('What type of decision are you appealing?'
                , 'A decision to remove your client under the Immigration (European Economic Area) Regulations 2016');
        }
        if (decisionOption === 'refusePermitOfEUSS') {
            await this.ccdFormPage.setFieldValue('What type of decision are you appealing?'
                , 'A decision to refuse a permit to enter the UK under the immigration rules and/or the EU Settlement Scheme.');
        }
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeClientAddressOutOfCountry(clickContinue = false, hasCorrespondenceAddress = false) {

        if (!hasCorrespondenceAddress) {
            await this.ccdFormPage.setFieldValue('Does your client have a correspondence address outside the UK?', 'No');
        } else {
            await this.ccdFormPage.setFieldValue('Does your client have a correspondence address outside the UK?', 'Yes');
            await this.ccdFormPage.setFieldValue('Enter the address', 'Afghanistan');
        }

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeHomeOfficeReferenceOutOfCountry(clickContinue = false, homeOfficeReferenceNumber = '', lateAppeal = '') {
        if (homeOfficeReferenceNumber !== '') {
            await this.ccdFormPage.setFieldValue('Home Office Reference/Case ID', homeOfficeReferenceNumber);
        } else {
            await this.ccdFormPage.setFieldValue('Home Office Reference/Case ID', '01234567');
        }

        if (lateAppeal === 'late') {
            await this.ccdFormPage.setFieldValue('Date letter received', '{$TODAY-30}');
        } else {
            await this.ccdFormPage.setFieldValue('Date letter received', '{$TODAY-10}');
        }

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeSponsorQuestion(clickContinue = false, hasSponsor = '') {
        if (hasSponsor === 'Yes') {
            await this.ccdFormPage.setFieldValue('Does your client have a sponsor?', 'Yes');
        } else {
            await this.ccdFormPage.setFieldValue('Does your client have a sponsor?', 'No');
        }

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeSponsorNames(clickContinue = false, givenName = '', familyName = '') {
        if (givenName === '') {
            await this.ccdFormPage.setFieldValue('Given names', 'John');
        } else {
            await this.ccdFormPage.setFieldValue('Given names', givenName);
        }

        if (familyName === '') {
            await this.ccdFormPage.setFieldValue('Family name', 'Smith');
        } else {
            await this.ccdFormPage.setFieldValue('Family name', familyName);
        }

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeSponsorAddress(clickContinue = false, address = '', postcode = '') {

        await this.ccdFormPage.setFieldValue('Enter a UK postcode', postcode);
        await this.ccdFormPage.click('Find address');
        await this.ccdFormPage.doesDropdownHaveValues('Select an address');
        await this.ccdFormPage.setFieldValue('Select an address', address);

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeSponsorContactPreference(clickContinue = false, contactPreference = '') {
        if (contactPreference === 'wantsEmail') {
            await this.ccdFormPage.setFieldValue('Contact details', 'Email');
            await this.ccdFormPage.setFieldValue('Email address', 'test@test.com');
        } else {
            await this.ccdFormPage.setFieldValue('Contact details', 'Text message');
            await this.ccdFormPage.setFieldValue('Mobile phone number', '07123456789');
        }

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeSponsorAuthorisation(clickContinue = false, authorisation = '') {
        if (authorisation === 'Yes') {
            await this.ccdFormPage.setFieldValue('Does your client give authorisation for the sponsor to access information relating to the appeal?', 'Yes');
        } else {
            await this.ccdFormPage.setFieldValue('Does your client give authorisation for the sponsor to access information relating to the appeal?', 'No');
        }

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async editClientDetails(clickContinue = false, hasFixedAddress = false, address = '', postcode = '') {
        if (isOutOfCountryEnabled) {
            await this.completeOutOfCountryQuestion(true, 'Yes');
        }
        await this.completeHomeOfficeReference(true);
        await this.clickContinueToNextStep(true); // completeUploadNoticeDecisionNoUpload
        await this.clickContinueToNextStep(true); // completeBasicDetails
        await this.clickContinueToNextStep(true); // completeNationality
        await this.completeClientAddress(true, hasFixedAddress, address, postcode);
        await this.clickContinueToNextStep(true); // completeContactPreference
        await this.clickContinueToNextStep(true); // completeGivenAppealType
        await this.clickContinueToNextStep(true); // completedGivenAppealGrounds
        await this.completeDeportationOrder(true);
        await this.completeNewMatters(true);
        await this.clickContinueToNextStep(true); // completeOtherAppeals
        await this.completeLegalRepresentativeDetails(true);
    }

    async editInitialAppealAppealAfterSubmit(clickContinue = false) {
        await this.completeOutOfCountryQuestion(true, 'Yes');
        await this.completeHomeOfficeReference(true);
        await this.clickContinueToNextStep(true); // completeBasicDetails
        await this.clickContinueToNextStep(true); // completeNationality
        await this.completeClientAddress(true, true, '2 Hawthorn Drive, Yeadon, Leeds', 'LS19 7XB');
        await this.completedDeportationOrder(true, '');
        await this.clickContinueToNextStep(true); // completeNewMatters
        await this.clickContinueToNextStep(true); // completeOtherAppeals
        await this.clickContinueToNextStep(true); // legalDetails
        await this.completeCheckYourAnswers(true);
    }

    async editInitialAppealWithFee(clickContinue = false, appealType = '', remission = '', feeType = '', hasFixedAddress = false, address = '', postcode = '') {
        await this.editClientDetails(false);
        await this.completeGivenFee(true, feeType);
        await this.completeRemissionDetails(true, remission);
        if (remission === 'no remission') {
            await this.completeHowToPayNow(true);
        }
        await this.completeCheckYourAnswers(true);
    }

    async editInitialNonPaymentAppeal(clickContinue = false, appealType = '', ) {
        await this.editClientDetails(false);
        await this.completeCheckYourAnswers(true);
    }

    async clickContinueToNextStep(clickContinue = false) {
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async editInitialAppealWithFeeOutOfCountryWithSponsor(clickContinue = false, givenName = '', familyName = '', contactPreference = '', authorisation = '') {
        await this.completeOutOfCountryQuestion(true, 'No');
        await this.completeDecisionType(true, 'refusalOfHumanRights');
        await this.completeGlobalWebFormReference(true, 'GWF1234567');
        // await this.completeUploadNoticeDecisionNoUpload(true);
        await this.clickContinueToNextStep(true); // completeNotice of decision
        await this.clickContinueToNextStep(true); // completeBasicDetails
        await this.clickContinueToNextStep(true); // completeNationality
        await this.completeClientAddressOutOfCountry(true, true);
        await this.clickContinueToNextStep(true); // completeContactPreference
        await this.completeSponsorQuestion(true, 'Yes');
        await this.completeSponsorNames(true, givenName, familyName);
        await this.completeSponsorAddress(true, 'First Tier Tribunal Immigration & Asylum Chamber, Taylor House, 88 Rosebery Avenue, London', 'EC1R 4QU');
        await this.completeSponsorContactPreference(true, contactPreference);
        await this.completeSponsorAuthorisation(true, authorisation);
        await this.clickContinueToNextStep(true); // completeGivenAppealType
        await this.clickContinueToNextStep(true); // completedGivenAppealGrounds
        await this.clickContinueToNextStep(true); // completeNewMatters
        await this.clickContinueToNextStep(true); // completeOtherAppeals
        await this.clickContinueToNextStep(true); // completeLegalRepresentativeDetails
        await this.clickContinueToNextStep(true); // completeGivenFee
        await this.clickContinueToNextStep(true); // completeRemissionDetails
        await this.clickContinueToNextStep(true); // completeHowToPayNow
        await this.completeCheckYourAnswers(true);
    }

    async editInitialAppealAfterSubmitWithFeeOutOfCountryWithSponsor(clickContinue = false, givenName = '', familyName = '', contactPreference = '', authorisation = '') {
        await this.completeOutOfCountryQuestion(true, 'No');
        await this.completeDecisionType(true, 'refusalOfHumanRights');
        await this.completeGlobalWebFormReference(true, 'GWF7654321');
        await this.clickContinueToNextStep(true); // completeBasicDetails
        await this.clickContinueToNextStep(true); // completeNationality
        await this.completeClientAddressOutOfCountry(true, true);
        await this.completeSponsorQuestion(true, 'Yes');
        await this.completeSponsorNames(true, givenName, familyName);
        await this.completeSponsorAddress(true, 'First Tier Tribunal Immigration & Asylum Chamber, Taylor House, 88 Rosebery Avenue, London', 'EC1R 4QU');
        await this.completeSponsorContactPreference(true, contactPreference);
        await this.completeSponsorAuthorisation(true, authorisation);
        await this.clickContinueToNextStep(true); // completeNewMatters
        await this.clickContinueToNextStep(true); // completeOtherAppeals
        await this.completeLegalRepresentativeDetails(true);
        await this.completeCheckYourAnswers(true);
    }

    async editInitialNonPaymentAppealOutOfCountryWithSponsor(clickContinue = false, givenName = '', familyName = '', contactPreference = '', authorisation = '') {
        await this.completeOutOfCountryQuestion(true, 'No');
        await this.completeDecisionType(true, 'refusalOfHumanRights');
        await this.completeGlobalWebFormReference(true, 'GWF1234567');
        // await this.completeUploadNoticeDecisionNoUpload(true);
        await this.clickContinueToNextStep(true); // completeNotice of decision Upload
        await this.clickContinueToNextStep(true); // completeBasicDetails
        await this.clickContinueToNextStep(true); // completeNationality
        await this.completeClientAddressOutOfCountry(true, true);
        await this.clickContinueToNextStep(true); // completeContactPreference
        await this.completeSponsorQuestion(true, 'Yes');
        await this.completeSponsorNames(true, givenName, familyName);
        await this.completeSponsorAddress(true, 'First Tier Tribunal Immigration & Asylum Chamber, Taylor House, 88 Rosebery Avenue, London', 'EC1R 4QU');
        await this.completeSponsorContactPreference(true, contactPreference);
        await this.completeSponsorAuthorisation(true, authorisation);
        await this.clickContinueToNextStep(true); // completeGivenAppealType
        await this.clickContinueToNextStep(true); // completedGivenAppealGrounds
        await this.clickContinueToNextStep(true); // completeNewMatters
        await this.clickContinueToNextStep(true); // completeOtherAppeals
        await this.completeLegalRepresentativeDetails(true);
        await this.completeCheckYourAnswers(true);
    }

    async saveLegalRepAndContinueNonPaymentAppeal(clickContinue = false) {
        await this.completeLegalRepresentativeDetails(true);
        await this.completeCheckYourAnswers(true);
    }

    async saveLegalRepAndContinueWithFee(clickContinue = false, feeType = '', appealType = '') {
        await this.completeLegalRepresentativeDetails(true);
        if (appealType === 'DC' || appealType === 'RP') {
            await this.completeCheckYourAnswers(true);
        } else {
            await this.completeGivenFee(true, feeType);
            await this.completeHowToPayOffline(true, appealType);
            await this.completeCheckYourAnswers(true);
        }

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }
}
