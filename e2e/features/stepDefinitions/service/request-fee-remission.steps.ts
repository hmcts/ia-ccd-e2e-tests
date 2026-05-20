import { Then } from '@cucumber/cucumber';
import { RequestFeeRemissionFlow } from '../../../flows/request-fee-remission.flow';

const requestFeeRemissionFlow = new RequestFeeRemissionFlow();

Then(/^I request a fee remission/, async() => {
  await requestFeeRemissionFlow.legalAid(true);
});

Then(/^I request a remission of help with fees/, async() => {
  await requestFeeRemissionFlow.helpWithFees(true);
});
