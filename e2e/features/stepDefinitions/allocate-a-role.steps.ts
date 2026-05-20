import { Then, When } from '@cucumber/cucumber';
import { AllocateARoleFlow } from '../../flows/allocate-a-role.flow';

const legalOpsFlow = new AllocateARoleFlow();

When(/^I click the `Allocate a role` link for Legal Ops$/, async() => {
  await legalOpsFlow.allocateARoleLink(true, 'Legal Ops');
});

When(/^I click the `Allocate a role` link for Judiciary$/, async() => {
  await legalOpsFlow.allocateARoleLink(true, 'Judiciary');
});

Then(/^I allocate a role to my self `?([^`]+)`?/, async userRole => {
  await legalOpsFlow.reserveToMe(true, userRole);
});

Then(/^I allocate a role to another legal ops user/, async() => {
  await legalOpsFlow.legalOpsToAnotherLegalOps(true);
});

Then(/^I allocate a role to another Judiciary user/, async() => {
  await legalOpsFlow.legalOpsToJudicial();
});

Then(/^I Allocate a role from Judicial to another Judicial user/, async() => {
  await legalOpsFlow.judicialToAnotherJudicial();
});

Then(/^I Allocate a role from Judicial to legal ops/, async() => {
  await legalOpsFlow.judicialToLegalOps();
});
