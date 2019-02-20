import { CcdFormPage } from '../../pages/ccd-form.page';
import { Then, When } from 'cucumber';
import { expect } from 'chai';

const ccdFormPage = new CcdFormPage();

Then(/^I should see an error saying `?([^`]+)`?$/, async function (errorMessage) {
    expect(await ccdFormPage.fieldErrorContains(errorMessage)).to.equal(true);
});

When(/^I should (see|not see) the option `?([^`]+)`? for the `?(first|second|third|)`?\s?field without a label$/,
    async function (
        seeOrNotSee,
        option,
        instanceNumber
    ) {
        const fieldOptions = await ccdFormPage.getFieldOptions(
            '',
            instanceNumber
        );

        expect(fieldOptions.includes(option)).to.equal(seeOrNotSee === 'see');
    });

When(/^I should (see|not see) the option `?([^`]+)`? for the `?(first|second|third|)`?\s?`?([^`]+)`? field$/,
    async function (
        seeOrNotSee,
        option,
        instanceNumber,
        fieldLabel
    ) {
        const fieldOptions = await ccdFormPage.getFieldOptions(
            fieldLabel,
            instanceNumber
        );

        expect(fieldOptions.includes(option)).to.equal(seeOrNotSee === 'see');
    });

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? fieldset, I should (see|not see) the option `?([^`]+)`? for the field without a label$/,
    async function (
        instanceNumber,
        fieldsetLabel,
        seeOrNotSee,
        option
    ) {
        const fieldOptions = await ccdFormPage.getFieldOptions(
            '',
            instanceNumber,
            fieldsetLabel
        );

        expect(fieldOptions.includes(option)).to.equal(seeOrNotSee === 'see');
    });

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? fieldset, I should (see|not see) the option `?([^`]+)`? for the `?([^`]+)`? field$/,
    async function (
        instanceNumber,
        fieldsetLabel,
        seeOrNotSee,
        option,
        fieldLabel
    ) {
        const fieldOptions = await ccdFormPage.getFieldOptions(
            fieldLabel,
            instanceNumber,
            fieldsetLabel
        );

        expect(fieldOptions.includes(option)).to.equal(seeOrNotSee === 'see');
    });

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? collection's `?([^\s`]+)`? item, I should (see|not see) the option `?([^`]+)`? for the field without a label$/,
    async function (
        instanceNumber,
        collectionLabel,
        collectionItemNumber,
        seeOrNotSee,
        option
    ) {
        const fieldOptions = await ccdFormPage.getFieldOptions(
            '',
            instanceNumber,
            collectionLabel,
            collectionItemNumber
        );

        expect(fieldOptions.includes(option)).to.equal(seeOrNotSee === 'see');
    });

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? collection's `?([^\s`]+)`? item, I should (see|not see) the option `?([^`]+)`? for the `?([^`]+)`? field$/,
    async function (
        instanceNumber,
        collectionLabel,
        collectionItemNumber,
        seeOrNotSee,
        option,
        fieldLabel
    ) {
        const fieldOptions = await ccdFormPage.getFieldOptions(
            fieldLabel,
            instanceNumber,
            collectionLabel,
            collectionItemNumber
        );

        expect(fieldOptions.includes(option)).to.equal(seeOrNotSee === 'see');
    });

When(/^I add (?:an|another) item to the `?(first|second|third|)`?\s?`?([^`]+)`? collection$/,
    async function (
        instanceNumber,
        collectionLabel
    ) {
        await ccdFormPage.addCollectionItem(collectionLabel, instanceNumber);
    });

When(/^I remove the `?([^\s`]+)`? item from the `?(first|second|third|)`?\s?`?([^`]+)`? collection$/,
    async function (
        collectionItemNumber,
        instanceNumber,
        collectionLabel
    ) {
        await ccdFormPage.removeCollectionItem(collectionLabel, collectionItemNumber, instanceNumber);
    });

When(/^I clear the `?(first|second|third|)`?\s?field without a label$/,
    async function (
        instanceNumber
    ) {
        await ccdFormPage.setFieldValue('', '', instanceNumber);
    });

When(/^I clear the `?(first|second|third|)`?\s?`?([^`]+)`? field$/,
    async function (
        instanceNumber,
        fieldLabel
    ) {
        await ccdFormPage.setFieldValue(fieldLabel, '', instanceNumber);
    });

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? fieldset, I clear the field without a label$/,
    async function (
        instanceNumber,
        fieldsetLabel
    ) {
        await ccdFormPage.setFieldValue(
            '',
            '',
            instanceNumber,
            fieldsetLabel
        );
    });

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? fieldset, I clear the `?([^`]+)`? field$/,
    async function (
        instanceNumber,
        fieldsetLabel,
        fieldLabel
    ) {
        await ccdFormPage.setFieldValue(
            fieldLabel,
            '',
            instanceNumber,
            fieldsetLabel
        );
    });

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? collection's `?([^\s`]+)`? item, I clear the field without a label$/,
    async function (
        instanceNumber,
        collectionLabel,
        collectionItemNumber
    ) {
        await ccdFormPage.setFieldValue(
            '',
            '',
            instanceNumber,
            collectionLabel,
            collectionItemNumber
        );
    });

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? collection's `?([^\s`]+)`? item, I clear the `?([^`]+)`? field$/,
    async function (
        instanceNumber,
        collectionLabel,
        collectionItemNumber,
        fieldLabel
    ) {
        await ccdFormPage.setFieldValue(
            fieldLabel,
            '',
            instanceNumber,
            collectionLabel,
            collectionItemNumber
        );
    });

When(/^I (check|choose|select|toggle|type|upload) `?([^`]+)`? (?:for|from) the `?(first|second|third|)`?\s?field without a label$/,
    async function (
        fieldValue,
        instanceNumber
    ) {
        await ccdFormPage.setFieldValue(
            '',
            fieldValue,
            instanceNumber
        );
    });

When(/^I (?:check|choose|select|toggle|type|upload) `?([^`]+)`? (?:for|from) the `?(first|second|third|)`?\s?`?([^`]+)`? field$/,
    async function (
        fieldValue,
        instanceNumber,
        fieldLabel
    ) {
        await ccdFormPage.setFieldValue(
            fieldLabel,
            fieldValue,
            instanceNumber
        );
    });

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? fieldset, I (?:check|choose|select|toggle|type|upload) `?([^`]+)`? (?:for|from) the field without a label$/,
    async function (
        instanceNumber,
        fieldsetLabel,
        fieldValue
    ) {
        await ccdFormPage.setFieldValue(
            '',
            fieldValue,
            instanceNumber,
            fieldsetLabel
        );
    });

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? fieldset, I (?:check|choose|select|toggle|type|upload) `?([^`]+)`? (?:for|from) the `?([^`]+)`? field$/,
    async function (
        instanceNumber,
        fieldsetLabel,
        fieldValue,
        fieldLabel
    ) {
        await ccdFormPage.setFieldValue(
            fieldLabel,
            fieldValue,
            instanceNumber,
            fieldsetLabel
        );
    });

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? collection's `?([^\s`]+)`? item, I (?:check|choose|select|toggle|type|upload) `?([^`]+)`? (?:for|from) the field without a label$/,
    async function (
        instanceNumber,
        collectionLabel,
        collectionItemNumber,
        fieldValue
    ) {
        await ccdFormPage.setFieldValue(
            '',
            fieldValue,
            instanceNumber,
            collectionLabel,
            collectionItemNumber
        );
    });

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? collection's `?([^\s`]+)`? item, I (?:check|choose|select|toggle|type|upload) `?([^`]+)`? (?:for|from) the `?([^`]+)`? field$/,
    async function (
        instanceNumber,
        collectionLabel,
        collectionItemNumber,
        fieldValue,
        fieldLabel
    ) {
        await ccdFormPage.setFieldValue(
            fieldLabel,
            fieldValue,
            instanceNumber,
            collectionLabel,
            collectionItemNumber
        );
    });
