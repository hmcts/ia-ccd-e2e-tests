import { Then, When } from 'cucumber';
import { ExclusionsFlow } from '../../flows/exclusions.flow';

const legalOpsExclusionFlow = new ExclusionsFlow();
const judicialExclusionFlow = new ExclusionsFlow();
const adminExclusionFlow = new ExclusionsFlow();

When(/^I click the `Add` link for Exclusions$/, async function () {
  await legalOpsExclusionFlow.clickAddLink(true);
});

Then(/^I exclude my self from case/, async function () {
  await legalOpsExclusionFlow.excludeMe(true);
});

Then(/^I Exclude another `?([^`]+)`? from case email text `?\s?`?([^`]+)`?/, async function (userRole, emailText) {
  await legalOpsExclusionFlow.legalOpsExcludeAnotherLegalOps(true, userRole, emailText);
});

Then(/^I exclude another Judicial from case/, async function () {
  await judicialExclusionFlow.judicialExcludeAnotherJudicial(true);
});

Then(/^I exclude another Admin from case/, async function () {
  await adminExclusionFlow.adminExcludeAnotherAdmin(true);
});
