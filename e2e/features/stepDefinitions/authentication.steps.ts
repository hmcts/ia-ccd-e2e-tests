import { AuthenticationFlow, UserRole } from '../../flows/authentication.flow';
import { CcdPage } from '../../pages/ccd.page';
import { Given, Then } from 'cucumber';
import { IdamSignInPage } from '../../pages/idam-sign-in.page';
import { expect } from 'chai';

const iaConfig = require('../../ia.conf');

const authenticationFlow = new AuthenticationFlow();
const ccdPage = new CcdPage();
const idamSignInPage = new IdamSignInPage();
const caseUrlMatcher = /^.*?\/cases\/case-details\/.*?\d{16}/g;

Given('I am not signed in', async function () {
  await authenticationFlow.signOut();
});

Given(/^I am signed in as a `?([A-z ]+)?`$/, async function (role: UserRole) {
  await authenticationFlow.signInByRole(role);
});

Given(/^I sign back in as a `?([A-z ]+)?`$/, async function (role: UserRole) {
  await authenticationFlow.signInByRole(role);
});

Given(/^I switch to be a `?([A-z ]+)?`$/, async function (role: UserRole) {
  const currentUrl = await ccdPage.getCurrentUrl();
  const caseUrl = currentUrl.match(caseUrlMatcher)[0];
  await authenticationFlow.signInByRole(role);
  try {
    await ccdPage.get(caseUrl);
    await ccdPage.waitForOverviewPage(ccdPage.getStoredCaseUrl());
  } catch {
    await ccdPage.get(caseUrl);
    await ccdPage.waitForOverviewPage(ccdPage.getStoredCaseUrl());
  }
});

Given(/^I am signed in as a `Legal Rep` without any cases$/, async function () {
  if (iaConfig.WaitForAngular) {
    await authenticationFlow.signInAsLawFirmB();
  } else {
    await authenticationFlow.signInAsLawFirmC();
  }
});

Then(/^I should be redirected to the `Sign In` page(?:| instead)$/, async function () {
  await idamSignInPage.waitUntilLoaded();
  expect(await ccdPage.isLoaded()).to.equal(false);
  expect(await idamSignInPage.isLoaded()).to.equal(true);
});
