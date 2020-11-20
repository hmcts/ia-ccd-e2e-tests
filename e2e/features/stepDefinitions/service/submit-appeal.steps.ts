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
    if (isfeePaymentEnabled) {
        await payAndSubmitAppealFlow.payAndsubmitAppeal(true);
    } else {
        await submitAppealFlow.submitAppeal(true);
    }
});

Then(/^I pay for and submit my appeal$/, async function () {
    await payAndSubmitAppealFlow.payAndsubmitAppeal(true);
});

Then(/^I submit my nonpayment appeal$/, async function () {
    await submitAppealFlow.submitAppeal(true);
});
