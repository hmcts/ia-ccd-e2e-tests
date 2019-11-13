import { SubmitHearingRequirementsFlow } from '../../../flows/submit-hearing-requirements.flow';
import { Then } from 'cucumber';

const submitHearingRequirementsFlow = new SubmitHearingRequirementsFlow();

Then(/^I submit hearing requirements$/, async function () {
    await submitHearingRequirementsFlow.submitHearingRequirements(true);
});
