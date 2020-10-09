import { Then } from 'cucumber';
import { expect } from 'chai';
import { Wait } from '../../../enums/wait';
import { CcdPage } from '../../../pages/ccd.page';
import { RecordAgreedRequirementsFlow } from '../../../flows/record-agreed-requirements.flow';

const ccdPage = new CcdPage();

const recordAgreedRequirementsFlow  = new RecordAgreedRequirementsFlow();

Then(/^I record agreed hearing requirements yes path$/, async function () {
    await recordAgreedRequirementsFlow.recordAgreedRequirementsYesPath(true);
});

Then(/^I record updated hearing requirements yes path$/, async function () {
    await recordAgreedRequirementsFlow.recordUpdatedHearingRequirementsYesPath(true);
});

Then(/^I record agreed hearing requirements no path$/, async function () {
    await recordAgreedRequirementsFlow.recordAgreedRequirementsNoPath(true);
});

Then(/^I record updated hearing requirements no path$/, async function () {
    await recordAgreedRequirementsFlow.recordAgreedRequirementsNoPath(true);
});

Then(/^I should (see|not see) the requests for additional adjustments (yes|no) path$/, async function (seeOrNotSee, yesOrNo) {

    const isDisplayed = (seeOrNotSee === 'see');
    const isYesPath = (yesOrNo === 'yes');

    expect(await ccdPage.headingContains('Hearing')).to.equal(true);
    if (isDisplayed) {
        if (isYesPath) {
            expect(await ccdPage.headingContains('Requests for additional adjustments')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Does the appellant have any physical or mental health issues that may impact them on the day?', 'Yes')).to.equal(true);
            expect(await ccdPage.contentContains('Explain in detail how any physical or mental health issues may affect them on the day.', Wait.instant)).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Has the appellant had any past experiences that may impact them on the day?', 'Yes')).to.equal(true);
            expect(await ccdPage.contentContains('Explain in detail how any past experiences may affect them on the day?', Wait.instant)).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Do you have multimedia evidence?', 'Yes')).to.equal(true);
            expect(await ccdPage.contentContains(
                'You should provide the equipment to play this evidence. If this is not possible, explain why and what equipment you\'ll need to play it.',
                Wait.instant)).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Does the appellant need a single-sex court?', 'Yes')).to.equal(true);
            expect(await ccdPage.contentContains('What type of court do they need?', Wait.instant)).to.equal(true);
            expect(await ccdPage.contentContains('Explain in detail why the appellant needs a single-sex court.', Wait.instant)).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Does the appellant need an in camera court?', 'Yes')).to.equal(true);
            expect(await ccdPage.contentContains('Explain in detail why the appellant needs an in camera court.', Wait.instant)).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Is there anything else you would like to request?', 'Yes')).to.equal(true);
            expect(await ccdPage.contentContains('Provide details of any additional requests and why they are necessary.', Wait.instant)).to.equal(true);
        } else {
            expect(await ccdPage.headingContains('Requests for additional adjustments')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Does the appellant have any physical or mental health issues that may impact them on the day?', 'No')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Has the appellant had any past experiences that may impact them on the day?', 'No')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Do you have multimedia evidence?', 'No')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Does the appellant need a single-sex court?', 'No')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Does the appellant need an in camera court?', 'No')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Is there anything else you would like to request?', 'No')).to.equal(true);

        }

    } else {
        expect(await ccdPage.headingContains('Requests for additional adjustments')).to.equal(false);
        expect(await ccdPage.contentContains('Does the appellant have any physical or mental health issues that may impact them on the day?', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Explain in detail how any physical or mental health issues may affect them on the day.', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Has the appellant had any past experiences that may impact them on the day?', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Explain in detail how any past experiences may affect them on the day?', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Do you have multimedia evidence?', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains(
            'You should provide the equipment to play this evidence. If this is not possible, explain why and what equipment you\'ll need to play it.',
            Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Does the appellant need a single-sex court?', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('What type of court do they need?', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Explain in detail why the appellant needs a single-sex court.', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Does the appellant need an in camera court?', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Explain in detail why the appellant needs an in camera court.', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Is there anything else you would like to request?', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Provide details of any additional requests and why they are necessary.', Wait.instant)).to.equal(false);
    }

});

Then(/^I should (see|not see) the agreed additional adjustments (yes|no) path$/, async function (seeOrNotSee, yesOrNo) {

    const isDisplayed = (seeOrNotSee === 'see');
    const isYesPath = (yesOrNo === 'yes');

    expect(await ccdPage.headingContains('Agreed additional adjustments', isDisplayed)).to.equal(isDisplayed);

    if (isDisplayed) {
        if (isYesPath) {
            expect(await ccdPage.isFieldValueDisplayed('Adjustments to accommodate vulnerabilities', 'Physical or mental health conditions will be reviewed')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Multimedia equipment', 'Multimedia equipment requirement will be reviewed')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Single-sex court', 'Single sex court requirement will be reviewed')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('In camera court', 'Private hearing requirement will be reviewed')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Other adjustments', 'Additional adjustments requirement will be reviewed')).to.equal(true);

        } else {
            expect(await ccdPage.contentContains('Adjustments to accommodate vulnerabilities', Wait.instant)).to.equal(false);
            expect(await ccdPage.contentContains('Multimedia equipment', Wait.instant)).to.equal(false);
            expect(await ccdPage.contentContains('Single-sex court', Wait.instant)).to.equal(false);
            expect(await ccdPage.contentContains('In camera court', Wait.instant)).to.equal(false);
            expect(await ccdPage.contentContains('Other adjustments', Wait.instant)).to.equal(false);
        }
    } else {
        expect(await ccdPage.contentContains('Adjustments to accommodate vulnerabilities', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Multimedia equipment', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Single-sex court', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('In camera court', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Other adjustments', Wait.instant)).to.equal(false);
    }
});
