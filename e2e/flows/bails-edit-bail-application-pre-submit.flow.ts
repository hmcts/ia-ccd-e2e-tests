import { browser } from 'protractor';
import { CcdFormPage } from '../pages/ccd-form.page';

export class EditBailApplicationPreSubmitFlow {

    private ccdFormPage = new CcdFormPage();

    async completePreviousBailApplication(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Has the applicant made a previous application before?', 'No');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
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
        await this.ccdFormPage.setFieldValue('Given names', 'Harry');
        await this.ccdFormPage.setFieldValue('Family name', 'Pughes');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeApplicantDOB(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
            await this.ccdFormPage.setFieldValue('Date of birth', '25-12-1999');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeApplicantGender(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Gender', 'Male')
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeApplicantNationality(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await browser.sleep(2000);
        await this.ccdFormPage.setFieldValue('Nationality', 'The applicant is stateless');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeApplicantReferenceNumber(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Home Office reference', '76543210');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeDetentionFacility(clickContinue = false, facility) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Detention facility', facility);
        if (facility === 'Prison') {
            await this.ccdFormPage.setFieldValue('What is the applicant’s NOMS number?', '123456789');
        }
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeWhichPrison(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Prison name', 'HM Prison Ashwell');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeWhichIRC(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Immigration removal centre name', 'Yarlswood');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeDateOfApplicantArrival(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Date of arrival in the UK (Optional)', '10-02-2010');
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

    async completeGroundsForBail(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Enter the bail grounds', 'Edited grounds for bail');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeSupportingEvidenceYesNo(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.click('No');
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
        await this.ccdFormPage.setFieldValue('Interpreter', 'No');
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
        await this.ccdFormPage.setFieldValue('Name', 'Edited Legal Representative Name');
        await this.ccdFormPage.setFieldValue('Reference', 'Edited this reference');
        await this.ccdFormPage.setFieldValue('Company', 'Edited Legal Representative Company');
        await this.ccdFormPage.setFieldValue('Email address', 'editedlegalRep@test.com');
        if (choice !== 'LR') {
            await this.ccdFormPage.typeText('legalRepPhone', '07292929292');
        }
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeB1Upload(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await browser.sleep(1000)
        await this.ccdFormPage.setFieldValue(
            'Document',
            '{@B1Form.pdf}',
        );
        await this.ccdFormPage.setFieldValue(
            'Describe the document',
            'Edited this B1 form',
        );
        await browser.sleep(8000)
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeCheckYourAnswers(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        if (clickContinue) {
            await this.ccdFormPage.click('Save application');
            await browser.sleep(10000)
        }
    }

    async editSavedApplication(clickContinue = false, user: string, detentionFacility: string, noOfSupporters: string, legalRepresentativeOrNot: string) {
        await this.ccdFormPage.selectNextStep('Edit the application');
        await this.ccdFormPage.click('Go');
        await this.completePreviousBailApplication(true);
        await this.ccdFormPage.click('Continue');
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
        await this.completeGroundsForBail(true);
        await this.completeSupportingEvidenceYesNo(true);
        await this.completeBailTransfer(true);
        await this.completeInterpreterRequirements(true);
        await this.completeDisabilityRequirements(true);
        await this.completeVideoLinkRequirements(true);
        if (legalRepresentativeOrNot === 'a') {
            if (user === 'Legal Rep') {
                await this.completeLegalRepDetails(true, 'LR');
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
