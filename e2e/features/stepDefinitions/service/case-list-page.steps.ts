import { CaseListFlow } from '../../../flows/case-list.flow';
import { CcdFormPage } from '../../../pages/ccd-form.page';
import { When } from 'cucumber';
import { expect } from 'chai';

const caseListFlow = new CaseListFlow();
const ccdFormPage = new CcdFormPage();

When(/^I open `?([^`]+)`?$/, async function (uri) {
    await ccdFormPage.get(uri);
});

When('I go to the `Case List`', async function () {
    await ccdFormPage.get('/list/case');
});

When('I attempt to go to the `Case List`', async function () {
    await ccdFormPage.get('/list/case');
});

When('I filter the cases by todays date', async function () {
    await caseListFlow.filterCasesByTodaysDate(true);
});

When(/^I filter the cases by `?([^`]+)`? postcode$/, async function (postcode) {
    await caseListFlow.filterCasesByPostcode(postcode, true);
});

When(/^I filter the cases by `?([^`]+)`? state$/, async function (state) {
    await caseListFlow.filterCasesByState(state, true);
});

When('I click case at row {int} and navigate to case view page', async function (rowNum) {
    await caseListFlow.clickCaseLinkAtRow(rowNum);
});

When('I should see the option `Appeal` prefix for the `Case type` field', async function () {
    const caseTypes = await ccdFormPage.getFieldOptions('Case type');
    expect(caseTypes.some(caseType => caseType.startsWith('Appeal'))).to.equal(true);
});
