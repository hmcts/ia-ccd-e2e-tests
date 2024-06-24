import { RequestHearingRequirementsFlow } from '../../../flows/request-hearing-requirements.flow';
import { Then } from 'cucumber';

const requestHearingRequirementsFlow = new RequestHearingRequirementsFlow();

Then(/^I request hearing requirements$/, async function () {
  await requestHearingRequirementsFlow.requestHearingRequirements();
});
