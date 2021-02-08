import { NewShareACaseFlow } from '../../../flows/new-share-a-case.flow';
import { Then } from 'cucumber';

const newShareACaseFlow = new NewShareACaseFlow();

Then(/^I select the most recent case to share$/, async function () {
    await newShareACaseFlow.selectCaseToShare();
});
