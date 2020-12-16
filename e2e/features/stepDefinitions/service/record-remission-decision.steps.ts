import { Then } from 'cucumber';
import { RecordRemissionDecisionFlow } from '../../../flows/record-remission-decision.flow';

const recordRemissionDecisionFlow = new RecordRemissionDecisionFlow();

Then(/^I record remission decision as partially approved/, async function () {
    await recordRemissionDecisionFlow.partiallyApproved(true);
});
