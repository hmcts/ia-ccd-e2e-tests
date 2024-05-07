import { Then } from '@cucumber/cucumber';
import { RequestFeeRemissionFlow } from '../../../flows/request-fee-remission.flow';

const requestFeeRemissionFlow = new RequestFeeRemissionFlow();

Then(/^I request a fee remission/, async function () {
  await requestFeeRemissionFlow.legalAid(true);
});

Then(/^I request a remission of help with fees/, async function () {
  await requestFeeRemissionFlow.helpWithFees(true);
});
