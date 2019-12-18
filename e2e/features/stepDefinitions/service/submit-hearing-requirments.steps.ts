import { SubmitHearingRequirementsFlow } from '../../../flows/submit-hearing-requirements.flow';
import { Then } from 'cucumber';
import { expect } from 'chai';
import { Wait } from '../../../enums/wait';
import { CcdPage } from '../../../pages/ccd.page';

const submitHearingRequirementsFlow = new SubmitHearingRequirementsFlow();
const ccdPage = new CcdPage();

Then(/^I submit hearing requirements$/, async function () {
    await submitHearingRequirementsFlow.submitHearingRequirements(true);
});

Then(/^I should (see|not see) the hearing requirements (yes|no) path$/, async function (seeOrNotSee, yesOrNo) {

    const isDisplayed = (seeOrNotSee === 'see');
    const isYesPath = (yesOrNo === 'yes');

    expect(await ccdPage.headingContains('Hearing requirements', !isDisplayed)).to.equal(isDisplayed);

    if (isDisplayed) {

        if (isYesPath) {
            expect(await ccdPage.isFieldValueDisplayed('Will the appellant give oral evidence at the hearing?', 'Yes')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Will the appellant attend the hearing?', 'Yes')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Will any witnesses attend the hearing?', 'Yes')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Name', 'Jenny Button')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('How many witnesses will attend?', '1')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Do you need interpreter services at the hearing?', 'Yes')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Language', 'Zulu')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Dialect', 'Kwabe')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Do you need a hearing room with step-free access?', 'Yes')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Do you need a hearing loop?', 'Yes')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Does the appellant have any physical or mental health issues that may impact them during the hearing?', 'Yes')).to.equal(true);
            expect(
                await ccdPage.isFieldValueDisplayed(
                    'Explain in detail how any physical or mental health issues may affect them during the hearing.', 'The appellant is deaf in one ear'
                )).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Has the appellant had any past experiences that may impact them during the hearing?', 'Yes')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Explain in detail how any past experiences may affect them during the hearing.', 'The appellant is fearful of the law')).to.equal(true);
            expect(
                await ccdPage.isFieldValueDisplayed(
                    'Do you have multimedia evidence?', 'Yes'
                )).to.equal(true);
            expect(
                await ccdPage.isFieldValueDisplayed(
                    'You should provide the equipment to play this evidence. If this is not possible, explain why and what equipment you\'ll need to play it.',
                    'The appellant has a video recording on a memory stick which needs to be played on a computer'
                )).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Does the appellant need a single-sex court?', 'Yes')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('What type of court do they need?', 'All female')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Explain in detail why the appellant needs a single-sex court.', 'The appellant is fearful of men')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Does the appellant need an in camera court?', 'Yes')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Explain in detail why the appellant needs a private hearing.', 'The appellant is afraid of the general public')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Is there anything else you would like to request?', 'Yes')).to.equal(true);
            expect(
                await ccdPage.isFieldValueDisplayed(
                    'Provide details of any additional requests and why they are necessary.', 'The appellant would like fresh orange juice and doughnuts'
                )).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Date', '31 Dec 2019')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Reason', 'New Year\'s Eve')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Document', '-Gonzlez-hearing-requirements.PDF', false)).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Date uploaded', '{$TODAY|D MMM YYYY}')).to.equal(true);
        } else {
            expect(await ccdPage.isFieldValueDisplayed('Will the appellant give oral evidence at the hearing?', 'No')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Will the appellant attend the hearing?', 'No')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Will any witnesses attend the hearing?', 'No')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Do you need interpreter services at the hearing?', 'No')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Do you need a hearing room with step-free access?', 'No')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Do you need a hearing loop?', 'No')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Does the appellant have any physical or mental health issues that may impact them during the hearing?', 'No')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Has the appellant had any past experiences that may impact them during the hearing?', 'No')).to.equal(true);
            expect(
                await ccdPage.isFieldValueDisplayed(
                    'Do you have multimedia evidence?', 'No'
                )).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Does the appellant need a single-sex court?', 'No')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Does the appellant need an in camera court?', 'No')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Is there anything else you would like to request?', 'No')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Document', '-Gonzlez-hearing-requirements.PDF', false)).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Date uploaded', '{$TODAY|D MMM YYYY}')).to.equal(true);
        }

    } else {
        expect(await ccdPage.contentContains('Will the appellant give oral evidence at the hearing?', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Will the appellant attend the hearing?', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Will any witnesses attend the hearing?', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Name', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('How many witnesses will attend?', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Do you need interpreter services at the hearing?', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Language', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Dialect', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Do you need a hearing room with step-free access?', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Do you need a hearing loop?', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Does the appellant have any physical or mental health issues that may impact them during the hearing?', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Explain in detail how any physical or mental health issues may affect them during the hearing.', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Dialect', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Dialect', Wait.instant)).to.equal(false);
    }
});
