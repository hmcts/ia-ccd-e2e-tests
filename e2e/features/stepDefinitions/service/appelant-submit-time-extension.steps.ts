import { Given, Then, When } from '@cucumber/cucumber';
import { CcdService, Events } from '../../../aip/ccd-service';
import { CcdPage } from '../../../pages/ccd.page';
import { expect } from 'chai';
import { CcdFormPage } from '../../../pages/ccd-form.page';

const ccdPage = new CcdPage();
const reasonForTimeExtension = 'reason for time extension';

Given(/^the appellant submits a time extension$/, async function () {
  const ccdService = new CcdService();

  const ccdCaseDetails = await ccdService.loadCasesForUser(this.userId, this.securityHeaders);
  const usersCase = ccdCaseDetails[0];
  usersCase.case_data.timeExtensions = [
    {
      id: 1,
      value: {
        requestedDate: '2020-01-01',
        reason: reasonForTimeExtension,
        status: 'submitted',
        state: 'awaitingReasonsForAppeal',
        evidence: [],
      },
    },
  ];
  usersCase.case_data.reviewTimeExtensionRequired = 'Yes';

  await ccdService.updateAppeal(Events.SUBMIT_TIME_EXTENSION, this.userId, usersCase, this.securityHeaders);
});

Then(/^I can review the appellants time extension$/, async function () {
  expect(await ccdPage.isFieldValueDisplayed('Why do you need more time?', reasonForTimeExtension)).to.equal(true);
});

When(/^I refuse the time extension$/, async function () {
  const ccdFormPage = new CcdFormPage();

  await ccdFormPage.setFieldValue('Decision', 'Application refused');
  await ccdFormPage.setFieldValue('Reason for decision', 'decision reason', 'text area');

  await ccdPage.click('Continue');
});
