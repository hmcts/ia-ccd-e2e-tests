import { AnyCcdFormPage } from '../../../pages/any-ccd-form.page';
import { Given, Then, When } from 'cucumber';
import { expect } from 'chai';

const anyCcdFormPage = new AnyCcdFormPage();

Given('I complete the Basic details page', {timeout: 60 * 1000}, async function () {
    await anyCcdFormPage.setFieldValue('Title', 'Mr');
    await anyCcdFormPage.setFieldValue('Given names', 'José');
    await anyCcdFormPage.setFieldValue('Last name', 'González');
    await anyCcdFormPage.setFieldValue('Date of birth', '31 12 1999');
    await anyCcdFormPage.addNewCollectionItem('Nationality');
    await anyCcdFormPage.setCollectionItemFieldValue('Nationality', 'first', 'Nationality', 'Finland');
    await anyCcdFormPage.setFieldValue('My client\'s nationality is not agreed', 'No');
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
