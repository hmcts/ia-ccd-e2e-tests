import { browser, element } from 'protractor';
import { CcdFormPage } from '../pages/ccd-form.page';

export class MakeNewApplicationFlow {

    private ccdFormPage = new CcdFormPage();

    async completeBeforeYouStart(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.click('Continue');
    }

    async completeWhichPartySentApplication(clickContinue = false, user) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Application sent by', user);
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeApplicantName(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeApplicantDOB(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeApplicantGender(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeApplicantNationality(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeApplicantReferenceNumber(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeDetentionFacility(clickContinue = false, facility) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Detention facility', facility);
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeWhichPrison(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Prison name', 'HM Prison Blundeston');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeWhichIRC(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Immigration removal centre name', 'Brookhouse');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }
    async completeDateOfApplicantArrival(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeApplicantMobilePhone(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Mobile phone', 'No');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeAppealHearingPending(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Pending appeal hearing', 'No');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeApplicantPlaceToLive(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Address if bail granted', 'No');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeFinancialConditionAgree(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Financial condition', 'No');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeFinancialConditionSupporter(clickContinue = false, choice) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Financial condition supporter', choice);
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
      }
    }

    async completeFinancialConditionSupporterName(clickContinue = false, number = '') {
        await this.ccdFormPage.runAccessbility();
        if (number === '1') {
            await this.ccdFormPage.setFieldValue('Given names', 'John');
            await this.ccdFormPage.setFieldValue('Family name', 'Smith');
        }
        if (number === '2') {
            await this.ccdFormPage.setFieldValue('Given names', 'Jane');
            await this.ccdFormPage.setFieldValue('Family name', 'Doe');
        }
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeFinancialConditionSupporterAddress(clickContinue = false, number = '') {
        await this.ccdFormPage.runAccessbility();
        if (number === '1') {
            await this.ccdFormPage.setFieldValue('Enter a UK postcode', 'CH5 3QW');
            await this.ccdFormPage.click('Find address');
            await this.ccdFormPage.doesDropdownHaveValues('Select an address');
            await this.ccdFormPage.setFieldValue('Select an address', 'J & P Engineering Services Ltd, Wellington House, Manor Lane, Penarlag Hawarden Industrial Park Airfield View, Glannau Dyfrdwy');
        }
        if (number === '2') {
            await this.ccdFormPage.setFieldValue('Enter a UK postcode', 'SW1A 1AA');
            await this.ccdFormPage.click('Find address');
            await this.ccdFormPage.doesDropdownHaveValues('Select an address');
            await this.ccdFormPage.setFieldValue('Select an address', 'Buckingham Palace, London');
        }
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeFinancialConditionSupporterContactDetails(clickContinue = false, number = '') {
        await this.ccdFormPage.runAccessbility();
        if (number === '1') {
            await this.ccdFormPage.click('Telephone');
            await this.ccdFormPage.click('Mobile');
            await this.ccdFormPage.click('Email');
            await browser.sleep(1000);
            await this.ccdFormPage.typeText('supporterTelephoneNumber1', '01182904610');
            await this.ccdFormPage.typeText('supporterMobileNumber1', '07930111222');
            await this.ccdFormPage.typeText('supporterEmailAddress1', 'johnSmith@test.com');
        }
        if (number === '2') {
            await this.ccdFormPage.click('Email');
            await browser.sleep(1000);
            await this.ccdFormPage.typeText('supporter2EmailAddress1', 'janeDoe@test.com');
        }
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeFinancialConditionSupporterDOB(clickContinue = false, number = '') {
        await this.ccdFormPage.runAccessbility();
        if (number === '1') {
            await this.ccdFormPage.setFieldValue('Date of birth', '30-12-1999');
        }
        if (number === '2') {
            await this.ccdFormPage.setFieldValue('Date of birth', '29-12-1999');
        }
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeFinancialConditionSupporterRelationship(clickContinue = false, number = '') {
        await this.ccdFormPage.runAccessbility();
        if (number === '1') {
            await this.ccdFormPage.setFieldValue('Relationship to the applicant', 'Uncle');
        }
        if (number === '2') {
            await this.ccdFormPage.setFieldValue('Relationship to the applicant', 'Aunt');
        }
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeFinancialConditionSupporterOccupation(clickContinue = false, number = '') {
        await this.ccdFormPage.runAccessbility();
        if (number === '1') {
            await this.ccdFormPage.setFieldValue('Occupation', 'Lawyer');
        }
        if (number === '2') {
            await this.ccdFormPage.setFieldValue('Occupation', 'Lawyer');
        }
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeFinancialConditionSupporterImmigrationStatus(clickContinue = false, number = '') {
        await this.ccdFormPage.runAccessbility();
        if (number === '1') {
            await this.ccdFormPage.setFieldValue('Immigration status', 'Citizen');
        }
        if (number === '2') {
            await this.ccdFormPage.setFieldValue('Immigration status', 'Immigrant');
        }
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeFinancialConditionSupporterNationality(clickContinue = false, number = '') {
        await this.ccdFormPage.runAccessbility();
        if (number === '1') {
            await this.ccdFormPage.click('Add new');
            await this.ccdFormPage.setFieldValue('Nationality', 'Uzbek', 'select list', 'first', 'Nationality', 'first');
            await browser.sleep(2000);
        }
        if (number === '2') {
            await this.ccdFormPage.click('Add new');
            await this.ccdFormPage.setFieldValue('Nationality', 'Armenian', 'select list', 'first', 'Nationality', 'first');
            await browser.sleep(2000);
        }
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeFinancialConditionSupporterPassport(clickContinue = false, number = '') {
        await this.ccdFormPage.runAccessbility();
        if (number === '1') {
            await this.ccdFormPage.setFieldValue('Passport', 'Yes');
        }
        if (number === '2') {
            await this.ccdFormPage.setFieldValue('Passport', 'Yes');
        }
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeFinancialConditionSupporterPassportNumber(clickContinue = false, number = '') {
        await this.ccdFormPage.runAccessbility();

        if (number === '1') {
            await this.ccdFormPage.setFieldValue('Passport number (Optional)', '123456789');
        }
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeFinancialConditionSupporterUndertaking(clickContinue = false, number = '') {
        await this.ccdFormPage.runAccessbility();
        if (number === '1') {
            await this.ccdFormPage.typeText('financialAmountSupporterUndertakes1', '450');
        }
        if (number === '2') {
            await this.ccdFormPage.typeText('financialAmountSupporter2Undertakes1', '550');
        }
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeAnotherFinancialConditionSupporter(clickContinue = false, number = '', choice = '') {
        await this.ccdFormPage.runAccessbility();
        if (number === '1') {
            await this.ccdFormPage.setFieldValue('Financial condition supporter 2', choice);
        }
        if (number === '2') {
            await this.ccdFormPage.setFieldValue('Financial condition supporter 3', choice);
        }
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeGroundsForBailInfo(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeGroundsForBail(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Enter the bail grounds', 'New grounds for bail');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeSupportingEvidenceYesNo(clickContinue = false, choice) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.click(choice);
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeSupportingEvidenceUpload(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await browser.sleep(1000)
        await this.ccdFormPage.click('Add new');
        await this.ccdFormPage.setFieldValue(
            'Document',
            '{@GroundsForBailSupportingEvidence.pdf}',
        );
        await this.ccdFormPage.setFieldValue(
            'Describe the document',
            'This is a different supporting evidence',
        );
        await browser.sleep(8000)
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeBailTransfer(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Transfer bail management', 'Yes');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeInterpreterRequirements(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await element('#interpreterYesNo_No').click();
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeDisabilityRequirements(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Disability', 'No');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeVideoLinkRequirements(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Able to join video hearing', 'Yes');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeLegalRepYesNo(clickContinue = false, choice) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Legal representative', choice);
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeLegalRepDetails(clickContinue = false, choice) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Name', 'New Legal Representative Name');
        await this.ccdFormPage.typeText('legalRepPhone', '07292929292');
        await this.ccdFormPage.setFieldValue('Reference', 'This is a better reference');
        if (choice !== 'LR') {
            await this.ccdFormPage.setFieldValue('Company', 'A different Legal Representative Company');
            await this.ccdFormPage.setFieldValue('Email address', 'newlegalRep@test.com');
        }
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeB1Upload(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await browser.sleep(1000)
        await this.ccdFormPage.click('Add new');
        await this.ccdFormPage.setFieldValue(
            'Document',
            '{@B1Form.pdf}',
        );
        await this.ccdFormPage.setFieldValue(
            'Describe the document',
            'This is a new B1 form',
        );
        await browser.sleep(8000)
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeCheckYourAnswers(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        if (clickContinue) {
            await this.ccdFormPage.click('Submit');
            await browser.sleep(30000)
        }
    }

    async makeNewApplication(clickContinue = false, user: string, detentionFacility: string, noOfSupporters: string, legalRepresentativeOrNot: string) {
        await this.completeBeforeYouStart(true);
        if (user === 'Admin Officer') {
            await this.completeWhichPartySentApplication(true, 'Applicant');
        }
        await this.completeApplicantName(true);
        await this.completeApplicantDOB(true);
        await this.completeApplicantGender(true);
        await this.completeApplicantNationality(true);
        await this.completeApplicantReferenceNumber(true);
        await this.completeDetentionFacility(true, detentionFacility);
        if (detentionFacility === 'Prison') {
            await this.completeWhichPrison(true);
        } else {
            await this.completeWhichIRC(true);
        }
        await this.completeDateOfApplicantArrival(true);
        await this.completeApplicantMobilePhone(true);
        await this.completeAppealHearingPending(true);
        await this.completeApplicantPlaceToLive(true);
        await this.completeFinancialConditionAgree(true);
        if (noOfSupporters === 'no') {
            await this.completeFinancialConditionSupporter(true, 'No');
        } else {
            await this.completeFinancialConditionSupporter(true, 'Yes');
            await this.completeFinancialConditionSupporterName(true, '1');
            await this.completeFinancialConditionSupporterAddress(true, '1');
            await this.completeFinancialConditionSupporterContactDetails(true, '1');
            await this.completeFinancialConditionSupporterDOB(true, '1');
            await this.completeFinancialConditionSupporterRelationship(true, '1');
            await this.completeFinancialConditionSupporterOccupation(true, '1');
            await this.completeFinancialConditionSupporterImmigrationStatus(true, '1');
            await this.completeFinancialConditionSupporterNationality(true, '1');
            await this.completeFinancialConditionSupporterPassport(true, '1');
            await this.completeFinancialConditionSupporterPassportNumber(true, '1');
            await this.completeFinancialConditionSupporterUndertaking(true, '1');
            if (noOfSupporters === 'one') {
                await this.completeAnotherFinancialConditionSupporter(true, '1', 'No');
            } else {
                await this.completeAnotherFinancialConditionSupporter(true, '1', 'Yes');
                await this.completeFinancialConditionSupporterName(true, '2');
                await this.completeFinancialConditionSupporterAddress(true, '2');
                await this.completeFinancialConditionSupporterContactDetails(true, '2');
                await this.completeFinancialConditionSupporterDOB(true, '2');
                await this.completeFinancialConditionSupporterRelationship(true, '2');
                await this.completeFinancialConditionSupporterOccupation(true, '2');
                await this.completeFinancialConditionSupporterImmigrationStatus(true, '2');
                await this.completeFinancialConditionSupporterNationality(true, '2');
                await this.completeFinancialConditionSupporterPassport(true, '2');
                await this.completeFinancialConditionSupporterPassportNumber(true, '2');
                await this.completeFinancialConditionSupporterUndertaking(true, '2');
                if (noOfSupporters === 'two') {
                    await this.completeAnotherFinancialConditionSupporter(true, '2', 'No');
                }
            }
        }
        await this.completeGroundsForBailInfo(true);
        await this.completeGroundsForBail(true);
        await this.completeSupportingEvidenceYesNo(true, 'Yes');
        await this.completeSupportingEvidenceUpload(true);
        await this.completeBailTransfer(true);
        await this.completeInterpreterRequirements(true);
        await this.completeDisabilityRequirements(true);
        await this.completeVideoLinkRequirements(true);
        if (legalRepresentativeOrNot === 'a') {
            if (user === 'Legal Rep') {
                await this.completeLegalRepDetails(true, 'LR');
                await this.ccdFormPage.click('The applicant has confirmed that the facts stated in this application are true.');
                await this.ccdFormPage.click('Continue');
            } else {
                await this.completeLegalRepYesNo(true, 'Yes');
                await this.completeLegalRepDetails(true, 'NonLR');
            }
        } else {
            await this.completeLegalRepYesNo(true, 'No');
        }
        if (user === 'Admin Officer') {
            await this.completeB1Upload(true);
        }
        await this.completeCheckYourAnswers(true);

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }
}
