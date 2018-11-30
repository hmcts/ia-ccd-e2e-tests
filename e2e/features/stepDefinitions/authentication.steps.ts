import { AuthenticationFlow } from '../../flows/authentication.flow';
import { CcdPage } from '../../pages/ccd.page';
import { Given, Then } from 'cucumber';
import { IdamSignInPage } from '../../pages/idam-sign-in.page';
import { expect } from 'chai';

const authenticationFlow = new AuthenticationFlow();
const ccdPage = new CcdPage();
const idamSignInPage = new IdamSignInPage();

Given('I am not signed in', async function () {
    await authenticationFlow.signOut();
    await idamSignInPage.waitUntilLoaded();
});

Given(/^I am signed in as a `?Case (?:Officer|Worker)`?$/, async function () {
    await authenticationFlow.signInAsCaseOfficer();
    await ccdPage.waitUntilLoaded();
});

Given(/^I am signed in as(?:| a) `?(?:Solicitor|Legal Rep)(?:| A)`?$/, async function () {
    await authenticationFlow.signInAsLawFirmA();
    await ccdPage.waitUntilLoaded();
});

Given(/^I am signed in as(?:| a) `?(?:Solicitor|Legal Rep)(?:| B)`? without any cases$/, async function () {
    await authenticationFlow.signInAsLawFirmB();
    await ccdPage.waitUntilLoaded();
});

Given(/^I switch to be a `?Case (?:Officer|Worker)`?$/, async function () {
    const currentUrl = await ccdPage.getCurrentUrl();
    await authenticationFlow.signInAsCaseOfficer();
    await ccdPage.waitUntilLoaded();
    await ccdPage.get(currentUrl);
    await ccdPage.waitUntilLoaded();
});

Given(/^I switch to be a `?(?:Solicitor|Legal Rep)(?:| A)`?$/, async function () {
    const currentUrl = await ccdPage.getCurrentUrl();
    await authenticationFlow.signInAsLawFirmA();
    await ccdPage.waitUntilLoaded();
    await ccdPage.get(currentUrl);
    await ccdPage.waitUntilLoaded();
});

Then(/^I should be redirected to the `Sign In` page(?:| instead)$/, async function () {
    await idamSignInPage.waitUntilLoaded();
    expect(await ccdPage.isLoaded()).to.equal(false);
    expect(await idamSignInPage.isLoaded()).to.equal(true);
});
