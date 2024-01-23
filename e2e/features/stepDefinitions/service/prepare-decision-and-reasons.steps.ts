import { Then } from '@cucumber/cucumber';
import { PrepareDecisionAndReasonsFlow } from '../../../flows/prepare-decision-and-reasons.flow';

const prepareDecisionAndReasonsFlow = new PrepareDecisionAndReasonsFlow();

Then(/^I prepare decision and reasons$/, async function () {
    await prepareDecisionAndReasonsFlow.prepareDecisionAndReasons();
});
