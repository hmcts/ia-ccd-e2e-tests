import { StartDecisionAndReasonsFlow } from '../../../flows/start-decision-and-reasons.flow';
import { Then } from '@cucumber/cucumber';

const startDecisionAndReasonsFlow = new StartDecisionAndReasonsFlow();

Then(/^I start decision and reasons$/, async function () {
  await startDecisionAndReasonsFlow.startDecisionAndReasons();
});
