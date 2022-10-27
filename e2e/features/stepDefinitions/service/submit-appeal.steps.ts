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
        await payAndSubmitAppealFlow.payForAppealByPBA(true, PAorNot);
    }
});

Then(/^I pay for and submit my appeal by PBA for a (PA|non PA) appeal type$/, async function (PAorNot) {
    await submitAppealFlow.submitAppeal(true);
    await payAndSubmitAppealFlow.payForAppealByPBA(true, PAorNot);
});

Then(/^I pay for and submit my appeal by Card for a (PA|non PA) appeal type$/, async function (PAorNot) {
    await submitAppealFlow.submitAppeal(true);
    await payAndSubmitAppealFlow.payForAppealByCard(true, PAorNot);
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
