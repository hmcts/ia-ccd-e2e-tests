import { AddAppealResponseFlow } from '../../../flows/add-appeal-response.flow';
import { RequestRespondentReviewFlow } from '../../../flows/request-respondent-review.flow';
import { Then } from '@cucumber/cucumber';
import { UploadAppealResponseFlow } from '../../../flows/upload-appeal-response-flow';

const addAppealResponseFlow = new AddAppealResponseFlow();
const requestRespondentReviewFlow = new RequestRespondentReviewFlow();
const uploadAppealResponseFlow = new UploadAppealResponseFlow();

Then(/^I request respondent review$/, async function () {
  await requestRespondentReviewFlow.requestRespondentReview(true);
});

Then(/^I request appellant review$/, async function () {
  await requestRespondentReviewFlow.requestAppellantReview(true);
});

Then(/^I add the appeal response$/, async function () {
  await addAppealResponseFlow.addAppealResponse(true);
});

Then(/^I upload the appeal response$/, async function () {
  await uploadAppealResponseFlow.uploadAppealResponse(true);
});
