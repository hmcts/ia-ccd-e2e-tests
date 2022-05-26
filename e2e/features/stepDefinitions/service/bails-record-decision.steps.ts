import { RecordDecision } from '../../../flows/bails-record-decision.flow';
import { Given } from 'cucumber';

const recordDecision = new RecordDecision();

// Given('I record a granted decision', async function () {
//   await recordDecision.recordGrantedDecision(true);
// });
//
// Given('I record a refused decision', async function () {
//   await recordDecision.recordRefusedDecision(true);
// });
//
// Given('I record a conditional grant decision', async function () {
//   await recordDecision.recordConditionalGrantDecision(true);
// });

Given('I complete Conditions page', async function () {
  await recordDecision.completeConditions(true, ['Appearance', 'Other']);
});
