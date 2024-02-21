import { ShareCasePage } from '../../pages/share-case.page';
import { Then, When } from '@cucumber/cucumber';

const shareCasePage = new ShareCasePage();

let expect = require('chai').expect

When('I enter text {string} in user email in share case page', async function (text) {
    await shareCasePage.enterUserEmailToSelect(text);
});

Then('I see a list of users filtered containing text {string}', async function (text) {
    let userEmails = await shareCasePage.getFilteredUserNameEmails();
    for (let i = 0; i < userEmails.length; i++) {
        expect(userEmails[i]).to.contain(text);
    }
});

When('I select a listed user not shared with in the share case page', async function () {
    await shareCasePage.selectUserWithEmailNotSharedWithAtLeastOneCase();
});

When('I click Add user button in share case page', async function () {
    await shareCasePage.clickAddUserbutton();
});

When('I click continue in share case page', async function () {
    await shareCasePage.clickContinueButton();
});

When('I get the case id to be shared', async function () {
    await shareCasePage.getCaseIdToBeShared();
});

When('I get the shared case id', async function () {
    await shareCasePage.getSharedCaseId();
});

When('I confirm the case has the same case id as the shared case', async function () {
    await shareCasePage.checkSharedCaseIdIsTheSame();
});
