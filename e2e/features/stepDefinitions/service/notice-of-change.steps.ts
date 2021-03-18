import { NoticeOfChangeFlow } from '../../../flows/notice-of-change.flow';
import { Then, When } from 'cucumber';
import { NoticeOfChangePage } from '../../../pages/notice-of-change.page';

const noticeOfChangeFlow = new NoticeOfChangeFlow();
const noticeOfChangePage = new NoticeOfChangePage();

When(/^I get the most recent case id for the notice of change case$/, async function () {
    await noticeOfChangeFlow.selectShareCase();
    await noticeOfChangePage.getNoticeOfChangeCaseId();
});

When('I enter the latest case id for the online case reference number', async function () {
    await noticeOfChangePage.enterCaseId();
});

When('I enter the correct answers to the challenge questions', async function () {
    await noticeOfChangePage.enterFirstName();
    await noticeOfChangePage.enterLastName();
});

When(/^I enter the incorrect (firstname|lastname) answer to the challenge questions$/, async function (incorrectAnswer) {
    const incorrectFirstName = (incorrectAnswer === 'firstname');

    if (incorrectFirstName) {
        await noticeOfChangePage.enterIncorrectFirstName();
        await noticeOfChangePage.enterLastName();
    } else {
        await noticeOfChangePage.enterFirstName();
        await noticeOfChangePage.enterIncorrectLastName();
    }
});

When(/^I enter the correct (firstname|lastname) answer to the challenge questions$/, async function (correctAnswer) {
    const correctFirstName = (correctAnswer === 'firstname');

    if (correctFirstName) {
        await noticeOfChangePage.enterFirstName();
    } else {
        await noticeOfChangePage.enterLastName();
    }
});

When('I select all the submit checkboxes', async function () {
    await noticeOfChangePage.checkAffirmationCheckbox();
    await noticeOfChangePage.checkNotifyEveryPartyCheckbox();
});

Then('I confirm the notice of change case is no longer available', async function () {
    await noticeOfChangePage.checkLatestCaseIdIsNotTheSame();
});

Then('I confirm the remove representation case is no longer available', async function () {
    await noticeOfChangePage.checkLatestCaseIdIsNotTheSame();
});

When(/^I get the most recent case id after successful (notice of change|remove represenation)$/, async function (correctEvent) {
    await noticeOfChangeFlow.selectShareCase();
    await noticeOfChangePage.getLatestCaseId();
});

When(/^I get the most recent case id for removing representation$/, async function () {
    await noticeOfChangeFlow.selectShareCase();
    await noticeOfChangePage.getNoticeOfChangeCaseId();
    await noticeOfChangePage.goToLatestCase();
});
