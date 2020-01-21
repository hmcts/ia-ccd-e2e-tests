import { SubmitHearingRequirementsNoPathFlow } from '../../../flows/submit-hearing-requirements-no-path.flow';
import { Then } from 'cucumber';
import { expect } from 'chai';
import { Wait } from '../../../enums/wait';
import { CcdPage } from '../../../pages/ccd.page';
import { SubmitHearingRequirementsYesFlow } from '../../../flows/submit-hearing-requirements-yes-path.flow';

const submitHearingRequirementsNoFlow = new SubmitHearingRequirementsNoPathFlow();
const submitHearingRequirementsYesFlow = new SubmitHearingRequirementsYesFlow();
const ccdPage = new CcdPage();

Then(/^I submit hearing requirements with all no$/, async function () {
    await submitHearingRequirementsNoFlow.submitHearingRequirements(true);
});

Then(/^I submit hearing requirements with all yes$/, async function () {
    await submitHearingRequirementsYesFlow.submitHearingRequirements(true);
});

Then(/^I should (see|not see) the hearing requirements (yes|no) path$/, async function (seeOrNotSee, yesOrNo) {

    const isDisplayed = (seeOrNotSee === 'see');
    const isYesPath = (yesOrNo === 'yes');

    expect(await ccdPage.headingContains('Hearing requirements', isDisplayed)).to.equal(isDisplayed);
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
            expect(await ccdPage.isFieldValueDisplayed('Date', '31 Dec 2019')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Reason', 'New Year\'s Eve')).to.equal(true);
        } else {
            expect(await ccdPage.isFieldValueDisplayed('Will the appellant give oral evidence at the hearing?', 'No')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Will the appellant attend the hearing?', 'No')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Will any witnesses attend the hearing?', 'No')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Do you need interpreter services at the hearing?', 'No')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Do you need a hearing room with step-free access?', 'No')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Do you need a hearing loop?', 'No')).to.equal(true);
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
        expect(await ccdPage.contentContains('Date')).to.equal(false);
        expect(await ccdPage.contentContains('Reason')).to.equal(false);
    }
});
