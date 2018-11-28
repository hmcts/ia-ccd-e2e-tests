import { SubmitAppealFlow } from '../../../flows/submit-appeal.flow';
import { When } from 'cucumber';

const submitAppealFlow = new SubmitAppealFlow();

When(/^I agree to the declaration$/, async function () {
    await submitAppealFlow.completeDeclaration();
});
