import { AddAppealResponseFlow } from '../../../flows/add-appeal-response.flow';
import { RequestRespondentReviewFlow } from '../../../flows/request-respondent-review.flow';
import { Then } from 'cucumber';

const addAppealResponseFlow = new AddAppealResponseFlow();
const requestRespondentReviewFlow = new RequestRespondentReviewFlow();

Then(/^I request respondent review$/, async function () {
    await requestRespondentReviewFlow.requestRespondentReview(true);
});

Then(/^I add the appeal response$/, async function () {
    await addAppealResponseFlow.addAppealResponse(true);
});
