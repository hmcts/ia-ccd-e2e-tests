import { CcdPage } from '../../../pages/ccd.page';
import { Then } from 'cucumber';
import { expect } from 'chai';

const ccdPage = new CcdPage();

Then(/^I should see an alert confirming the case `?([^`]+)`?$/, async function (alertText) {
    expect(await ccdPage.alertContains(alertText)).to.equal(true);
});

Then(/^I select the `?([^`]+)`? Next step$/, async function (nextStep) {
    await ccdPage.selectNextStep(nextStep);
    await ccdPage.click('Go');
});
