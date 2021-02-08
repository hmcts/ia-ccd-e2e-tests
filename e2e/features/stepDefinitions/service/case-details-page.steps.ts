import { CcdPage } from '../../../pages/ccd.page';
import { Then } from 'cucumber';
import { expect } from 'chai';
import { Wait } from '../../../enums/wait';

const ccdPage = new CcdPage();

Then(/^I should see an alert confirming the case `?([^`]+)`?$/, async function (alertText) {
    await ccdPage.runAccessbility();
    expect(await ccdPage.alertContains(alertText)).to.equal(true);
});

Then(/^I select the `?([^`]+)`? Next step$/, async function (nextStep) {
    await ccdPage.runAccessbility();
    await ccdPage.selectNextStep(nextStep);
    await ccdPage.click('Go');
});

Then(/^I should not see the decision fields$/, async function () {
    await ccdPage.runAccessbility();
    expect(await ccdPage.contentContains('Introduction', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('Appellant\'s case summary', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('Do both parties agree the immigration history?', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('Give the respondent\'s account of the immigration history', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('Give the areas of disagreement in relation to immigration history', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('Do both parties agree the schedule of issues?', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('The appellant\'s schedule of issues as stated in the appeal skeleton argument', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('Areas of disagreement between the parties concerning the appellant\'s schedule of issues', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('Agreed immigration history', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('The appellant\'s schedule of issues', Wait.instant)).to.equal(false);
});
