import { Then } from 'cucumber';
import { RemoveAppealFlow } from '../../../flows/remove-appeal.flow';

const removeAppealFlow = new RemoveAppealFlow();

Then(/^I remove the appeal from online service/, async function () {
  await removeAppealFlow.removeAppeal(true);
});
