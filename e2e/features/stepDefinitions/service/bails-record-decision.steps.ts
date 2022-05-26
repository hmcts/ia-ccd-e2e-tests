import { RecordDecision } from '../../../flows/bails-record-decision.flow';
import { Given } from 'cucumber';

const recordDecision = new RecordDecision();

Given('I record a refused decision with SS consent No', async function () {
  await recordDecision.recordDecision(true, 'No', 'Refused', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A');
});

// Given('I record a refused decision with SS consent Yes', async function () {
//   await recordDecision.recordDecision(true, 'SsConsentYesOrNo', 'tribunalDecision', 'SsConsentDecisionYesOrNo', 'releaseStatusYesOrNo', 'conditions[]', 'financialConditionYesOrNo', 'financialConditionDetailsYesOrNo', 'numberOfSupporters', 'yesOrNoForEachSupporter[]', 'bailTransferYesOrNo');
// });
//
// Given('I record a refused decision with SS consent Yes and Minded to grant', async function () {
//   await recordDecision.recordDecision(true);
// });
//
// Given('I record a granted decision with SS consent No', async function () {
//   await recordDecision.recordDecision(true);
// });
//
// Given('I record a granted decision with SS consent Yes', async function () {
//   await recordDecision.recordDecision(true);
// });
//
// Given('I record a conditional grant decision with SS consent No', async function () {
//   await recordDecision.recordDecision(true);
// });
//
// Given('I record a conditional grant decision with SS consent Yes', async function () {
//   await recordDecision.recordDecision(true);
// });
//
// await recordDecision.recordDecision(true, 'SsConsentYesOrNo', 'tribunalDecision', 'SsConsentDecisionYesOrNo', 'releaseStatusYesOrNo', 'conditions[]', 'financialConditionYesOrNo', 'financialConditionDetailsYesOrNo', 'numberOfSupporters', 'yesOrNoForEachSupporter[]', 'bailTransferYesOrNo');