import { Then } from '@cucumber/cucumber';
import { EndAppealFlow } from '../../../flows/end-appeal.flow';

const endAppealFlow = new EndAppealFlow();

Then(/^I end the appeal/, async() => {
  await endAppealFlow.endAppeal(true);
});
