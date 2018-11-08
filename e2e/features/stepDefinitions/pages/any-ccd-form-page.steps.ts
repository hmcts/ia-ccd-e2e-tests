import { AnyCcdFormPage } from '../../../pages/any-ccd-form.page';
import { BasicDetailsFlow } from '../../../flows/basic-details.flow';
import { Given, Then, When } from 'cucumber';
import { expect } from 'chai';

const anyCcdFormPage = new AnyCcdFormPage();
const basicDetailsFlow = new BasicDetailsFlow();

Given('I complete the Home Office reference page', async function () {
    expect(await anyCcdFormPage.pageHeadingContains('Home Office reference')).to.equal(true);
    await anyCcdFormPage.setFieldValue('Home Office reference number', 'A123456/001');
    await anyCcdFormPage.setFieldValue('Date on the decision letter', '31-10-2018');
    await anyCcdFormPage.click('Continue');
});

Given('I complete the Basic details form', async function () {
    expect(await anyCcdFormPage.pageHeadingContains('Basic details')).to.equal(true);
    await basicDetailsFlow.completeForm();
});

Given('I complete the Basic details page', async function () {
    expect(await anyCcdFormPage.pageHeadingContains('Basic details')).to.equal(true);
    await basicDetailsFlow.completeForm();
    await anyCcdFormPage.click('Continue');
});

Given('I complete the Your client\'s address page', async function () {
    expect(await anyCcdFormPage.pageHeadingContains('Your client\'s address')).to.equal(true);
    await anyCcdFormPage.setFieldValue('Does the appellant have a fixed address?', 'No');
    await anyCcdFormPage.click('Continue');
});

Given('I complete the Why is your client appealing? page', async function () {
    expect(await anyCcdFormPage.pageHeadingContains('Why is your client appealing?')).to.equal(true);
    await anyCcdFormPage.setFieldValue('Appeal reason', 'My client\'s protection claim was refused');
    await anyCcdFormPage.click('Continue');
});

Given('I complete the New matters page', async function () {
    expect(await anyCcdFormPage.pageHeadingContains('New matters')).to.equal(true);
    await anyCcdFormPage.setFieldValue(
        'Are there any new reasons your client wishes to remain in the UK ' +
        'or any new grounds on which they should be permitted to stay?',
        'Yes'
    );
    await anyCcdFormPage.setFieldValue('New matters', 'Birth of a child');
    await anyCcdFormPage.setFieldValue('New matters', 'New relationship');
    await anyCcdFormPage.setFieldValue('New matters', 'Removal would disrupt family life');
    await anyCcdFormPage.setFieldValue('New matters', 'Appellant now claims to be a refugee');
    await anyCcdFormPage.setFieldValue('New matters', 'New marriage');
    await anyCcdFormPage.click('Continue');
});

Given('I complete the Has your client appealed against any other UK immigration decisions? page', async function () {
    expect(await anyCcdFormPage.pageHeadingContains('Has your client appealed against any other UK immigration decisions?')).to.equal(true);
    await anyCcdFormPage.setFieldValue('Other appeals', 'No');
    await anyCcdFormPage.click('Continue');
});

Given('I complete the Your own reference number page', async function () {
    expect(await anyCcdFormPage.pageHeadingContains('Your own reference number')).to.equal(true);
    await anyCcdFormPage.setFieldValue(
        'If you prefer to use your own reference number for this case, you can enter it here. (Optional)',
        'some-ref'
    );
    await anyCcdFormPage.click('Continue');
});

When(/^I add (?:a|another) new item to the (.+) collection$/, async function (collectionLabel) {
    await anyCcdFormPage.addNewCollectionItem(collectionLabel);
});

When(/^I remove the (.+) item from the (.+) collection$/, async function (
    collectionItemNumber,
    collectionLabel
) {
    await anyCcdFormPage.removeCollectionItem(collectionLabel, collectionItemNumber);
});

When(/^Within the (.+) collection, I (?:choose|select|type) (.+) for the ([^\s]+) (.+) field$/,
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

When(/^I clear the (.+) field$/, async function (fieldLabel) {
    await anyCcdFormPage.setFieldValue(
        fieldLabel,
        ''
    );
});

When(/^I (?:check|choose|select|toggle|type) (.+) (?:for|from) the (.+) field$/,
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

Then(/^I should see an error saying (.+)$/, async function (errorMessage) {
    expect(await anyCcdFormPage.fieldErrorContains(errorMessage)).to.equal(true);
});
