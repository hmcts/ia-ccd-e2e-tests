import { CcdPage } from '../../../pages/ccd.page';
import { RequestRespondentEvidenceFlow } from '../../../flows/request-respondent-evidence.flow';
import { Then } from 'cucumber';
import { expect } from 'chai';

const ccdPage = new CcdPage();
const requestRespondentEvidenceFlow = new RequestRespondentEvidenceFlow();

Then(/^I should see an alert confirming the case `?([^`]+)`?$/, async function (alertText) {
    expect(await ccdPage.alertContains(alertText)).to.equal(true);
});

Then(/^I select the `?([^`]+)`? Next step$/, async function (nextStep) {
    await ccdPage.selectNextStep(nextStep);
    await ccdPage.click('Go');
});

Then(/^I request respondent evidence$/, async function () {
    await requestRespondentEvidenceFlow.requestRespondentEvidence(true);
});
