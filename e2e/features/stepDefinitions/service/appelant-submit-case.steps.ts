import { Given, Then } from 'cucumber';
import { getS2sToken } from '../../../aip/s2s';
import { CcdService, Events } from '../../../aip/ccd-service';
import { createUser, getUserId, getUserToken } from '../../../aip/idam-service';
import { CcdPage } from '../../../pages/ccd.page';
import { expect } from 'chai';
const iaConfig = require('../../../ia.conf');

const ccdPage = new CcdPage();
const ccdUrl = iaConfig.CcdWebUrl;

Given(/^An appellant has submitted an appeal$/, async function () {
  const appellantConfig = await createUser();
  const userToken = await getUserToken(appellantConfig);
  const userId = await getUserId(userToken);
  const serviceToken = await getS2sToken();
  const ccdService = new CcdService();
  const securityHeaders = {userToken, serviceToken};
  const caseDetails = await ccdService.createCase(userId, securityHeaders);
  await ccdService.updateAppeal(Events.SUBMIT_APPEAL, userId, caseDetails, securityHeaders);

  this.caseDetails = caseDetails;
  this.userId = userId;
  this.securityHeaders = securityHeaders;
});

Given(/^I am viewing the appellant's case details$/, async function () {
  await ccdPage.get(`${ccdUrl}/cases/case-details/${this.caseDetails.id}`);
  await ccdPage.contentContains(this.caseDetails.case_data.homeOfficeReferenceNumber);
});

Given(/^I am viewing the appellant's case$/, async function () {
  await ccdPage.get(`${ccdUrl}/case/IA/Asylum/${this.caseDetails.id}`);
  await ccdPage.contentContains('Immigration');
});

Given(/^the appellant submits their reasons for appeal$/, async function () {
  const ccdService = new CcdService();

  const ccdCaseDetails = await ccdService.loadCasesForUser(this.userId, this.securityHeaders);
  const usersCase = ccdCaseDetails[0];
  usersCase.case_data.reasonsForAppealDecision = 'a reason for appeal';

  await ccdService.updateAppeal(Events.SUBMIT_REASONS_FOR_APPEAL, this.userId, usersCase, this.securityHeaders);
});

Then(/^I should see the appellants reasons for appeal$/, async function () {
  expect(await ccdPage.isFieldValueDisplayed('Appeal Reasons', 'a reason for appeal')).to.equal(true);
});
