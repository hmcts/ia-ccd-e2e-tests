import { Then } from '@cucumber/cucumber';
import { RemoveAppealFlow } from '../../../flows/remove-appeal.flow';

const removeAppealFlow = new RemoveAppealFlow();

Then(/^I remove the appeal from online service/, async() => {
  await removeAppealFlow.removeAppeal(true);
});
