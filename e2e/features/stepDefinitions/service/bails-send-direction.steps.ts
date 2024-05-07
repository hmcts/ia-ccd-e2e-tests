import { SendDirection } from '../../../flows/bails-send-direction.flow';
import { Given } from '@cucumber/cucumber';

const sendDirectionFlow = new SendDirection();

Given(/^I send a direction to the `(Applicant|Home Office|Legal Representative)`$/, async function (receiver) {
  await sendDirectionFlow.sendDirection(true, receiver);
});
