import { SendDecisionAndReasonsFlow } from '../../../flows/send-decision-and-reasons.flow';
import { Then } from 'cucumber';

const sendDecisionAndReasonsFlow = new SendDecisionAndReasonsFlow();

Then(/^I send decision and reasons$/, async function () {
    await sendDecisionAndReasonsFlow.sendDecisionAndReasons();
});
