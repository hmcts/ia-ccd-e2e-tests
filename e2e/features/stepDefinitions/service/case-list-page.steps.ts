import { CaseListFlow } from '../../../flows/case-list.flow';
import { CcdPage } from '../../../pages/ccd.page';
import { When } from 'cucumber';

const caseListFlow = new CaseListFlow();
const ccdPage = new CcdPage();

When(/^I open `?([^`]+)`?$/, async function (uri) {
    await ccdPage.get(uri);
});

When('I go to the `Case List`', async function () {
    await ccdPage.get('/list/case');
});

When('I attempt to go to the `Case List`', async function () {
    await ccdPage.get('/list/case');
});

When('I filter the cases by todays date', async function () {
    await caseListFlow.filterCasesByTodaysDate(true);
});
