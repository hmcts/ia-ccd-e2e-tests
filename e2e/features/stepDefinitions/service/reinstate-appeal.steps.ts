import { Then } from '@cucumber/cucumber';
import { ReinstateAppealFlow } from '../../../flows/reinstate-appeal.flow';

const reinstateAppealFlow = new ReinstateAppealFlow();

Then(/^I reinstate the appeal/, async function () {
    await reinstateAppealFlow.reinstateAppeal(true);
});
