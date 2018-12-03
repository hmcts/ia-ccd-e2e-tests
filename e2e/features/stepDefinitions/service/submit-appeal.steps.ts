import { SubmitAppealFlow } from '../../../flows/submit-appeal.flow';
import { Then, When } from 'cucumber';

const submitAppealFlow = new SubmitAppealFlow();

When(/^I agree to the declaration$/, async function () {
    await submitAppealFlow.completeDeclaration();
});

Then(/^I submit my appeal$/, async function () {
    await submitAppealFlow.submitAppeal(true);
});
