import { RequestRespondentEvidenceFlow } from '../../../flows/request-respondent-evidence.flow';
import { UploadRespondentEvidenceFlow } from '../../../flows/upload-respondent-evidence.flow';
import { Then } from 'cucumber';

const requestRespondentEvidenceFlow = new RequestRespondentEvidenceFlow();
const uploadRespondentEvidenceFlow = new UploadRespondentEvidenceFlow();

Then(/^I request respondent evidence$/, async function () {
    await requestRespondentEvidenceFlow.requestRespondentEvidence(true);
});

Then(/^I upload respondent evidence$/, async function () {
    await uploadRespondentEvidenceFlow.uploadRespondentEvidence(true);
});
