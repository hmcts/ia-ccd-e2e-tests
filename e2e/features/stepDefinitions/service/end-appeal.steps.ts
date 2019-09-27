import { Then } from 'cucumber';
import { EndAppealFlow } from '../../../flows/end-appeal.flow';

const endAppealFlow = new EndAppealFlow();

Then(/^I end the appeal/, async function () {
    await endAppealFlow.endAppeal(true);
});
