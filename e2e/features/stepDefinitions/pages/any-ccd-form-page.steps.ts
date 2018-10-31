import { AnyCcdFormPage } from '../../../pages/any-ccd-form.page';
import { Then, When } from 'cucumber';
import { expect } from 'chai';

const anyCcdFormPage = new AnyCcdFormPage();

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
            fieldValue,
            fieldLabel
        );
    });

Then(/^I (?:choose|select|type) (.+) for the (.+) field$/,
    async function (
        fieldValue,
        fieldLabel
    ) {
        await anyCcdFormPage.setFieldValue(
            fieldValue,
            fieldLabel
        );
    });

Then(/^I see a list of all nationalities$/,
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
