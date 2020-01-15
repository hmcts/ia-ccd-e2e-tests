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

When('I should see the option `IA Asylum Case` prefix for the `Case type` field', async function () {
    const caseTypes = await ccdFormPage.getFieldOptions('Case type');
    expect(caseTypes.some(caseType => caseType.startsWith('IA Asylum Case'))).to.equal(true);
});
