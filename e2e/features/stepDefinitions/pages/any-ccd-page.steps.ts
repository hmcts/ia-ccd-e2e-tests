import { AnyCcdPage } from '../../../pages/any-ccd.page';
import { Given, Then, When } from 'cucumber';
import { expect } from 'chai';

const anyCcdPage = new AnyCcdPage();

Given('I create a new case', {timeout: 60 * 1000}, async function () {
    await anyCcdPage.click('Create new case');
    expect(await anyCcdPage.pageHeadingContains('Create Case')).to.equal(true);
    await anyCcdPage.click('Start');
});

When(/^I click the (.+) (?:button|link|tab)$/, {timeout: 30 * 1000}, async function (linkText) {
    await anyCcdPage.click(linkText);
});

Then(/^I should see the (.+) (?:button|link|tab)$/, async function (linkText) {
    expect(await anyCcdPage.linkContains(linkText)).to.equal(true);
});

Then(/^I should see (.+) for the (.+) field$/, async function (fieldValue, fieldLabel) {
    expect(await anyCcdPage.isFieldValueDisplayed(fieldLabel, fieldValue)).to.equal(true);
});

Then(/^I should not see the (.+) field$/, async function (fieldLabel) {
    expect(await anyCcdPage.isFieldDisplayed(fieldLabel)).to.equal(false);
});

Then(/^I (?:am on|should see) the (.+) page$/, async function (headingText) {
    expect(await anyCcdPage.pageHeadingContains(headingText)).to.equal(true);
});

Then(/^I should see the username (.+)$/, async function (username) {
    expect(await anyCcdPage.usernameContains(username)).to.equal(true);
});
