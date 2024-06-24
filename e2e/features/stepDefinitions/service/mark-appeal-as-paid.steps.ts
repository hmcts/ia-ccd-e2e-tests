import { Then } from 'cucumber';
import { MarkAppealAsPaidFlow } from '../../../flows/mark-appeal-as-paid.flow';

const markAppealAsPaidFlow = new MarkAppealAsPaidFlow();

Then(/^I mark the appeal as paid/, async function () {
  await markAppealAsPaidFlow.markAppealAsPaid(true);
});
