import { AnyCcdPage } from '../../pages/any-ccd.page';
import { AuthenticationFlow } from '../../flows/authentication.flow';
import { Given, Then } from 'cucumber';
import { IdamSignInPage } from '../../pages/idam-sign-in.page';
import { expect } from 'chai';

const anyCcdPage = new AnyCcdPage();
const authenticationFlow = new AuthenticationFlow();
const idamSignInPage = new IdamSignInPage();

Given('I am not signed in', {timeout: 30 * 1000}, async function () {
    await authenticationFlow.signOut();
    await idamSignInPage.waitUntilLoaded();
});

Given('I am signed in as a Case Officer', {timeout: 30 * 1000}, async function () {
    await authenticationFlow.signInAsCaseOfficer();
    await anyCcdPage.waitUntilLoaded();
});

Given('I am signed in as a Legal Rep', {timeout: 30 * 1000}, async function () {
    await authenticationFlow.signInAsLawFirmA();
    await anyCcdPage.waitUntilLoaded();
});

Then(/^I should be redirected to the sign in page(?:| instead)$/, async function () {
    await idamSignInPage.waitUntilLoaded();
    expect(await anyCcdPage.isLoaded()).to.equal(false);
    expect(await idamSignInPage.isLoaded()).to.equal(true);
});
