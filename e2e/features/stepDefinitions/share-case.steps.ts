import { ShareCasePage } from '../../pages/share-case.page';
import { Then, When } from '@cucumber/cucumber';

const shareCasePage = new ShareCasePage();

const expect = require('chai').expect;

When('I enter text {string} in user email in share case page', async text => {
  await shareCasePage.enterUserEmailToSelect(text);
});

Then('I see a list of users filtered containing text {string}', async text => {
  const userEmails = await shareCasePage.getFilteredUserNameEmails();
  for (let i = 0; i < userEmails.length; i++) {
    expect(userEmails[i]).to.contain(text);
  }
});

When('I select a listed user not shared with in the share case page', async() => {
  await shareCasePage.selectUserWithEmailNotSharedWithAtLeastOneCase();
});

When('I click Add user button in share case page', async() => {
  await shareCasePage.clickAddUserbutton();
});

When('I click continue in share case page', async() => {
  await shareCasePage.clickContinueButton();
});

When('I get the case id to be shared', async() => {
  await shareCasePage.getCaseIdToBeShared();
});

When('I get the shared case id', async() => {
  await shareCasePage.getSharedCaseId();
});

When('I confirm the case has the same case id as the shared case', async() => {
  shareCasePage.checkSharedCaseIdIsTheSame();
});
