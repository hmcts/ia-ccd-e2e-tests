import { Then, When } from 'cucumber';
import { AllocateARoleFlow } from '../../flows/allocate-a-role.flow';

const legalOpsFlow = new AllocateARoleFlow();
// const JudiciaryFlow = new AllocateARoleFlow()

When(/^I click the `Allocate a role` link for Legal Ops$/, async function () {
    await legalOpsFlow.legalOps(true);
});

Then(/^I allocate a role/, async function () {
    await legalOpsFlow.legalOps(true);
});

Then(/^I allocate a role/, async function () {
    await legalOpsFlow.Judiciary(true);
});
