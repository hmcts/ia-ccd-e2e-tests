import { Then } from '@cucumber/cucumber';
import { SendCasePreHearingFlow } from '../../../flows/send-case-pre-hearing.flow';

const sendCasePreHearingFlow = new SendCasePreHearingFlow();

Then(/^I send the case to pre hearing$/, async function () {
  await sendCasePreHearingFlow.sendCasePreHearingFlow();
});
