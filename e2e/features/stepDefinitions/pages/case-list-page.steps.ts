import { AnyCcdPage } from '../../../pages/any-ccd.page';
import { Then, When } from 'cucumber';
import { expect } from 'chai';

const anyCcdPage = new AnyCcdPage();

When('I go to the Case List', async function () {
    await anyCcdPage.get('/list/case');
});

When('I attempt to go to the Case List', async function () {
    await anyCcdPage.getWithoutWaitingForAngular('/list/case');
});

Then(/^I should see a notification saying (.+)$/, async function (message) {
    expect(await anyCcdPage.notificationContains(message)).to.equal(true);
});
