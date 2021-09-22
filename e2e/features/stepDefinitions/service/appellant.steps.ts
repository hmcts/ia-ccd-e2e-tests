import { CcdPage } from '../../../pages/ccd.page';
import { Then } from 'cucumber';
import { Wait } from '../../../enums/wait';
import { expect } from 'chai';
const iaConfig = require('../../../ia.conf');

const ccdPage = new CcdPage();

Then(/^I should (see|not see) the appellant's details$/, async function (seeOrNotSee) {

    const isDisplayed = (seeOrNotSee === 'see');

    expect(await ccdPage.headingContains('Appellant\'s details', !isDisplayed)).to.equal(isDisplayed);

    if (isDisplayed) {

        const referenceNumberIsDraft = await ccdPage.isFieldValueDisplayed('Appeal reference', 'DRAFT');
        const referenceNumberIsCorrectLength = await ccdPage.isFieldValueCorrectLength('Appeal reference', 13);

        expect(referenceNumberIsDraft || referenceNumberIsCorrectLength).to.equal(true);
        expect(await ccdPage.isFieldValueDisplayed('Title', 'Mr')).to.equal(true);
        expect(await ccdPage.isFieldValueDisplayed('Given names', 'José')).to.equal(true);
        expect(await ccdPage.isFieldValueDisplayed('Family name', 'González')).to.equal(true);
        expect(await ccdPage.isFieldValueDisplayed('Date of birth', '31 Dec 1999')).to.equal(true);
        expect(await ccdPage.isFieldValueDisplayed('Nationality', 'Finland', true, 'first', 'Nationalities', 'first')).to.equal(true);
        expect(await ccdPage.isFieldValueDisplayed('Does the appellant have a fixed address?', 'No')).to.equal(true);

    } else {

        expect(await ccdPage.contentContains('Appeal reference', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Title', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Given names', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Family name', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Date of birth', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Nationality', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Does the appellant have a fixed address?', Wait.instant)).to.equal(false);
    }
});

Then(/^I should (see|not see) the legal representative's details$/, async function (seeOrNotSee) {

    const isDisplayed = (seeOrNotSee === 'see');

    expect(await ccdPage.headingContains('Legal representative\'s details', !isDisplayed)).to.equal(isDisplayed);

    if (isDisplayed) {

        expect(await ccdPage.isFieldValueDisplayed('Company', 'IA Legal Services')).to.equal(true);
        expect(await ccdPage.isFieldValueDisplayed('Name', 'Stephen Fenn')).to.equal(true);
        expect(await ccdPage.isFieldValueDisplayed('Email', iaConfig.TestLawFirmAUserName)).to.equal(true);
        expect(await ccdPage.isFieldValueDisplayed('Legal representative reference', 'ia-legal-fenn')).to.equal(true);

    } else {
        expect(await ccdPage.contentContains('Company', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Name', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Email', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Legal representative reference', Wait.instant)).to.equal(false);
    }
});
