import { SubmitAppealFlow } from '../../../flows/submit-appeal.flow';
import { PayAndSubmitAppealFlow } from '../../../flows/pay-and-submit-appeal.flow';
import { Then, When } from 'cucumber';

const isfeePaymentEnabled = require('../../../ia.conf').isfeePaymentEnabled === 'true';
const submitAppealFlow = new SubmitAppealFlow();
const payAndSubmitAppealFlow = new PayAndSubmitAppealFlow();

When(/^I agree to the declaration$/, async function () {
  await submitAppealFlow.completeDeclaration();
});

Then(/^I submit my appeal$/, async function () {
  await submitAppealFlow.submitAppeal();
  if (isfeePaymentEnabled) {
    await payAndSubmitAppealFlow.createServiceRequest();
    await payAndSubmitAppealFlow.payForAppealByPBA();
  }
});

Then(/^I pay for and submit my appeal by PBA/, async function () {
  await submitAppealFlow.submitAppeal();
  await payAndSubmitAppealFlow.createServiceRequest();
  await payAndSubmitAppealFlow.payForAppealByPBA();
});

Then(/^I mark appeal as paid/, async function () {
  await payAndSubmitAppealFlow.markAppealAsPaid();
});

Then(/^I pay for and submit my appeal by Card$/, async function () {
  await submitAppealFlow.submitAppeal();
  await payAndSubmitAppealFlow.createServiceRequest();
  await payAndSubmitAppealFlow.payForAppealByCard();
});

When('I check the case has been paid for', async function () {
  await payAndSubmitAppealFlow.checkCasePaidCaseOfficer();
});

Then('I should see the overview for a paid appeal', async function () {
  await payAndSubmitAppealFlow.waitForPaymentRecognition();
});

Then(/^I submit my nonpayment appeal$/, async function () {
  await submitAppealFlow.submitAppeal();
});

Then(/^I submit my late appeal$/, async function () {
  await submitAppealFlow.submitLateAppeal();
});

Then(/^I submit my appeal before paying$/, async function () {
  await submitAppealFlow.submitAppeal();
});

Then(/^I click the Continue button on the Pay by card page$/, async function () {
  await payAndSubmitAppealFlow.continuePayByCard();
});
