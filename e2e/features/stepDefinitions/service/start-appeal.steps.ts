import { CcdFormPage } from '../../../pages/ccd-form.page';
import { StartAppealFlow } from '../../../flows/start-appeal.flow';
import { Given, Then } from 'cucumber';
import { expect } from 'chai';

const ccdFormPage = new CcdFormPage();
const startAppealFlow = new StartAppealFlow();

Given('I complete the `Tell us about your client` page', async function () {
    expect(await ccdFormPage.pageHeadingContains('Tell us about your client')).to.equal(true);
    await startAppealFlow.completeScreeningQuestions(true);
});

Given('I complete the `Home Office reference` page', async function () {
    expect(await ccdFormPage.pageHeadingContains('Home Office reference')).to.equal(true);
    await startAppealFlow.completeHomeOfficeReference(true);
});

Given('I complete the `Basic details` form', async function () {
    expect(await ccdFormPage.pageHeadingContains('Basic details')).to.equal(true);
    await startAppealFlow.completeBasicDetails(false);
});

Given('I complete the `Basic details` page', async function () {
    expect(await ccdFormPage.pageHeadingContains('Basic details')).to.equal(true);
    await startAppealFlow.completeBasicDetails(true);
});

Given('I complete the `Your client\'s address` page', async function () {
    expect(await ccdFormPage.pageHeadingContains('Your client\'s address')).to.equal(true);
    await startAppealFlow.completeClientAddress(true);
});

Given('I complete the `Why is your client appealing?` page', async function () {
    expect(await ccdFormPage.pageHeadingContains('Why is your client appealing?')).to.equal(true);
    await startAppealFlow.completeWhyIsClientAppealing(true);
});

Given('I complete the `New matters` page', async function () {
    expect(await ccdFormPage.pageHeadingContains('New matters')).to.equal(true);
    await startAppealFlow.completeNewMatters(true);
});

Given('I complete the `Has your client appealed against any other UK immigration decisions?` page', async function () {
    expect(await ccdFormPage.pageHeadingContains('Has your client appealed against any other UK immigration decisions?')).to.equal(true);
    await startAppealFlow.completeOtherAppeals(true);
});

Given('I complete the `Your own reference number` page', async function () {
    expect(await ccdFormPage.pageHeadingContains('Your own reference number')).to.equal(true);
    await startAppealFlow.completeReferenceNumber(true);
});

Given('I complete the `Start appeal check your answers` page', async function () {
    expect(await ccdFormPage.pageHeadingContains('Check your answers')).to.equal(true);
    await startAppealFlow.completeCheckYourAnswers(true);
});

Given('I save my initial appeal', async function () {
    await startAppealFlow.saveAppeal(true);
});

Then(/^I see a list of all nationalities$/, async function () {

    const nationalities = await ccdFormPage.getFieldOptions(
        'Nationality',
        'first',
        'Nationality'
    );

    expect(nationalities).to.have.lengthOf(251);
    expect(nationalities[1]).to.equal('Afghanistan');
    expect(nationalities[(nationalities.length - 1)]).to.equal('Zimbabwe');
});
