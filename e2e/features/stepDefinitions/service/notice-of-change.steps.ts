import { Then, When } from 'cucumber';
import { NoticeOfChangePage } from '../../../pages/notice-of-change.page';

const noticeOfChangePage = new NoticeOfChangePage();

When(/^I get the most recent case id for the notice of change case$/, async function () {
  await noticeOfChangePage.getLatestCaseIdFromUrl();
});

When('I enter the latest case id for the online case reference number', async function () {
  await noticeOfChangePage.enterCaseId();
});

When('I enter the correct answers to the challenge questions', async function () {
  await noticeOfChangePage.enterFirstName();
  await noticeOfChangePage.enterLastName();
});

When(/^I enter the incorrect (firstname|lastname) answer to the challenge questions$/, async function (incorrectAnswer) {
  const incorrectFirstName = incorrectAnswer === 'firstname';

  if (incorrectFirstName) {
    await noticeOfChangePage.enterIncorrectFirstName();
    await noticeOfChangePage.enterLastName();
  } else {
    await noticeOfChangePage.enterFirstName();
    await noticeOfChangePage.enterIncorrectLastName();
  }
});

When(/^I enter the correct (firstname|lastname) answer to the challenge questions$/, async function (correctAnswer) {
  const correctFirstName = correctAnswer === 'firstname';

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

Then('I enter the removed case id in the url', async function () {
  await noticeOfChangePage.goToRemovedCase();
});

Then('I should be redirected to the No results found page', async function () {
  await noticeOfChangePage.checkCaseRemoved();
});

When(/^I get the most recent case id for removing representation$/, async function () {
  await noticeOfChangePage.getLatestCaseIdFromUrl();
});

When(/^I set the case role id field$/, async function () {
  await noticeOfChangePage.setCaseRoleId();
});

When(/^I get the bails online case reference$/, async function () {
  await noticeOfChangePage.getLatestCaseIdFromUrl();
});

When('I filter by the bails online case reference', async function () {
  await noticeOfChangePage.filterBailsByCaseId();
});

When('I enter the bails online case reference for the online case reference number', async function () {
  await noticeOfChangePage.enterCaseId();
});

When('I enter the correct answers to the challenge questions for bails', async function () {
  await noticeOfChangePage.enterBailsFirstName();
  await noticeOfChangePage.enterBailsLastName();
  await noticeOfChangePage.enterBailsDateOfBirth();
});

When(/^I enter the incorrect (first name|last name|DoB) answer to the challenge questions for bails$/, async function (incorrectAnswer) {
  if (incorrectAnswer === 'first name') {
    await noticeOfChangePage.enterBailsIncorrectFirstName();
    await noticeOfChangePage.enterBailsLastName();
    await noticeOfChangePage.enterBailsDateOfBirth();
  } else if (incorrectAnswer === 'last name') {
    await noticeOfChangePage.enterBailsFirstName();
    await noticeOfChangePage.enterBailsIncorrectLastName();
    await noticeOfChangePage.enterBailsDateOfBirth();
  } else {
    await noticeOfChangePage.enterBailsFirstName();
    await noticeOfChangePage.enterBailsLastName();
    await noticeOfChangePage.enterBailsIncorrectDateOfBirth();
  }
});
