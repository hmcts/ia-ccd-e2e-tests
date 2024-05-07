import { CaseSummaryFlow } from '../../../flows/create-case-summary.flow';
import { Then } from '@cucumber/cucumber';

const caseSummaryFlow = new CaseSummaryFlow();

Then(/^I create case summary$/, async function () {
  await caseSummaryFlow.createCaseSummary(true);
});
