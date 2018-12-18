import { SubmitCaseFlow } from '../../../flows/submit-case.flow';
import { Then } from 'cucumber';

const submitCaseFlow = new SubmitCaseFlow();

Then(/^I submit my case$/, async function () {
    await submitCaseFlow.submitCase(true);
});
