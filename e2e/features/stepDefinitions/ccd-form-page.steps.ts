import { CcdFormPage } from '../../pages/ccd-form.page';
import { Then, When } from '@cucumber/cucumber';
import { expect } from 'chai';

const ccdFormPage = new CcdFormPage();

Then(/^I should see an error saying `?([^`]+)`?$/, async errorMessage => {
  expect(await ccdFormPage.fieldErrorContains(errorMessage)).to.equal(true);
});

Then(/^I should see an error in summary saying `?([^`]+)`?$/, async errorMessage => {
  expect(await ccdFormPage.summaryErrorContains(errorMessage)).to.equal(true);
});

When(/^I should (see|not see) the option `?([^`]+)`? for the `?(first|second|third|)`?\s?field without a label$/, async(seeOrNotSee, option, instanceNumber) => {
  const fieldOptions = await ccdFormPage.getFieldOptions('', instanceNumber);

  expect(fieldOptions.includes(option)).to.equal(seeOrNotSee === 'see');
});

When(/^I should (see|not see) the option `?([^`]+)`? for the `?(first|second|third|)`?\s?`?([^`]+)`? field$/, async(seeOrNotSee, option, instanceNumber, fieldLabel) => {
  const fieldOptions = await ccdFormPage.getFieldOptions(fieldLabel, instanceNumber);

  expect(fieldOptions.includes(option)).to.equal(seeOrNotSee === 'see');
});

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? fieldset, I should (see|not see) the option `?([^`]+)`? for the field without a label$/, async(instanceNumber, fieldsetLabel, seeOrNotSee, option) => {
  const fieldOptions = await ccdFormPage.getFieldOptions('', instanceNumber, fieldsetLabel);

  expect(fieldOptions.includes(option)).to.equal(seeOrNotSee === 'see');
});

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? fieldset, I should (see|not see) the option `?([^`]+)`? for the `?([^`]+)`? field$/, async(instanceNumber, fieldsetLabel, seeOrNotSee, option, fieldLabel) => {
  const fieldOptions = await ccdFormPage.getFieldOptions(fieldLabel, instanceNumber, fieldsetLabel);

  expect(fieldOptions.includes(option)).to.equal(seeOrNotSee === 'see');
});

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? collection's `?([^\s`]+)`? item, I should (see|not see) the option `?([^`]+)`? for the field without a label$/, async(instanceNumber, collectionLabel, collectionItemNumber, seeOrNotSee, option) => {
  const fieldOptions = await ccdFormPage.getFieldOptions('', instanceNumber, collectionLabel, collectionItemNumber);

  expect(fieldOptions.includes(option)).to.equal(seeOrNotSee === 'see');
});

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? collection's `?([^\s`]+)`? item, I should (see|not see) the option `?([^`]+)`? for the `?([^`]+)`? field$/, async(instanceNumber, collectionLabel, collectionItemNumber, seeOrNotSee, option, fieldLabel) => {
  const fieldOptions = await ccdFormPage.getFieldOptions(fieldLabel, instanceNumber, collectionLabel, collectionItemNumber);

  expect(fieldOptions.includes(option)).to.equal(seeOrNotSee === 'see');
});

When(/^I add (?:an|another) item to the `?(first|second|third|)`?\s?`?([^`]+)`? collection$/, async(instanceNumber, collectionLabel) => {
  await ccdFormPage.addCollectionItem(collectionLabel, instanceNumber);
});

When(/^I remove the `?([^\s`]+)`? item from the `?(first|second|third|)`?\s?`?([^`]+)`? collection$/, async(collectionItemNumber, instanceNumber, collectionLabel) => {
  await ccdFormPage.removeCollectionItem(collectionLabel, collectionItemNumber, instanceNumber);
});

When(/^I clear the `?(first|second|third|)`?\s?`?(text|text area|document|)`?\s?field without a label$/, async(instanceNumber, fieldType) => {
  await ccdFormPage.setFieldValue('', '', fieldType, instanceNumber);
});

When(/^I clear the `?(first|second|third|)`?\s?`?([^`]+)`? `?(text|text area|document|)`?\s?field$/, async(instanceNumber, fieldLabel, fieldType) => {
  await ccdFormPage.setFieldValue(fieldLabel, '', fieldType, instanceNumber);
});

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? fieldset, I clear the `?(text|text area|document|)`?\s?field without a label$/, async(instanceNumber, fieldsetLabel, fieldType) => {
  await ccdFormPage.setFieldValue('', '', fieldType, instanceNumber, fieldsetLabel);
});

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? fieldset, I clear the `?([^`]+)`? `?(text|text area|document|)`?\s?field$/, async(instanceNumber, fieldsetLabel, fieldLabel, fieldType) => {
  await ccdFormPage.setFieldValue(fieldLabel, '', fieldType, instanceNumber, fieldsetLabel);
});

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? collection's `?([^\s`]+)`? item, I clear the `?(text|text area|document|)`?\s?field without a label$/, async(instanceNumber, collectionLabel, collectionItemNumber, fieldType) => {
  await ccdFormPage.setFieldValue('', '', fieldType, instanceNumber, collectionLabel, collectionItemNumber);
});

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? collection's `?([^\s`]+)`? item, I clear the `?([^`]+)`? `?(text|text area|document|)`?\s?field$/, async(instanceNumber, collectionLabel, collectionItemNumber, fieldLabel, fieldType) => {
  await ccdFormPage.setFieldValue(fieldLabel, '', fieldType, instanceNumber, collectionLabel, collectionItemNumber);
});

When(/^I (?:check|choose|select|toggle|type|upload) `?([^`]+)`? (?:for|from) the `?(first|second|third|)`?\s?`?(text|text area|document|)`?\s?field without a label$/, async(fieldValue, instanceNumber, fieldType) => {
  await ccdFormPage.setFieldValue('', fieldValue, fieldType, instanceNumber);
});

When(/^I upload the `?([^`]+)`? document/, async fileName => {
  await ccdFormPage.uploadFile(fileName, 0);
});

When(/^I (?:check|choose|select|toggle|type|upload) `?([^`]+)`? (?:for|from) the `?(first|second|third|)`?\s?`?([^`]+)`? `?(text|text area|document|email|)`?\s?field$/, async(fieldValue, instanceNumber, fieldLabel, fieldType) => {
  await ccdFormPage.setFieldValue(fieldLabel, fieldValue, fieldType, instanceNumber);
});

When(/^I type `?([^`]+)`? (?:for|from) the field with ID `?([^`]+)`?$/, async(fieldValue, fieldID) => {
  await ccdFormPage.typeText(fieldID, fieldValue);
});

When(/^I click the element with ID `?([^`]+)`?$/, async fieldID => {
  await ccdFormPage.clickElement(fieldID);
});

When(/^I hit Enter in the field with ID `?([^`]+)`?$/, async fieldID => {
  await ccdFormPage.typeEnter(fieldID);
});

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? fieldset, I (?:check|choose|select|toggle|type|upload) `?([^`]+)`? (?:for|from) the `?(text|text area|document|)`?\s?field without a label$/, async(instanceNumber, fieldsetLabel, fieldValue, fieldType) => {
  await ccdFormPage.setFieldValue('', fieldValue, fieldType, instanceNumber, fieldsetLabel);
});

When(/^within the `?(first|second|third|)`?\s?`?([^`]+)`? fieldset, I (?:check|choose|select|toggle|type|upload) `?([^`]+)`? (?:for|from) the `?([^`]+)`? `?(text|text area|document|)`?\s?field$/, async(instanceNumber, fieldsetLabel, fieldValue, fieldLabel, fieldType) => {
  await ccdFormPage.setFieldValue(fieldLabel, fieldValue, fieldType, instanceNumber, fieldsetLabel);
});

When(
  /^within the `?(first|second|third|)`?\s?`?([^`]+)`? collection's `?([^\s`]+)`? item, I (?:check|choose|select|toggle|type|upload) `?([^`]+)`? (?:for|from) the `?(text|text area|document|)`?\s?field without a label$/,
  async(instanceNumber, collectionLabel, collectionItemNumber, fieldValue, fieldType) => {
    await ccdFormPage.setFieldValue('', fieldValue, fieldType, instanceNumber, collectionLabel, collectionItemNumber);
  }
);

When(
  /^within the `?(first|second|third|)`?\s?`?([^`]+)`? collection's `?([^\s`]+)`? item, I (?:check|choose|select|toggle|type|upload) `?([^`]+)`? (?:for|from) the `?([^`]+)`? `?(text|text area|document|)`?\s?field$/,
  async(instanceNumber, collectionLabel, collectionItemNumber, fieldValue, fieldLabel, fieldType) => {
    await ccdFormPage.setFieldValue(fieldLabel, fieldValue, fieldType, instanceNumber, collectionLabel, collectionItemNumber);
  }
);

When(/^I validate the options displayed for `?([^`]+)`? field/, async(heading, datatable) => {
  const datatableHashes = datatable.hashes();
  for (const tableHash of datatableHashes) {
    const xpath = `//label[contains(text(), "${tableHash.options}")]`;
    await ccdFormPage.verifyVisibleByXpath(xpath);
  }
});
