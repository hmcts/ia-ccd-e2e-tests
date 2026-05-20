import { RequestRespondentEvidenceFlow } from '../../../flows/request-respondent-evidence.flow';
import { UploadAdditionalEvidenceFlow } from '../../../flows/upload-additional-evidence.flow';
import { UploadRespondentEvidenceFlow } from '../../../flows/upload-respondent-evidence.flow';
import { Then } from '@cucumber/cucumber';

const requestRespondentEvidenceFlow = new RequestRespondentEvidenceFlow();
const uploadAdditionalEvidenceFlow = new UploadAdditionalEvidenceFlow();
const uploadRespondentEvidenceFlow = new UploadRespondentEvidenceFlow();

Then(/^I request respondent evidence$/, async() => {
  await requestRespondentEvidenceFlow.requestRespondentEvidence(true);
});

Then(/^I upload respondent evidence$/, async() => {
  await uploadRespondentEvidenceFlow.uploadRespondentEvidence(true);
});

Then(/^I upload additional evidence$/, async() => {
  await uploadAdditionalEvidenceFlow.uploadAdditionalEvidence(true);
});

Then(/^I upload Home Office bundle$/, async() => {
  await uploadRespondentEvidenceFlow.uploadHomeOfficeBundle(true);
});

Then('I see the default text in the Request respondent evidence text area input field', async() => {
  await uploadRespondentEvidenceFlow.verifyDefaultTextInTextArea();
});
