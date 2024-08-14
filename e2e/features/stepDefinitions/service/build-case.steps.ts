import { BuildCaseFlow } from '../../../flows/build-case.flow';
import { Then, Given } from 'cucumber';
import { ForceACaseProgressionFlow } from '../../../flows/force-a-case-progression.flow';

const buildCaseFlow = new BuildCaseFlow();
const forceACaseFlow = new ForceACaseProgressionFlow();

Then(/^I build my case$/, async function () {
  await buildCaseFlow.buildCase(true);
});

Then('I progress case to force request case building', async function () {
  await forceACaseFlow.forceRequestToCaseBuilding(true);
});

Given(/^I request Force case - case under review$/, async function () {
  await forceACaseFlow.forceRequestToCaseUnderReview(true);
});

Given(/^I request Force case - hearing reqs$/, async function () {
  await forceACaseFlow.forceCaseToHearingRequirments(true);
});