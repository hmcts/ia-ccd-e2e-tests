import { AnyCcdFormPage } from '../../../pages/any-ccd-form.page';
import { Given, Then, When } from 'cucumber';
import { LodgeAppealFlow } from '../../../flows/lodge-appeal.flow';
import { expect } from 'chai';

const anyCcdFormPage = new AnyCcdFormPage();
const lodgeAppealFlow = new LodgeAppealFlow();

Given('I complete the screening questions page', async function () {
    expect(await anyCcdFormPage.pageHeadingContains('Tell us about your client')).to.equal(true);
    await lodgeAppealFlow.completeScreeningQuestions(true);
});

Given('I complete the Home Office reference page', async function () {
    expect(await anyCcdFormPage.pageHeadingContains('Home Office reference')).to.equal(true);
    await lodgeAppealFlow.completeHomeOfficeReference(true);
});

Given('I complete the Basic details form', async function () {
    expect(await anyCcdFormPage.pageHeadingContains('Basic details')).to.equal(true);
    await lodgeAppealFlow.completeBasicDetails(false);
});

Given('I complete the Basic details page', async function () {
    expect(await anyCcdFormPage.pageHeadingContains('Basic details')).to.equal(true);
    await lodgeAppealFlow.completeBasicDetails(true);
});

Given('I complete the Your client\'s address page', async function () {
    expect(await anyCcdFormPage.pageHeadingContains('Your client\'s address')).to.equal(true);
    await lodgeAppealFlow.completeClientAddress(true);
});

Given('I complete the Why is your client appealing? page', async function () {
    expect(await anyCcdFormPage.pageHeadingContains('Why is your client appealing?')).to.equal(true);
    await lodgeAppealFlow.completeWhyIsClientAppealing(true);
});

Given('I complete the New matters page', async function () {
    expect(await anyCcdFormPage.pageHeadingContains('New matters')).to.equal(true);
    await lodgeAppealFlow.completeNewMatters(true);
});

Given('I complete the Has your client appealed against any other UK immigration decisions? page', async function () {
    expect(await anyCcdFormPage.pageHeadingContains('Has your client appealed against any other UK immigration decisions?')).to.equal(true);
    await lodgeAppealFlow.completeOtherAppeals(true);
});

Given('I complete the Your own reference number page', async function () {
    expect(await anyCcdFormPage.pageHeadingContains('Your own reference number')).to.equal(true);
    await lodgeAppealFlow.completeReferenceNumber(true);
});

Given('I complete the lodge appeal Check your answers page', async function () {
    expect(await anyCcdFormPage.pageHeadingContains('Check your answers')).to.equal(true);
    await lodgeAppealFlow.completeCheckYourAnswers(true);
});

Given('I close and return to case details', async function () {
    await anyCcdFormPage.click('Close and Return to case details');
});

Given('I lodge an appeal', async function () {
    await lodgeAppealFlow.lodgeAppeal(true);
});

When(/^I add (?:a|another) new item to the `?([^`]+)`? collection$/, async function (collectionLabel) {
    await anyCcdFormPage.addNewCollectionItem(collectionLabel);
});

When(/^I remove the `?([^`]+)`? item from the `?([^`]+)`? collection$/, async function (
    collectionItemNumber,
    collectionLabel
) {
    await anyCcdFormPage.removeCollectionItem(collectionLabel, collectionItemNumber);
});

When(/^Within the `?([^`]+)`? collection, I (?:choose|select|type) `?([^`]+)`? for the `?([^\s`]+)`? `?([^`]+)`? field$/,
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

When(/^I clear the `?([^`]+)`? field$/, async function (fieldLabel) {
    await anyCcdFormPage.setFieldValue(
        fieldLabel,
        ''
    );
});

When(/^I (?:check|choose|select|toggle|type) `?([^`]+)`? (?:for|from) the `?([^`]+)`? field$/,
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

Then(/^I should see an error saying `?([^`]+)`?$/, async function (errorMessage) {
    expect(await anyCcdFormPage.fieldErrorContains(errorMessage)).to.equal(true);
});
