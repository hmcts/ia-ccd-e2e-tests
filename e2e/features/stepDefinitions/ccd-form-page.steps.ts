import { CcdFormPage } from '../../pages/ccd-form.page';
import { Then, When } from 'cucumber';
import { expect } from 'chai';

const ccdFormPage = new CcdFormPage();

Then(/^I should see an error saying `?([^`]+)`?$/, async function (errorMessage) {
    expect(await ccdFormPage.fieldErrorContains(errorMessage)).to.equal(true);
});

When(/^I add (?:an|another) item to the `?([^`]+)`? collection$/, async function (collectionLabel) {
    await ccdFormPage.addCollectionItem(collectionLabel);
});

When(/^I remove the `?([^\s`]+)`? item from the `?([^`]+)`? collection$/, async function (
    collectionItemNumber,
    collectionLabel
) {
    await ccdFormPage.removeCollectionItem(collectionLabel, collectionItemNumber);
});

When(/^I clear the field without a label$/, async function () {
    await ccdFormPage.setFieldValue('', '');
});

When(/^I clear the `?([^`]+)`? field$/, async function (fieldLabel) {
    await ccdFormPage.setFieldValue(fieldLabel, '');
});

When(/^Within the `?([^`]+)`? fieldset, I clear the field without a label$/,
    async function (
        fieldsetLabel
    ) {
        await ccdFormPage.setFieldValue(
            '',
            '',
            fieldsetLabel
        );
    });

When(/^Within the `?([^`]+)`? fieldset, I clear the `?([^`]+)`? field$/,
    async function (
        fieldsetLabel,
        fieldLabel
    ) {
        await ccdFormPage.setFieldValue(
            fieldLabel,
            '',
            fieldsetLabel
        );
    });

When(/^Within the `?([^\s`]+)`? `?([^`]+)`? collection item, I clear the field without a label$/,
    async function (
        collectionItemNumber,
        collectionLabel
    ) {
        await ccdFormPage.setFieldValue(
            '',
            '',
            collectionLabel,
            collectionItemNumber
        );
    });

When(/^Within the `?([^\s`]+)`? `?([^`]+)`? collection item, I clear the `?([^`]+)`? field$/,
    async function (
        collectionItemNumber,
        collectionLabel,
        fieldLabel
    ) {
        await ccdFormPage.setFieldValue(
            fieldLabel,
            '',
            collectionLabel,
            collectionItemNumber
        );
    });

When(/^I (check|choose|select|toggle|type|upload) `?([^`]+)`? (?:for|from) the field without a label$/,
    async function (
        fieldValue
    ) {
        await ccdFormPage.setFieldValue(
            '',
            fieldValue
        );
    });

When(/^I (?:check|choose|select|toggle|type|upload) `?([^`]+)`? (?:for|from) the `?([^`]+)`? field$/,
    async function (
        fieldValue,
        fieldLabel
    ) {
        await ccdFormPage.setFieldValue(
            fieldLabel,
            fieldValue
        );
    });

When(/^Within the `?([^`]+)`? fieldset, I (?:check|choose|select|toggle|type|upload) `?([^`]+)`? (?:for|from) the field without a label$/,
    async function (
        fieldsetLabel,
        fieldValue
    ) {
        await ccdFormPage.setFieldValue(
            '',
            fieldValue,
            fieldsetLabel
        );
    });

When(/^Within the `?([^`]+)`? fieldset, I (?:check|choose|select|toggle|type|upload) `?([^`]+)`? (?:for|from) the `?([^`]+)`? field$/,
    async function (
        fieldsetLabel,
        fieldValue,
        fieldLabel
    ) {
        await ccdFormPage.setFieldValue(
            fieldLabel,
            fieldValue,
            fieldsetLabel
        );
    });

When(/^Within the `?([^\s`]+)`? `?([^`]+)`? collection item, I (?:check|choose|select|toggle|type|upload) `?([^`]+)`? (?:for|from) the field without a label$/,
    async function (
        collectionItemNumber,
        collectionLabel,
        fieldValue
    ) {
        await ccdFormPage.setFieldValue(
            '',
            fieldValue,
            collectionLabel,
            collectionItemNumber
        );
    });

When(/^Within the `?([^\s`]+)`? `?([^`]+)`? collection item, I (?:check|choose|select|toggle|type|upload) `?([^`]+)`? (?:for|from) the `?([^`]+)`? field$/,
    async function (
        collectionItemNumber,
        collectionLabel,
        fieldValue,
        fieldLabel
    ) {
        await ccdFormPage.setFieldValue(
            fieldLabel,
            fieldValue,
            collectionLabel,
            collectionItemNumber
        );
    });
