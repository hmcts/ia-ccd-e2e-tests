import { SendDecisionAndReasonsFlow } from '../../../flows/send-decision-and-reasons.flow';
import { Then } from '@cucumber/cucumber';

const sendDecisionAndReasonsFlow = new SendDecisionAndReasonsFlow();

Then(/^I send decision and reasons$/, async() => {
  await sendDecisionAndReasonsFlow.sendDecisionAndReasons();
});

Then(/^I send decision and reasons with dismissed outcome$/, async() => {
  await sendDecisionAndReasonsFlow.sendDecisionAndReasonsDismissed();
});
