import { CcdPage } from '../../pages/ccd.page';
import { Given, Then, When } from 'cucumber';
import { browser } from 'protractor';
import { expect } from 'chai';

const ccdPage = new CcdPage();

Given('I create a new case', async function () {
    await ccdPage.click('Create Case');
    expect(await ccdPage.headingContains('Create Case')).to.equal(true);
    await ccdPage.isButtonEnabled('Start');
    await ccdPage.click('Start');
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

When(/^I click the `?([^`]+)`? (button|link|tab|label)$/, async function (linkText, clickyThingy) {
    await ccdPage.click(linkText);
});

Then(/^I should (see|not see) the `?(first|second|third|)`?\s?(?:answer|field) without a label$/,
    async function (
        seeOrNotSee,
        instanceNumber
    ) {
        expect(await ccdPage.isFieldDisplayed('', instanceNumber)).to.equal(seeOrNotSee === 'see');
    });

Then(/^I should (see|not see) the `?(first|second|third|)`?\s?`?([^`]+)`? (?:answer|field)$/,
    async function (
        seeOrNotSee,
        instanceNumber,
        fieldLabel
    ) {
        expect(await ccdPage.isFieldDisplayed(fieldLabel, instanceNumber)).to.equal(seeOrNotSee === 'see');
    });

Then(/^the `?(first|second|third|)`?\s?`?([^`]+)`? (?:answer|field) should be empty$/,
    async function (
        instanceNumber,
        fieldLabel
    ) {
        expect(await ccdPage.isFieldValueDisplayed(fieldLabel, '', true, instanceNumber)).to.equal(true);
    });

Then(/^the `?(first|second|third|)`?\s?`?([^`]+)`? (?:answer|field) should be (\d+) characters long$/,
    async function (
        instanceNumber,
        fieldLabel,
        fieldValueSize
    ) {
        expect(await ccdPage.isFieldValueCorrectLength(fieldLabel, fieldValueSize, instanceNumber)).to.equal(true);
    });

Then(/^the `?(first|second|third|)`?\s?(?:answer|field) without a label should be empty$/,
    async function (
        instanceNumber
    ) {
        expect(await ccdPage.isFieldValueDisplayed('', '', true, instanceNumber)).to.equal(true);
    });

Then(/^I should see `?([^`]+)`? (in|for) the `?(first|second|third|)`?\s?(?:answer|field) without a label$/,
    async function (
        fieldMatch,
        inOrFor,
        instanceNumber
    ) {
        const isExactMatch = (inOrFor === 'for');

        expect(
            await ccdPage.isFieldValueDisplayed(
                '',
                fieldMatch,
                isExactMatch,
                instanceNumber
            )
        ).to.equal(true);
    });

Then(/^I should see `?([^`]+)`? (in|for) the `?(first|second|third|)`?\s?`?([^`]+)`? (?:answer|field)$/,
    async function (
        fieldMatch,
        inOrFor,
        instanceNumber,
        fieldLabel
    ) {
        const isExactMatch = (inOrFor === 'for');

        expect(
            await ccdPage.isFieldValueDisplayed(
                fieldLabel,
                fieldMatch,
                isExactMatch,
                instanceNumber
            )
        ).to.equal(true);
    });

Then(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? fieldset, I should see `?([^`]+)`? (in|for) the (?:answer|field) without a label$/,
    async function (
        instanceNumber,
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
                instanceNumber,
                fieldsetLabel
            )
        ).to.equal(true);
    });

Then(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? fieldset, I should see `?([^`]+)`? (in|for) the `?([^`]+)`? (?:answer|field)$/,
    async function (
        instanceNumber,
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
                instanceNumber,
                fieldsetLabel
            )
        ).to.equal(true);
    });

Then(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? collection's `?([^\s`]+)`? item, I should see `?([^`]+)`? (in|for) the (?:answer|field) without a label$/,
    async function (
        instanceNumber,
        collectionLabel,
        collectionItemNumber,
        fieldMatch,
        inOrFor
    ) {
        const isExactMatch = (inOrFor === 'for');

        expect(
            await ccdPage.isFieldValueDisplayed(
                '',
                fieldMatch,
                isExactMatch,
                instanceNumber,
                collectionLabel,
                collectionItemNumber
            )
        ).to.equal(true);
    });

Then(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? collection's `?([^\s`]+)`? item, I should see `?([^`]+)`? (in|for) the `?([^`]+)`? (?:answer|field)$/,
    async function (
        instanceNumber,
        collectionLabel,
        collectionItemNumber,
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
                instanceNumber,
                collectionLabel,
                collectionItemNumber
            )
        ).to.equal(true);
    });
