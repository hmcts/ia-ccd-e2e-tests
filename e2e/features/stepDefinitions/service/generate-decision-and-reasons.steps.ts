import { Then } from 'cucumber';
import { GenerateDecisionAndReasonsFlow } from '../../../flows/generate-decision-and-reasons.flow';

const generateDecisionAndReasonsFlow = new GenerateDecisionAndReasonsFlow();

Then(/^I generate decision and reasons$/, async function () {
    await generateDecisionAndReasonsFlow.generateDecisionAndReasons();
});
