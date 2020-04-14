import { CcdFormPage } from '../../../pages/ccd-form.page';
import { StartAppealFlow } from '../../../flows/start-appeal.flow';
import { Given, Then } from 'cucumber';
import { expect } from 'chai';

const ccdFormPage = new CcdFormPage();
const startAppealFlow = new StartAppealFlow();

Given('I complete the `Tell us about your client` page', async function () {
    expect(await ccdFormPage.headingContains('Tell us about your client')).to.equal(true);
    await startAppealFlow.completeScreeningQuestions(true);
});

Given('I complete the `Home office details` page', async function () {
    expect(await ccdFormPage.headingContains('Home office details')).to.equal(true);
    await startAppealFlow.completeHomeOfficeReference(true);
});

Given('I complete the `Basic details` form', async function () {
    expect(await ccdFormPage.headingContains('Basic details')).to.equal(true);
    await startAppealFlow.completeBasicDetails(false);
});

Given('I complete the `Basic details` page', async function () {
    expect(await ccdFormPage.headingContains('Basic details')).to.equal(true);
    await startAppealFlow.completeBasicDetails(true);
});

Given('I complete the `Your client\'s address` page', async function () {
    expect(await ccdFormPage.headingContains('Your client\'s address')).to.equal(true);
    await startAppealFlow.completeClientAddress(true);
});

Given('I complete the `The appellant\'s contact preference` page', async function () {
    expect(await ccdFormPage.headingContains('The appellant\'s contact preference')).to.equal(true);
    await startAppealFlow.completeContactPreference(true);
});

Given('I complete the `Type of appeal` page', async function () {
    expect(await ccdFormPage.headingContains('Type of appeal')).to.equal(true);
    await startAppealFlow.completeAppealType(true);
});

Given('I complete the `The grounds of your appeal` page', async function () {
    expect(await ccdFormPage.headingContains('The grounds of your appeal')).to.equal(true);
    await startAppealFlow.completeAppealGrounds(true);
});

Given('I complete the `New matters` page', async function () {
    expect(await ccdFormPage.headingContains('New matters')).to.equal(true);
    await startAppealFlow.completeNewMatters(true);
});

Given('I complete the `Has your client appealed against any other UK immigration decisions?` page', async function () {
    expect(await ccdFormPage.headingContains('Has your client appealed against any other UK immigration decisions?')).to.equal(true);
    await startAppealFlow.completeOtherAppeals(true);
});

Given('I complete the `Legal representative details` page', async function () {
    expect(await ccdFormPage.headingContains('Legal representative details')).to.equal(true);
    await startAppealFlow.completeLegalRepresentativeDetails(true);
});

Given('I complete the `Start appeal check your answers` page', async function () {
    expect(await ccdFormPage.headingContains('Check your answers')).to.equal(true);
    await startAppealFlow.completeCheckYourAnswers(true);
});

Given(/^I skip the `?([^`]+)`? page by clicking `?([^`]+)`?$/, async function (pageName, buttonName) {
    expect(await ccdFormPage.headingContains(pageName)).to.equal(true);
    await ccdFormPage.click(buttonName);
});

Given('I save my initial appeal', { timeout: 180 * 2 * 1000 }, async function () {
    await startAppealFlow.saveAppeal(true);
});

Given('I save my initial appeal with out of time decision letter', async function () {
    await startAppealFlow.saveOutOfTimeAppeal(true);
});

Given(/^I save my initial appeal with `?([^`]+)`? address and `?([^`]+)`? postcode$/, async function (address, postcode) {
    await startAppealFlow.saveAppeal(true, true, address, postcode);
});

Given('I wait for any found addresses to load', async function () {
    await ccdFormPage.doesDropdownHaveValues('Select an address');
});

Then(/^I see a list of all nationalities$/, async function () {

    const nationalities = await ccdFormPage.getFieldOptions(
        'Nationality',
        'first',
        'Nationality',
        'first'
    );

    expect(nationalities).to.have.lengthOf(251);
    expect(nationalities.includes('Afghanistan')).to.equal(true);
    expect(nationalities.includes('Zimbabwe')).to.equal(true);
});
