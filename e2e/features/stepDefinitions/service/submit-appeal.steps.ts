import { SubmitAppealFlow } from '../../../flows/submit-appeal.flow';
import { PayAndSubmitAppealFlow } from '../../../flows/pay-and-submit-appeal.flow';
import { Then, When } from '@cucumber/cucumber';

const isfeePaymentEnabled = require('../../../ia.conf').isfeePaymentEnabled === 'true';

const submitAppealFlow = new SubmitAppealFlow();
const payAndSubmitAppealFlow = new PayAndSubmitAppealFlow();

When(/^I agree to the declaration$/, async () => {
  await submitAppealFlow.completeDeclaration();
});

Then(/^I submit my appeal$/, async () => {
  await submitAppealFlow.submitAppeal();
  if (isfeePaymentEnabled) {
    await payAndSubmitAppealFlow.createServiceRequest();
    await payAndSubmitAppealFlow.payForAppealByPBA();
  }
});

Then(/^I pay for and submit my appeal by PBA/, async () => {
  await submitAppealFlow.submitAppeal();
  console.log('Submitted appeal successfully, now creating service request and paying by PBA');
  await payAndSubmitAppealFlow.createServiceRequest();
  console.log('Created service request successfully, now paying by PBA');
  await payAndSubmitAppealFlow.payForAppealByPBA();
  console.log('Paid for appeal by PBA successfully');
});

Then(/^I pay for and submit my appeal by Card$/, async () => {
  await submitAppealFlow.submitAppeal();
  console.log('Submitted appeal successfully, now creating service request and paying by card');
  await payAndSubmitAppealFlow.createServiceRequest();
  console.log('Created service request successfully, now paying by card');
  await payAndSubmitAppealFlow.payForAppealByCard();
  console.log('Paid for appeal by card successfully');
});

When('I check the case has been paid for', async () => {
  await payAndSubmitAppealFlow.checkCasePaidCaseOfficer();
});

Then('I should see the overview for a paid appeal', async () => {
  await payAndSubmitAppealFlow.waitForPaymentRecognition();
});

Then(/^I submit my nonpayment appeal$/, async () => {
  await submitAppealFlow.submitAppeal();
});

Then(/^I submit my late appeal$/, async () => {
  await submitAppealFlow.submitLateAppeal();
});

Then(/^I submit my appeal before paying$/, async () => {
  await submitAppealFlow.submitAppeal();
});

Then(/^I click the Continue button on the Pay by card page$/, async () => {
  await payAndSubmitAppealFlow.continuePayByCard();
});

When('I return to the service request', async () => {
  await payAndSubmitAppealFlow.returnToServiceRequest();
});
