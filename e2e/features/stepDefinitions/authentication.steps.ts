import { AuthenticationFlow } from '../../flows/authentication.flow';
import { CcdPage } from '../../pages/ccd.page';
import { Given, Then } from 'cucumber';
import { IdamSignInPage } from '../../pages/idam-sign-in.page';
import { expect } from 'chai';
import { browser } from 'protractor';

const iaConfig = require('../../ia.conf');

const authenticationFlow = new AuthenticationFlow();
const ccdPage = new CcdPage();
const idamSignInPage = new IdamSignInPage();
const caseUrlMatcher = /^.*?\/cases\/case-details\/\d{16}/g;

Given('I am not signed in', { timeout: 180 * 2 * 1000 }, async function () {
    await authenticationFlow.signOut();
});

Given(/^I am signed in as a `?Case (?:Officer|Worker)`?$/, { timeout: 180 * 2 * 1000 }, async function () {
    await authenticationFlow.signInAsCaseOfficer();
});

Given(/^I am signed in as a `?(?:Admin Officer)`?$/, { timeout: 180 * 2 * 1000 }, async function () {
    await authenticationFlow.signInAsAdminOfficer();
});

Given(/^I am signed in as a `?(?:Home Office APC)`?$/, { timeout: 180 * 2 * 1000 }, async function () {
    await authenticationFlow.signInAsHomeOfficeApc();
});

Given(/^I am signed in as a `?(?:Home Office LART)`?$/, { timeout: 180 * 2 * 1000 }, async function () {
    await authenticationFlow.signInAsHomeOfficeLart();
});

Given(/^I am signed in as a `?(?:Home Office POU)`?$/, { timeout: 180 * 2 * 1000 }, async function () {
    await authenticationFlow.signInAsHomeOfficePou();
});

Given(/^I am signed in as a `?(?:Home Office Generic)`?$/, { timeout: 180 * 2 * 1000 }, async function () {
    await authenticationFlow.signInAsHomeOfficeGeneric();
});

Given(/^I am signed in as a `?(?:Judge)`?$/, { timeout: 180 * 2 * 1000 }, async function () {
    await authenticationFlow.signInAsJudge();
});

Given(/^I am signed in as(?:| a) `?(?:Solicitor|Legal Rep)(?:| A)`?$/, { timeout: 180 * 2 * 1000 }, async function () {
    await authenticationFlow.signInAsLawFirmA();
});

Given(/^I am signed in as(?:| a| another) `?(?:Solicitor|Legal Rep)(?:| B)`? without any cases$/, { timeout: 180 * 2 * 1000 }, async function () {
    if (iaConfig.WaitForAngular) {
        await authenticationFlow.signInAsLawFirmB();
    } else {
        await authenticationFlow.signInAsLawFirmC();
    }
});

Given(/^I switch to be a `?Case (?:Officer|Worker)`?$/, { timeout: 180 * 2 * 1000 }, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInAsCaseOfficer();
    await browser.sleep(100);
    await ccdPage.get(caseUrl);
});

Given(/^I switch to be a `?(?:Admin Officer)`?$/, { timeout: 180 * 2 * 1000 }, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInAsAdminOfficer();
    await browser.sleep(100);
    await ccdPage.get(caseUrl);
});

Given(/^I switch to be a `?(?:Solicitor|Legal Rep)(?:| A)`?$/, { timeout: 180 * 2 * 1000 }, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInAsLawFirmA();
    await browser.sleep(100);
    await ccdPage.get(caseUrl);
});

Given(/^I switch to be a `?(?:Home Office APC)`?$/, { timeout: 180 * 2 * 1000 }, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInAsHomeOfficeApc();
    await browser.sleep(100);
    await ccdPage.get(caseUrl);
});

Given(/^I switch to be a `?(?:Home Office LART)`?$/, { timeout: 180 * 2 * 1000 }, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInAsHomeOfficeLart();
    await browser.sleep(100);
    await ccdPage.get(caseUrl);
});

Given(/^I switch to be a `?(?:Home Office POU)`?$/, { timeout: 180 * 2 * 1000 }, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInAsHomeOfficePou();
    await browser.sleep(100);
    await ccdPage.get(caseUrl);
});

Given(/^I switch to be a `?(?:Home Office Generic)`?$/, { timeout: 180 * 2 * 1000 }, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInAsHomeOfficeGeneric();
    await browser.sleep(100);
    await ccdPage.get(caseUrl);
});

Given(/^I switch to be a `?(?:Judge)`?$/, { timeout: 180 * 2 * 1000 }, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInAsJudge();
    await browser.sleep(100);
    await ccdPage.contentContains('Immigration');
    await ccdPage.get(caseUrl);
    await ccdPage.contentContains('Immigration');
});

Then(/^I should be redirected to the `Sign In` page(?:| instead)$/, { timeout: 180 * 2 * 1000 }, async function () {
    await idamSignInPage.waitUntilLoaded();
    expect(await ccdPage.isLoaded()).to.equal(false);
    expect(await idamSignInPage.isLoaded()).to.equal(true);
});
