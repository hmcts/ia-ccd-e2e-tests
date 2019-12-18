import { Then } from 'cucumber';
import { expect } from 'chai';
import { Wait } from '../../../enums/wait';
import { CcdPage } from '../../../pages/ccd.page';

const ccdPage = new CcdPage();

Then(/^I should not see the requests for additional adjustments$/, async function () {

    expect(await ccdPage.headingContains('Requests for additional adjustments')).to.equal(false);
    expect(await ccdPage.contentContains('Does the appellant have any physical or mental health issues that may impact them during the hearing?', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('Explain in detail how any physical or mental health issues may affect them during the hearing.', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('Has the appellant had any past experiences that may impact them during the hearing?', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('Explain in detail how any past experiences may affect them during the hearing.', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('Do you have multimedia evidence?', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains(
        'You should provide the equipment to play this evidence. If this is not possible, explain why and what equipment you\'ll need to play it.',
        Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('Does the appellant need a single-sex court?', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('What type of court do they need?', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('Explain in detail why the appellant needs a single-sex court.', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('Does the appellant need an in camera court?', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('Explain in detail why the appellant needs a private hearing.', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('Is there anything else you would like to request?', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('Provide details of any additional requests and why they are necessary.', Wait.instant)).to.equal(false);

});

Then(/^I should see the agreed additional adjustments (yes|no) path$/, async function (yesOrNo) {

    const isYesPath = (yesOrNo === 'yes');

    expect(await ccdPage.headingContains('Agreed additional adjustments')).to.equal(true);

    if (isYesPath) {
        expect(await ccdPage.isFieldValueDisplayed('Adjustments to accommodate vulnerabilities', 'Adjustments to accommodate vulnerabilities will be reviewed')).to.equal(true);
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
});
