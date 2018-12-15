import { CcdPage } from '../../pages/ccd.page';
import { Given, Then, When } from 'cucumber';
import { expect } from 'chai';
import { browser } from 'protractor';

const ccdPage = new CcdPage();

Given('I create a new case', async function () {
    await ccdPage.click('Create Case');
    expect(await ccdPage.headingContains('Create Case')).to.equal(true);
    await ccdPage.click('Start');
});

Then(/^The (.+) field should contain a value of length (\d+)$/, async function (fieldLabel, fieldValueSize) {
    expect(await ccdPage.isFieldValueCorrectLength(fieldLabel, fieldValueSize)).to.equal(true);
});

Then(/I wait for (\d+) seconds?$/, async function (waitDelay) {
    await browser.sleep(waitDelay * 1000);
});

Then(/^I should see `?([^`]+)`? in the url$/, async function (urlText) {
    expect(await ccdPage.urlContains(urlText)).to.equal(true);
});

Then(/^I (?:am on|should see) the `?([^`]+)`? page$/, async function (headingText) {
    expect(await ccdPage.headingContains(headingText)).to.equal(true);
});

Then(/^I should see a notification saying `?([^`]+)`?$/, async function (message) {
    expect(await ccdPage.notificationContains(message)).to.equal(true);
});

Then(/^I should see the username `?([^`]+)`?$/, async function (username) {
    expect(await ccdPage.usernameContains(username)).to.equal(true);
});

Then(/^I (?:should |)(see|not see) the image `?([^`]+)`?$/, async function (seeOrNotSee, match) {
    const shortWait = (seeOrNotSee === 'not see');
    expect(await ccdPage.imgSrcContains(match, shortWait)).to.equal(seeOrNotSee === 'see');
});

Then(/^I (?:should |)(see|not see) the text `?([^`]+)`?$/, async function (seeOrNotSee, match) {
    const shortWait = (seeOrNotSee === 'not see');
    expect(await ccdPage.contentContains(match, shortWait)).to.equal(seeOrNotSee === 'see');
});

Then(/^I (?:should |)(see|not see) the `?([^`]+)`? (?:button|link|tab|label)$/, async function (seeOrNotSee, linkText) {
    const shortWait = (seeOrNotSee === 'not see');
    expect(await ccdPage.linkContains(linkText, shortWait)).to.equal(seeOrNotSee === 'see');
});

Then(/^the `?([^`]+)`? button is (?:still |)(enabled|disabled)$/, async function (buttonText, enabledOrDisabled) {
    expect(await ccdPage.isButtonEnabled(buttonText)).to.equal(enabledOrDisabled === 'enabled');
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
