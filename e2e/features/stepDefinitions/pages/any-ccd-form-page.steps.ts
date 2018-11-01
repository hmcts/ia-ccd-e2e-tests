import { AnyCcdFormPage } from '../../../pages/any-ccd-form.page';
import { Given, Then, When } from 'cucumber';
import { expect } from 'chai';

const anyCcdFormPage = new AnyCcdFormPage();

Given('I complete the Home Office reference page', {timeout: 60 * 1000}, async function () {
    expect(await anyCcdFormPage.pageHeadingContains('Home Office reference')).to.equal(true);
    await anyCcdFormPage.setFieldValue('Home Office reference number', 'A1234567/001');
    await anyCcdFormPage.setFieldValue('Date on the decision letter', '31 10 2018');
    await anyCcdFormPage.click('Continue');
});

Given('I complete the Basic details page', {timeout: 60 * 1000}, async function () {
    expect(await anyCcdFormPage.pageHeadingContains('Basic details')).to.equal(true);
    await anyCcdFormPage.setFieldValue('Title', 'Mr');
    await anyCcdFormPage.setFieldValue('Given names', 'José');
    await anyCcdFormPage.setFieldValue('Last name', 'González');
    await anyCcdFormPage.setFieldValue('Date of birth', '31 12 1999');
    await anyCcdFormPage.addNewCollectionItem('Nationality');
    await anyCcdFormPage.setCollectionItemFieldValue('Nationality', 'first', 'Nationality', 'Finland');
    await anyCcdFormPage.setFieldValue('My client\'s nationality is not agreed', 'No');
    await anyCcdFormPage.click('Continue');
});

Given('I complete the Your client\'s address page', {timeout: 60 * 1000}, async function () {
    expect(await anyCcdFormPage.pageHeadingContains('Your client\'s address')).to.equal(true);
    await anyCcdFormPage.setFieldValue('Does the appellant have a fixed address?', 'No');
    await anyCcdFormPage.click('Continue');
});

Given('I complete the Why is your client appealing? page', {timeout: 60 * 1000}, async function () {
    expect(await anyCcdFormPage.pageHeadingContains('Why is your client appealing?')).to.equal(true);
    await anyCcdFormPage.setFieldValue('Appeal reason', 'My client\'s protection claim was refused');
    await anyCcdFormPage.click('Continue');
});

When(/^I add (?:a|another) new item to the (.+) collection$/, async function (collectionLabel) {
    await anyCcdFormPage.addNewCollectionItem(collectionLabel);
});

Then(/^Within the (.+) collection, I (?:choose|select|type) (.+) for the ([^\s]+) (.+) field$/,
    async function (
        collectionLabel,
        fieldValue,
        collectionItemNumber,
        fieldLabel
    ) {
        await anyCcdFormPage.setCollectionItemFieldValue(
            collectionLabel,
            collectionItemNumber,
            fieldLabel,
            fieldValue
        );
    });

Then(/^I (?:choose|select|type) (.+) for the (.+) field$/,
    async function (
        fieldValue,
        fieldLabel
    ) {
        await anyCcdFormPage.setFieldValue(
            fieldLabel,
            fieldValue
        );
    });

Then(/^I see a list of all nationalities$/,
    {timeout: 30 * 1000},
    async function () {

        const nationalityList = await anyCcdFormPage.getCollectionItemFieldValues(
            'Nationality',
            'first',
            'Nationality'
        );
        expect(nationalityList).to.have.lengthOf(251);
        expect(nationalityList[1]).to.equal('Afghanistan');
        expect(nationalityList[(nationalityList.length - 1)]).to.equal('Zimbabwe');
    });
