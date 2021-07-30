import { browser } from 'protractor';
import { IdamSignInPage } from '../pages/idam-sign-in.page';

const iaConfig = require('../ia.conf');

export class AuthenticationFlow {

    private idamSignInPage = new IdamSignInPage();

    async signInAsCaseOfficer() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestCaseOfficerUserName,
            iaConfig.TestCaseOfficerPassword
        );
    }

    async signInAsAdminOfficer() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestAdminOfficerUserName,
            iaConfig.TestAdminOfficerPassword
        );
    }

    async signInAsHomeOfficeApc() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestHomeOfficeApcUserName,
            iaConfig.TestHomeOfficeApcPassword
        );
    }

    async signInAsHomeOfficeLart() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestHomeOfficeLartUserName,
            iaConfig.TestHomeOfficeLartPassword
        );
    }

    async signInAsHomeOfficePou() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestHomeOfficePouUserName,
            iaConfig.TestHomeOfficePouPassword
        );
    }

    async signInAsHomeOfficeGeneric() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestHomeOfficeGenericUserName,
            iaConfig.TestHomeOfficeGenericPassword
        );
    }

    async signInAsJudiciary() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestJudiciaryUserName,
            iaConfig.TestJudiciaryPassword
        );
    }

    async signInAsLawFirmA() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestLawFirmAUserName,
            iaConfig.TestLawFirmAPassword
        );
    }

    async signInAsLawFirmB() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestLawFirmBUserName,
            iaConfig.TestLawFirmBPassword
        );
    }

    async signInAsLawFirmC() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestLawFirmCUserName,
            iaConfig.TestLawFirmCPassword
        );
    }

    async signInAsJudge() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestJudgeUserName,
            iaConfig.TestJudgePassword
        );
    }

    async signInAsLawFirmOrgUserA() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestLawFirmOrgSuccessUserName,
            iaConfig.TestLawFirmOrgSuccessPassword
        );
    }

    async signInAsLawFirmOrgUserB() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestLawFirmOrgBUserName,
            iaConfig.TestLawFirmOrgBPassword
        );
    }

    async signInAsLawFirmOrgUserC() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestLawFirmOrgCUserName,
            iaConfig.TestLawFirmOrgCPassword
        );
    }
    async signInAsLawFirmOrgUserD() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestLawFirmOrgDUserName,
            iaConfig.TestLawFirmOrgDPassword
        );
    }

    async signInAsLawFirmOrgCreator() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestLawFirmOrgCreatorUserName,
            iaConfig.TestLawFirmOrgCreatorPassword
        );
    }

    async signInAsLawFirmOrg2Creator() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestLawFirmOrg2CreatorUserName,
            iaConfig.TestLawFirmOrg2CreatorPassword
        );
    }

    async signOut() {
        await browser.waitForAngularEnabled(false);
        await browser.driver.manage().deleteAllCookies();
        await browser.get(iaConfig.CcdGatewayUrl + '/logout');
        await browser.get(iaConfig.CcdWebUrl + '/');
        await this.idamSignInPage.waitUntilLoaded();
    }

}
