import { SendDirection } from '../../../flows/bails-send-direction.flow';
import { Given } from 'cucumber';

const sendDirectionFlow = new SendDirection();

Given(/^I send a direction to the `(Home Office|Legal representative)`$/, async function (receiver) {
  await sendDirectionFlow.sendDirection(true, receiver);
});
