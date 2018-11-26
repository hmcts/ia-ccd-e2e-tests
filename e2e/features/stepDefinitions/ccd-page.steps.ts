import { CcdPage } from '../../pages/ccd.page';
import { Given, Then, When } from 'cucumber';
import { expect } from 'chai';
import { browser } from 'protractor';

const ccdPage = new CcdPage();

Given('I create a new case', async function () {
    await ccdPage.click('Create Case');
    expect(await ccdPage.pageHeadingContains('Create Case')).to.equal(true);
    await ccdPage.click('Start');
});

Then(/I wait for (\d+) seconds?$/, async function (waitDelay) {
    await browser.sleep(waitDelay * 1000);
});

Then(/^I (?:am on|should see) the `?([^`]+)`? page$/, async function (headingText) {
    expect(await ccdPage.pageHeadingContains(headingText)).to.equal(true);
});

Then(/^I should see a notification saying `?([^`]+)`?$/, async function (message) {
    expect(await ccdPage.notificationContains(message)).to.equal(true);
});

Then(/^I should see the username `?([^`]+)`?$/, async function (username) {
    expect(await ccdPage.usernameContains(username)).to.equal(true);
});

Then(/^I (?:should |)(see|not see) the text `?([^`]+)`?$/, async function (seeOrNotSee, text) {
    expect(await ccdPage.tagContains(text)).to.equal(seeOrNotSee === 'see');
});

Then(/^the `?([^`]+)`? button is (enabled|disabled)$/, async function (buttonText, enabledOrDisabled) {
    expect(await ccdPage.isButtonEnabled(buttonText)).to.equal(enabledOrDisabled === 'enabled');
});

Then(/^I should see the `?([^`]+)`? (?:button|link|tab|label)$/, async function (linkText) {
    expect(await ccdPage.linkContains(linkText)).to.equal(true);
});

When(/^I click the `?([^`]+)`? (?:button|link|tab|label)$/, async function (linkText) {
    await ccdPage.click(linkText);
});

Then(/^I should (see|not see) the (?:answer|field) without a label$/, async function (seeOrNotSee) {
    expect(await ccdPage.isFieldDisplayed('')).to.equal(seeOrNotSee === 'see');
});

Then(/^I should (see|not see) the `?([^`]+)`? (?:answer|field)$/, async function (seeOrNotSee, fieldLabel) {
    expect(await ccdPage.isFieldDisplayed(fieldLabel)).to.equal(seeOrNotSee === 'see');
});

Then(/^the `?([^`]+)`? (?:answer|field) should be empty$/, async function (fieldLabel) {
    expect(await ccdPage.isFieldValueDisplayed(fieldLabel, '')).to.equal(true);
});

Then(/^the (?:answer|field) without a label should be empty$/, async function () {
    expect(await ccdPage.isFieldValueDisplayed('', '')).to.equal(true);
});

Then(/^I should see `?([^`]+)`? (in|for) the (?:answer|field) without a label$/,
    async function (
        fieldMatch,
        inOrFor
    ) {
        const isExactMatch = (inOrFor === 'for');

        expect(
            await ccdPage.isFieldValueDisplayed(
                '',
                fieldMatch,
                isExactMatch
            )
        ).to.equal(true);
    });

Then(/^I should see `?([^`]+)`? (in|for) the `?([^`]+)`? (?:answer|field)$/,
    async function (
        fieldMatch,
        inOrFor,
        fieldLabel
    ) {
        const isExactMatch = (inOrFor === 'for');

        expect(
            await ccdPage.isFieldValueDisplayed(
                fieldLabel,
                fieldMatch,
                isExactMatch
            )
        ).to.equal(true);
    });

Then(/^Within the `?([^`]+)`? fieldset, I should see `?([^`]+)`? (in|for) the (?:answer|field) without a label$/,
    async function (
        fieldsetLabel,
        fieldMatch,
        inOrFor
    ) {
        const isExactMatch = (inOrFor === 'for');

        expect(
            await ccdPage.isFieldValueDisplayed(
                '',
                fieldMatch,
                isExactMatch,
                fieldsetLabel
            )
        ).to.equal(true);
    });

Then(/^Within the `?([^`]+)`? fieldset, I should see `?([^`]+)`? (in|for) the `?([^`]+)`? (?:answer|field)$/,
    async function (
        fieldsetLabel,
        fieldMatch,
        inOrFor,
        fieldLabel
    ) {
        const isExactMatch = (inOrFor === 'for');

        expect(
            await ccdPage.isFieldValueDisplayed(
                fieldLabel,
                fieldMatch,
                isExactMatch,
                fieldsetLabel
            )
        ).to.equal(true);
    });

Then(/^Within the `?([^\s`]+)`? `?([^`]+)`? collection item, I should see `?([^`]+)`? (in|for) the (?:answer|field) without a label$/,
    async function (
        collectionItemNumber,
        collectionLabel,
        fieldMatch,
        inOrFor
    ) {
        const isExactMatch = (inOrFor === 'for');

        expect(
            await ccdPage.isFieldValueDisplayed(
                '',
                fieldMatch,
                isExactMatch,
                collectionLabel,
                collectionItemNumber
            )
        ).to.equal(true);
    });

Then(/^Within the `?([^\s`]+)`? `?([^`]+)`? collection item, I should see `?([^`]+)`? (in|for) the `?([^`]+)`? (?:answer|field)$/,
    async function (
        collectionItemNumber,
        collectionLabel,
        fieldMatch,
        inOrFor,
        fieldLabel
    ) {
        const isExactMatch = (inOrFor === 'for');

        expect(
            await ccdPage.isFieldValueDisplayed(
                fieldLabel,
                fieldMatch,
                isExactMatch,
                collectionLabel,
                collectionItemNumber
            )
        ).to.equal(true);
    });
