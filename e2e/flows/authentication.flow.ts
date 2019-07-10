import { browser } from 'protractor';
import { IdamSignInPage } from '../pages/idam-sign-in.page';
import { AnyPage } from '../pages/any.page';

const iaConfig = require('../ia.conf');

export class AuthenticationFlow {

    private idamSignInPage = new IdamSignInPage();
    private anyPage = new AnyPage();

    async signInAsCaseOfficer() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestCaseOfficerUserName,
            iaConfig.TestCaseOfficerPassword
        );
        await this.anyPage.contentContains('Case List');
        await this.waitForAngularIfRequired();
    }

    async signInAsAdmin() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestAdminUserName,
            iaConfig.TestAdminPassword
        );
        await this.anyPage.contentContains('Case List');
        await this.waitForAngularIfRequired();
    }

    async signInAsJudiciary() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestJudiciaryUserName,
            iaConfig.TestJudiciaryPassword
        );
        await this.anyPage.contentContains('Case List');
        await this.waitForAngularIfRequired();
    }

    async signInAsLawFirmA() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestLawFirmAUserName,
            iaConfig.TestLawFirmAPassword
        );
        await this.anyPage.contentContains('Case List');
        await this.waitForAngularIfRequired();
    }

    async signInAsLawFirmB() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestLawFirmBUserName,
            iaConfig.TestLawFirmBPassword
        );
        await this.anyPage.contentContains('Case List');
        await this.waitForAngularIfRequired();
    }

    async signInAsLawFirmC() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestLawFirmCUserName,
            iaConfig.TestLawFirmCPassword
        );
        await this.anyPage.contentContains('Case List');
        await this.waitForAngularIfRequired();
    }

    async signOut() {
        await browser.waitForAngularEnabled(false);
        await browser.driver.manage().deleteAllCookies();
        await browser.get(iaConfig.CcdGatewayUrl + '/logout');
        await browser.get(iaConfig.CcdWebUrl + '/');
        await this.idamSignInPage.waitUntilLoaded();
    }

    async waitForAngularIfRequired() {
        if (iaConfig.WaitForAngular) {
            await browser.waitForAngularEnabled(true);
        }
    }
}
