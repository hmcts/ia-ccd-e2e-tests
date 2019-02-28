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

Given('I complete the `Home Office reference` page', async function () {
    expect(await ccdFormPage.headingContains('Home Office reference')).to.equal(true);
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

Given('I complete the `What type of decision is your client appealing against?` page', async function () {
    expect(await ccdFormPage.headingContains('What type of decision is your client appealing against?')).to.equal(true);
    await startAppealFlow.whatTypeOfDecisionIsYourClientAppealingAgainst(true);
});

Given('I complete the `On which grounds will you build your appeal?` page', async function () {
    expect(await ccdFormPage.headingContains('On which grounds will you build your appeal?')).to.equal(true);
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

Given('I complete the `Your own reference number` page', async function () {
    expect(await ccdFormPage.headingContains('Your own reference number')).to.equal(true);
    await startAppealFlow.completeReferenceNumber(true);
});

Given('I complete the `Start appeal check your answers` page', async function () {
    expect(await ccdFormPage.headingContains('Check your answers')).to.equal(true);
    await startAppealFlow.completeCheckYourAnswers(true);
});

Given(/^I skip the `?([^`]+)`? page by clicking `?([^`]+)`?$/, async function (pageName, buttonName) {
    expect(await ccdFormPage.headingContains(pageName)).to.equal(true);
    await ccdFormPage.click(buttonName);
});

Given('I save my initial appeal', async function () {
    await startAppealFlow.saveAppeal(true);
});

Given('I save my initial appeal with out of time decision letter', async function () {
    await startAppealFlow.saveOutOfTimeAppeal(true);
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
    expect(nationalities[1]).to.equal('Afghanistan');
    expect(nationalities[(nationalities.length - 1)]).to.equal('Zimbabwe');
});
