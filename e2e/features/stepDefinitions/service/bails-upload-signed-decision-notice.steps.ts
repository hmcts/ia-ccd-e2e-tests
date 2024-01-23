import { UploadSignedDecisionNotice } from '../../../flows/bails-upload-signed-decision-notice.flow';
import { Given } from '@cucumber/cucumber';

const uploadSignedDecisionNotice = new UploadSignedDecisionNotice();

Given('I upload the signed decision notice for a refusal', async function () {
  await uploadSignedDecisionNotice.uploadSignedDecisionNotice(true, 'Refused');
});

Given('I upload the signed decision notice for a grant', async function () {
  await uploadSignedDecisionNotice.uploadSignedDecisionNotice(true, 'Granted');
});

Given('I upload the signed decision notice for a conditional grant', async function () {
  await uploadSignedDecisionNotice.uploadSignedDecisionNotice(true, 'Conditional Grant');
});
