import { CaseListFlow } from '../../../flows/case-list.flow';
import { CcdFormPage } from '../../../pages/ccd-form.page';
import { When } from '@cucumber/cucumber';
import { expect } from 'chai';
import { browser } from "protractor";

const caseListFlow = new CaseListFlow();
const ccdFormPage = new CcdFormPage();

When(/^I open `?([^`]+)`?$/, async uri => {
  await ccdFormPage.get(uri);
});

When('I go to the `Case List`', async() => {
  await ccdFormPage.get('/list/case');
  const jurisdictionPath = '//select[@id="wb-jurisdiction"]/option[normalize-space()="Immigration & Asylum"]';
  try {
    await ccdFormPage.waitForXpathElementVisible(jurisdictionPath);
  } catch {
    browser.refresh();
    await ccdFormPage.waitForXpathElementVisible(jurisdictionPath);
  }
});

When('I attempt to go to the `Case List`', async() => {
  await ccdFormPage.get('/list/case');
});

When('I filter the cases by todays date', async() => {
  await caseListFlow.filterCasesByTodaysDate(true);
});

When(/^I filter the cases by `?([^`]+)`? postcode$/, async postcode => {
  await caseListFlow.filterCasesByPostcode(postcode, true);
});

When(/^I filter the cases by `?([^`]+)`? state$/, async state => {
  await caseListFlow.filterCasesByState(state, true);
});

When('I click case at row {int} and navigate to case view page', async rowNum => {
  await caseListFlow.clickCaseLinkAtRow(rowNum);
});

When('I should see the option `Appeal` prefix for the `Case type` field', async() => {
  const caseTypes = await ccdFormPage.getFieldOptions('Case type');
  expect(caseTypes.some(caseType => caseType.startsWith('Appeal'))).to.equal(true);
});
