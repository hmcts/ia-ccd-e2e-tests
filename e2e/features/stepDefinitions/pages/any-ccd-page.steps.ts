import { AnyCcdPage } from '../../../pages/any-ccd.page';
import { Then, When } from 'cucumber';
import { expect } from 'chai';

const anyCcdPage = new AnyCcdPage();

When(/^I click the (.+) (?:button|link|tab)$/, {timeout: 30 * 1000}, async function (linkText) {
    await anyCcdPage.click(linkText);
});

Then(/^I (?:am on|should see) the (.+) page$/, async function (headingText) {
    expect(await anyCcdPage.pageHeadingContains(headingText)).to.equal(true);
});

Then(/^I should see the username (.+)$/, async function (username) {
    expect(await anyCcdPage.usernameContains(username)).to.equal(true);
});
