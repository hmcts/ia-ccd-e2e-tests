import { RequestRespondentReviewFlow } from '../../../flows/request-respondent-review.flow';
import { Then } from 'cucumber';

const requestRespondentReviewFlow = new RequestRespondentReviewFlow();

Then(/^I request respondent review$/, async function () {
    await requestRespondentReviewFlow.requestRespondentReview(true);
});
