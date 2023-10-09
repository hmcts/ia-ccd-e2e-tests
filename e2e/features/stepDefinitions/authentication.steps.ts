import { AuthenticationFlow } from '../../flows/authentication.flow';
import { CcdPage } from '../../pages/ccd.page';
import { Given, Then, When } from 'cucumber';
import { IdamSignInPage } from '../../pages/idam-sign-in.page';
import { expect } from 'chai';
import { browser } from 'protractor';

const iaConfig = require('../../ia.conf');

const authenticationFlow = new AuthenticationFlow();
const ccdPage = new CcdPage();
const idamSignInPage = new IdamSignInPage();
const caseUrlMatcher = /^.*?\/cases\/case-details\/\d{16}/g;

Given('I am not signed in', async function () {
    await authenticationFlow.signOut();
});

Given(/^I am signed in as a `?Case (?:Officer|Worker)`?$/, async function () {
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsCaseOfficer);
});

Given(/^I am signed in as a `?(?:Admin Officer)`?$/, async function () {
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsAdminOfficer);
});

Given(/^I am signed in as a `?(?:Home Office APC)`?$/, async function () {
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsHomeOfficeApc);
});

Given(/^I am signed in as a `?(?:Home Office LART)`?$/, async function () {
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsHomeOfficeLart);
});

Given(/^I am signed in as a `?(?:Home Office POU)`?$/, async function () {
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsHomeOfficePou);
});

Given(/^I am signed in as a `?(?:Home Office Generic)`?$/, async function () {
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsHomeOfficeGeneric);
});

Given(/^I am signed in as a `?(?:Home Office Bails)`?$/, async function () {
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsHomeOfficeBails);
});

Given(/^I am signed in as a `?(?:Judge)`?$/, async function () {
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsJudge);
});

Given(/^I am signed in as(?:| a) `?(?:Solicitor|Legal Rep)(?:| A)`?$/, async function () {
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsLawFirmA);
});

Given(/^I am signed in as(?:| a| another) `?(?:Solicitor|Legal Rep)(?:| B)`? without any cases$/, async function () {
    if (iaConfig.WaitForAngular) {
        await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsLawFirmB);
    } else {
        await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsLawFirmC);
    }
});

Given(/^I am signed in as(?:| a) `?(?:|Legal Org User Rep)(?:| A)`?$/, async function () {
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsLawFirmOrgUserA);
});

When(/^I sign back in as(?:| a) `?(?:|Legal Org User Rep)(?:| A)`?$/, async function () {
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsLawFirmOrgUserA);
});

When(/^I sign back in as(?:| a) `?(?:|Legal Org User Rep)(?:| C)`?$/, async function () {
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsLawFirmOrgUserC);
});

Given(/^I am signed in as(?:| a) `?(?:|Legal Org User Rep)(?:| B)`?$/, async function () {
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsLawFirmOrgUserB);
});

Given(/^I am signed in as(?:| a) `?(?:|Legal Org User Rep)(?:| C)`?$/, async function () {
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsLawFirmOrgUserC);
});

Given(/^I am signed in as(?:| a) `?(?:|Legal Org User Rep)(?:| D)`?$/, async function () {
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsLawFirmOrgUserD);
});

Given(/^I am signed in as(?:| a) `?(?:|Legal Org User Rep)(?:| Creator)`?$/, async function () {
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsLawFirmOrgCreator);
});

Given(/^I am signed in as(?:| a) `?(?:|Legal Org2 User Rep)(?:| Creator)`?$/, async function () {
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsLawFirmOrg2Creator);
});

Given(/^I switch to be a `?Case (?:Officer|Worker)`?$/, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsCaseOfficer);
    await browser.sleep(100);
    await ccdPage.get(caseUrl);
    await browser.sleep(7000);
    if (!await ccdPage.overViewContains('Overview')) {
        await ccdPage.get(caseUrl);
    }
});

Given(/^I switch to be a Sr `?Case (?:Officer|Worker)`?$/, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsSrCaseOfficer);
    await browser.sleep(100);
    await ccdPage.get(caseUrl);
});

Given(/^I switch to be a `?(?:Admin Officer)`?$/, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsAdminOfficer);
    await browser.sleep(100);
    await ccdPage.get(caseUrl);
    await browser.sleep(7000);
    if (!await ccdPage.overViewContains('Overview')) {
        await ccdPage.get(caseUrl);
    }
});

Given(/^I switch to be a `?(?:Solicitor|Legal Rep)(?:| A)`?$/, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsLawFirmA);
    await browser.sleep(100);
    await ccdPage.get(caseUrl);
});

Given(/^I switch to be a `?(?:Home Office APC)`?$/, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsHomeOfficeApc);
    await browser.sleep(100);
    await ccdPage.get(caseUrl);
    await browser.sleep(7000);
    if (!await ccdPage.overViewContains('Overview')) {
        await ccdPage.get(caseUrl);
    }
});

Given(/^I switch to be a `?(?:Home Office LART)`?$/, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsHomeOfficeLart);
    await browser.sleep(100);
    await ccdPage.get(caseUrl);
});

Given(/^I switch to be a `?(?:Home Office POU)`?$/, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsHomeOfficePou);
    await browser.sleep(100);
    await ccdPage.get(caseUrl);
});

Given(/^I switch to be a `?(?:Home Office Generic)`?$/, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsHomeOfficeGeneric);
    await browser.sleep(100);
    await ccdPage.get(caseUrl);
});

Given(/^I switch to be a `?(?:Home Office Bails)`?$/, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsHomeOfficeBails);
    await browser.sleep(100);
    await ccdPage.get(caseUrl);
});

Given(/^I switch to be a `?(?:Judge)`?$/, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsJudge);
    await browser.sleep(100);
    // await ccdPage.contentContains('Immigration');
    await ccdPage.get(caseUrl);
    // await ccdPage.contentContains('Immigration');
    await browser.sleep(7000);
    if (!await ccdPage.overViewContains('Overview')) {
        await ccdPage.get(caseUrl);
    }
});

Given(/^I switch to be a `?(?:|Legal Org User Rep)(?:| A)`?$/, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsLawFirmOrgUserA);
    await browser.sleep(100);
    await ccdPage.get(caseUrl);
    await browser.sleep(7000);
    if (!await ccdPage.overViewContains('Overview')) {
        await ccdPage.get(caseUrl);
    }
});

Given(/^I switch to be a `?(?:|Legal Org User Rep)(?:| B)`?$/, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsLawFirmOrgUserB);
    await browser.sleep(100);
    await ccdPage.get(caseUrl);
    await browser.sleep(7000);
    if (!await ccdPage.overViewContains('Overview')) {
        await ccdPage.get(caseUrl);
    }
});

Given(/^I switch to be a `?(?:|Legal Org User Rep)(?:| C)`?$/, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsLawFirmOrgUserC);
    await browser.sleep(100);
    await ccdPage.get(caseUrl);
});

Given(/^I switch to be a `?(?:|Legal Ops)(?:| A)`?$/, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsLegalOpsA);
    await browser.sleep(100);
    await ccdPage.get(caseUrl);
});

Given(/^I switch to be a `?(?:|Judicial)`?$/, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsJudicial);
    await browser.sleep(100);
    await ccdPage.get(caseUrl);
});

Given(/^I switch to be a `?(?:|WaAdmin)`?$/, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsWaAdmin);
    await browser.sleep(100);
    await ccdPage.get(caseUrl);
});
Then(/^I should be redirected to the `Sign In` page(?:| instead)$/, async function () {
    await idamSignInPage.waitUntilLoaded();
    expect(await ccdPage.isLoaded()).to.equal(false);
    expect(await idamSignInPage.isLoaded()).to.equal(true);
});

Given(/^I am signed in as a `?(?:Admin Officer Bails)`?$/, async function () {
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsAdminOfficerBails);
});

Given(/^I am signed in as a `?(?:Judge Bails)`?$/, async function () {
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsJudgeBails);
});

Given(/^I am signed in as(?:| a) `?(?:|Legal Org User Rep)(?:| A Bails)`?$/, async function () {
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsLawFirmOrgUserABails);
});

Given(/^I am signed in as(?:| a) `?(?:|Legal Org User Rep)(?:| B Bails)`?$/, async function () {
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsLawFirmOrgUserBBails);
});

When(/^I sign back in as(?:| a) `?(?:|Legal Org User Rep)(?:| A Bails)`?$/, async function () {
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsLawFirmOrgUserABails);
});

Given(/^I switch to be a `?(?:Judge Bails)`?$/, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsJudgeBails);
    await browser.sleep(100);
    // await ccdPage.contentContains('Immigration');
    await ccdPage.get(caseUrl);
    // await ccdPage.contentContains('Immigration');
    await browser.sleep(7000);
    if (!await ccdPage.overViewContains('Overview')) {
        await ccdPage.get(caseUrl);
    }
});

Given(/^I switch to be a `?(?:|Legal Org User Rep)(?:| A Bails)`?$/, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsLawFirmOrgUserABails);
    await browser.sleep(100);
    await ccdPage.get(caseUrl);
    await browser.sleep(7000);
    if (!await ccdPage.overViewContains('Overview')) {
        await ccdPage.get(caseUrl);
    }
});

Given(/^I switch to be a `?(?:|Legal Org User Rep)(?:| B Bails)`?$/, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsLawFirmOrgUserBBails);
    await browser.sleep(100);
    await ccdPage.get(caseUrl);
    await browser.sleep(7000);
    if (!await ccdPage.overViewContains('Overview')) {
        await ccdPage.get(caseUrl);
    }
});

Given(/^I switch to be a `?(?:Admin Officer Bails)`?$/, async function () {
    await browser.sleep(100);
    const currentUrl = await ccdPage.getCurrentUrl();
    const caseUrl = currentUrl.match(caseUrlMatcher)[0];
    await authenticationFlow.signInWithExUiLoad(authenticationFlow.signInAsAdminOfficerBails);
    await browser.sleep(100);
    await ccdPage.get(caseUrl);
    await browser.sleep(7000);
    if (!await ccdPage.overViewContains('Overview')) {
        await ccdPage.get(caseUrl);
    }
});
