import { Then, When } from 'cucumber';
import { AllocateARoleFlow } from '../../flows/allocate-a-role.flow';

const legalOpsFlow = new AllocateARoleFlow();
const JudiciaryFlow = new AllocateARoleFlow()

When(/^I click the `Allocate a role` link for Legal Ops$/, async function () {
    await legalOpsFlow.legalOps(true);
});

When(/^I click the `Allocate a role` link for Judiciary$/, async function () {
    await JudiciaryFlow.legalOpsToJudicial(true);
});

Then(/^I allocate a role to my self/, async function () {
    await legalOpsFlow.legalOps(true);
});

Then(/^I allocate a role to another legal ops user/, async function () {
    await legalOpsFlow.legalOpsToAnotherLegalOps(true);
});

Then(/^I allocate a role to another Judiciary user/, async function (userName) {
    await legalOpsFlow.legalOpsToJudicial(userName);
});

Then(/^I allocate a role/, async function () {
    await legalOpsFlow.Judiciary(true);
});
