import { Then, When } from 'cucumber';
import { ExclusionsFlow } from '../../flows/exclusions.flow';

const legalOpsExclusionFlow = new ExclusionsFlow();
const judicialExclusionFlow = new ExclusionsFlow();
const adminExclusionFlow = new ExclusionsFlow();

When(/^I click the `Add` link for Exclusions$/, async function () {
    await legalOpsExclusionFlow.legalOpsExclusion(true);
});

Then(/^I exclude my self from case/, async function () {
    await legalOpsExclusionFlow.legalOpsExclusion(true);
});

Then(/^I exclude another LegalOps from case/, async function () {
    await legalOpsExclusionFlow.legalOpsExcludeAnotherLegalOps(true);
});

Then(/^I exclude my self from case/, async function () {
    await judicialExclusionFlow.JudicialExclusion(true);
});

Then(/^I exclude another Judicial from case/, async function () {
    await judicialExclusionFlow.judicialExcludeAnotherJudicial(true);
});

Then(/^I exclude my self from case/, async function () {
    await adminExclusionFlow.adminExclusion(true);
});

Then(/^I exclude another Admin from case/, async function () {
    await adminExclusionFlow.adminExcludeAnotherAdmin(true);
});
