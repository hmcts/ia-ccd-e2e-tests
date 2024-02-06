import { ListCaseFlow } from '../../../flows/list-case.flow';
import { Then } from '@cucumber/cucumber';

const listCaseFlow = new ListCaseFlow();

Then(/^I list the case$/, async function () {
    await listCaseFlow.listTheCase(true);
});
Then(/^I list the bail case$/, async function () {
    await listCaseFlow.listTheBailCase(true);
});
Then(/^I relist the bail case$/, async function () {
    await listCaseFlow.reListTheBailCase(true);
});

Then(/^I list the case as a remote hearing$/, async function () {
    await listCaseFlow.listTheCaseAsRemoteHearing(true);
});

Then(/^I relist the case as a remote hearing$/, async function () {
    await listCaseFlow.reListTheCaseAsRemoteHearing(true);
});

Then(/^I relist the case as a remote hearing with no changes$/, async function () {
    await listCaseFlow.reListTheCaseAsRemoteHearingWithNoChanges(true);
});

Then(/^I list the case with hearing requirements$/, async function () {
    await listCaseFlow.listTheCase(true);
});

Then(/^I relist the case with length of hearing as `?([^`]+)`? hours$/, async function (lengthOfHearingInHours) {
    await listCaseFlow.reListTheCase(true, lengthOfHearingInHours);
});
