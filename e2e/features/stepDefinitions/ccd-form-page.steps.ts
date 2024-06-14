import { CcdFormPage } from '../../pages/ccd-form.page';
import { Then, When } from 'cucumber';
import { expect } from 'chai';

const ccdFormPage = new CcdFormPage();

// tslint:disable:max-line-length

Then(/^I should see an error saying `?([^`]+)`?$/, async function (errorMessage) {
  expect(await ccdFormPage.fieldErrorContains(errorMessage)).to.equal(true);
});

Then(/^I should see an error in summary saying `?([^`]+)`?$/, async function (errorMessage) {
  expect(await ccdFormPage.summaryErrorContains(errorMessage)).to.equal(true);
});

When(/^I should (see|not see) the option `?([^`]+)`? for the `?(first|second|third|)`?\s?field without a label$/, async function (seeOrNotSee, option, instanceNumber) {
  const fieldOptions = await ccdFormPage.getFieldOptions('', instanceNumber);

  expect(fieldOptions.includes(option)).to.equal(seeOrNotSee === 'see');
});

When(/^I should (see|not see) the option `?([^`]+)`? for the `?(first|second|third|)`?\s?`?([^`]+)`? field$/, async function (seeOrNotSee, option, instanceNumber, fieldLabel) {
  const fieldOptions = await ccdFormPage.getFieldOptions(fieldLabel, instanceNumber);

  expect(fieldOptions.includes(option)).to.equal(seeOrNotSee === 'see');
});

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? fieldset, I should (see|not see) the option `?([^`]+)`? for the field without a label$/, async function (instanceNumber, fieldsetLabel, seeOrNotSee, option) {
  const fieldOptions = await ccdFormPage.getFieldOptions('', instanceNumber, fieldsetLabel);

  expect(fieldOptions.includes(option)).to.equal(seeOrNotSee === 'see');
});

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? fieldset, I should (see|not see) the option `?([^`]+)`? for the `?([^`]+)`? field$/, async function (instanceNumber, fieldsetLabel, seeOrNotSee, option, fieldLabel) {
  const fieldOptions = await ccdFormPage.getFieldOptions(fieldLabel, instanceNumber, fieldsetLabel);

  expect(fieldOptions.includes(option)).to.equal(seeOrNotSee === 'see');
});

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? collection's `?([^\s`]+)`? item, I should (see|not see) the option `?([^`]+)`? for the field without a label$/, async function (instanceNumber, collectionLabel, collectionItemNumber, seeOrNotSee, option) {
  const fieldOptions = await ccdFormPage.getFieldOptions('', instanceNumber, collectionLabel, collectionItemNumber);

  expect(fieldOptions.includes(option)).to.equal(seeOrNotSee === 'see');
});

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? collection's `?([^\s`]+)`? item, I should (see|not see) the option `?([^`]+)`? for the `?([^`]+)`? field$/, async function (instanceNumber, collectionLabel, collectionItemNumber, seeOrNotSee, option, fieldLabel) {
  const fieldOptions = await ccdFormPage.getFieldOptions(fieldLabel, instanceNumber, collectionLabel, collectionItemNumber);

  expect(fieldOptions.includes(option)).to.equal(seeOrNotSee === 'see');
});

When(/^I add (?:an|another) item to the `?(first|second|third|)`?\s?`?([^`]+)`? collection$/, async function (instanceNumber, collectionLabel) {
  await ccdFormPage.addCollectionItem(collectionLabel, instanceNumber);
});

When(/^I remove the `?([^\s`]+)`? item from the `?(first|second|third|)`?\s?`?([^`]+)`? collection$/, async function (collectionItemNumber, instanceNumber, collectionLabel) {
  await ccdFormPage.removeCollectionItem(collectionLabel, collectionItemNumber, instanceNumber);
});

When(/^I clear the `?(first|second|third|)`?\s?`?(text|text area|document|)`?\s?field without a label$/, async function (instanceNumber, fieldType) {
  await ccdFormPage.setFieldValue('', '', fieldType, instanceNumber);
});

When(/^I clear the `?(first|second|third|)`?\s?`?([^`]+)`? `?(text|text area|document|)`?\s?field$/, async function (instanceNumber, fieldLabel, fieldType) {
  await ccdFormPage.setFieldValue(fieldLabel, '', fieldType, instanceNumber);
});

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? fieldset, I clear the `?(text|text area|document|)`?\s?field without a label$/, async function (instanceNumber, fieldsetLabel, fieldType) {
  await ccdFormPage.setFieldValue('', '', fieldType, instanceNumber, fieldsetLabel);
});

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? fieldset, I clear the `?([^`]+)`? `?(text|text area|document|)`?\s?field$/, async function (instanceNumber, fieldsetLabel, fieldLabel, fieldType) {
  await ccdFormPage.setFieldValue(fieldLabel, '', fieldType, instanceNumber, fieldsetLabel);
});

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? collection's `?([^\s`]+)`? item, I clear the `?(text|text area|document|)`?\s?field without a label$/, async function (instanceNumber, collectionLabel, collectionItemNumber, fieldType) {
  await ccdFormPage.setFieldValue('', '', fieldType, instanceNumber, collectionLabel, collectionItemNumber);
});

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? collection's `?([^\s`]+)`? item, I clear the `?([^`]+)`? `?(text|text area|document|)`?\s?field$/, async function (instanceNumber, collectionLabel, collectionItemNumber, fieldLabel, fieldType) {
  await ccdFormPage.setFieldValue(fieldLabel, '', fieldType, instanceNumber, collectionLabel, collectionItemNumber);
});

When(/^I (?:check|choose|select|toggle|type|upload) `?([^`]+)`? (?:for|from) the `?(first|second|third|)`?\s?`?(text|text area|document|)`?\s?field without a label$/, async function (fieldValue, instanceNumber, fieldType) {
  await ccdFormPage.setFieldValue('', fieldValue, fieldType, instanceNumber);
});

When(/^I (?:check|choose|select|toggle|type|upload) `?([^`]+)`? (?:for|from) the `?(first|second|third|)`?\s?`?([^`]+)`? `?(text|text area|document|email|)`?\s?field$/, async function (fieldValue, instanceNumber, fieldLabel, fieldType) {
  await ccdFormPage.setFieldValue(fieldLabel, fieldValue, fieldType, instanceNumber);
});

When(/^I type `?([^`]+)`? (?:for|from) the field with ID `?([^`]+)`?$/, async function (fieldValue, fieldID) {
  await ccdFormPage.typeText(fieldID, fieldValue);
});

When(/^I click the element with ID `?([^`]+)`?$/, async function (fieldID) {
  await ccdFormPage.clickElement(fieldID);
});

When(/^I hit Enter in the field with ID `?([^`]+)`?$/, async function (fieldID) {
  await ccdFormPage.typeEnter(fieldID);
});

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? fieldset, I (?:check|choose|select|toggle|type|upload) `?([^`]+)`? (?:for|from) the `?(text|text area|document|)`?\s?field without a label$/, async function (instanceNumber, fieldsetLabel, fieldValue, fieldType) {
  await ccdFormPage.setFieldValue('', fieldValue, fieldType, instanceNumber, fieldsetLabel);
});

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? fieldset, I (?:check|choose|select|toggle|type|upload) `?([^`]+)`? (?:for|from) the `?([^`]+)`? `?(text|text area|document|)`?\s?field$/, async function (instanceNumber, fieldsetLabel, fieldValue, fieldLabel, fieldType) {
  await ccdFormPage.setFieldValue(fieldLabel, fieldValue, fieldType, instanceNumber, fieldsetLabel);
});

When(
  /^within the `?(first|second|third|)`?\s?`?([^`]+)`? collection's `?([^\s`]+)`? item, I (?:check|choose|select|toggle|type|upload) `?([^`]+)`? (?:for|from) the `?(text|text area|document|)`?\s?field without a label$/,
  async function (instanceNumber, collectionLabel, collectionItemNumber, fieldValue, fieldType) {
    await ccdFormPage.setFieldValue('', fieldValue, fieldType, instanceNumber, collectionLabel, collectionItemNumber);
  },
);

When(
  /^within the `?(first|second|third|)`?\s?`?([^`]+)`? collection's `?([^\s`]+)`? item, I (?:check|choose|select|toggle|type|upload) `?([^`]+)`? (?:for|from) the `?([^`]+)`? `?(text|text area|document|)`?\s?field$/,
  async function (instanceNumber, collectionLabel, collectionItemNumber, fieldValue, fieldLabel, fieldType) {
    await ccdFormPage.setFieldValue(fieldLabel, fieldValue, fieldType, instanceNumber, collectionLabel, collectionItemNumber);
  },
);

When(/^I validate the options displayed for `?([^`]+)`? field/, async function (heading, datatable) {
  const datatableHashes = datatable.hashes();
  const fieldOptions = await ccdFormPage.getFieldOptions(heading);
  for (const tableHash of datatableHashes) {
    const column = tableHash.options;
    expect(fieldOptions).to.include(column);
  }
});

// tslint:enable:max-line-length
