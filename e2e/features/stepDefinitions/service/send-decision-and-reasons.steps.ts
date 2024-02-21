import { SendDecisionAndReasonsFlow } from '../../../flows/send-decision-and-reasons.flow';
import { Then } from '@cucumber/cucumber';

const sendDecisionAndReasonsFlow = new SendDecisionAndReasonsFlow();

Then(/^I send decision and reasons$/, async function () {
    await sendDecisionAndReasonsFlow.sendDecisionAndReasons();
});

Then(/^I send decision and reasons with dismissed outcome$/, async function () {
    await sendDecisionAndReasonsFlow.sendDecisionAndReasonsDismissed();
});
