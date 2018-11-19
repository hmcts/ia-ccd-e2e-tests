import { CaseDetailsPage } from '../../../pages/case-details.page';
import { SubmitAppealFlow } from '../../../flows/submit-appeal.flow';
import { Then } from 'cucumber';
import { expect } from 'chai';
import moment = require('moment');

const caseDetailsPage = new CaseDetailsPage();
const submitAppealFlow = new SubmitAppealFlow();

Then(/^I should see an alert confirming the case (.+)$/, async function (alertText) {
    expect(await caseDetailsPage.alertContains(alertText)).to.equal(true);
});

Then(/^I select the `?([^`]+)`? Next step$/, async function (nextStep) {
    await caseDetailsPage.selectNextStep(nextStep)
    await caseDetailsPage.click('Go')
});

Then(/^I submit my appeal$/, async function () {
    await submitAppealFlow.submitAppeal();
});

Then(/^Within the `?([^`]+)`? collection, I should see `?([^`]+)`? for the `?([^\s`]+)`? `?([^`]+)`? field$/,
    async function (
        collectionLabel,
        fieldValue,
        collectionItemNumber,
        fieldLabel
    ) {
        fieldValue = fieldValue.replace('${today}', moment().format('D MMM YYYY'));

        expect(
            await caseDetailsPage.isCollectionItemFieldValueDisplayed(
                collectionLabel,
                collectionItemNumber,
                fieldLabel,
                fieldValue
            )
        ).to.equal(true);
    });

Then(/^Within the `?([^`]+)`? fieldset, I should see `?([^`]+)`? for the `?([^`]+)`? field$/,
    async function (
        fieldsetLabel,
        fieldValue,
        fieldLabel
    ) {
        expect(
            await caseDetailsPage.isFieldsetFieldValueDisplayed(
                fieldsetLabel,
                fieldLabel,
                fieldValue
            )
        ).to.equal(true);
    });
