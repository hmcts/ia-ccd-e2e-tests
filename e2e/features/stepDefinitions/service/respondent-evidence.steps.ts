import { RequestRespondentEvidenceFlow } from '../../../flows/request-respondent-evidence.flow';
import { UploadAdditionalEvidenceFlow } from '../../../flows/upload-additional-evidence.flow';
import { UploadRespondentEvidenceFlow } from '../../../flows/upload-respondent-evidence.flow';
import { RequestHomeOfficeDataFlow } from '../../../flows/request-home-office-data.flow';
import { Then } from 'cucumber';

const requestHomeOfficeDataFlow = new RequestHomeOfficeDataFlow();
const requestRespondentEvidenceFlow = new RequestRespondentEvidenceFlow();
const uploadAdditionalEvidenceFlow = new UploadAdditionalEvidenceFlow();
const uploadRespondentEvidenceFlow = new UploadRespondentEvidenceFlow();

Then(/^I request home office data$/, async function () {
    await requestHomeOfficeDataFlow.requestHomeOfficeData(true);
});

Then(/^I request respondent evidence$/, async function () {
    await requestRespondentEvidenceFlow.requestRespondentEvidence(true);
});

Then(/^I upload respondent evidence$/, async function () {
    await uploadRespondentEvidenceFlow.uploadRespondentEvidence(true);
});

Then(/^I upload additional evidence$/, async function () {
    await uploadAdditionalEvidenceFlow.uploadAdditionalEvidence(true);
});

Then(/^I upload Home Office bundle$/, async function () {
    await uploadRespondentEvidenceFlow.uploadHomeOfficeBundle(true);
});
