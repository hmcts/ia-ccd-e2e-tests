import { SendDirection } from '../../../flows/bails-send-direction.flow';
import { Given } from '@cucumber/cucumber';

const sendDirectionFlow = new SendDirection();

Given(/^I send a direction to the `(Home Office|Legal representative)`$/, async receiver => {
  await sendDirectionFlow.sendDirection(true, receiver);
});
