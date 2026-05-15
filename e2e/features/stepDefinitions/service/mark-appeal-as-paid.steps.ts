import { Then } from '@cucumber/cucumber';
import { MarkAppealAsPaidFlow } from '../../../flows/mark-appeal-as-paid.flow';

const markAppealAsPaidFlow = new MarkAppealAsPaidFlow();

Then(/^I mark the appeal as paid/, async() => {
  await markAppealAsPaidFlow.markAppealAsPaid(true);
});
