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
  await submitAppealFlow.submitAppeal(true);
  if (isfeePaymentEnabled) {
    await payAndSubmitAppealFlow.createServiceRequest(true);
    await payAndSubmitAppealFlow.payForAppealByPBA(true);
  }
});

Then(/^I pay for and submit my appeal by PBA/, async function () {
  await submitAppealFlow.submitAppeal(true);
  await payAndSubmitAppealFlow.createServiceRequest(true);
  await payAndSubmitAppealFlow.payForAppealByPBA(true);
});

Then(/^I pay for and submit my appeal by Card$/, async function () {
  await submitAppealFlow.submitAppeal(true);
  await payAndSubmitAppealFlow.createServiceRequest(true);
  await payAndSubmitAppealFlow.payForAppealByCard(true);
});

Then(/^I submit my nonpayment appeal$/, async function () {
  await submitAppealFlow.submitAppeal(true);
});

Then(/^I submit my late appeal$/, async function () {
  await submitAppealFlow.submitLateAppeal(true);
});

Then(/^I submit my appeal before paying$/, async function () {
  await submitAppealFlow.submitAppeal(true);
});
