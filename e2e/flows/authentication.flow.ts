import { browser, element, protractor, by } from 'protractor';
import { IdamSignInPage } from '../pages/idam-sign-in.page';

const iaConfig = require('../ia.conf');

export class AuthenticationFlow {

    private idamSignInPage = new IdamSignInPage();

    async signInAsCaseOfficer() {
        await this.signOut();
        await this.idamSignInPage.signIn(
            iaConfig.TestCaseOfficerUserName,
            iaConfig.TestCaseOfficerPassword
        );
    }

    async signInAsSrCaseOfficer() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestSrCaseOfficerUserName,
            iaConfig.TestSrCaseOfficerPassword
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

    async signInAsHomeOfficeBails() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        if (iaConfig.CcdWebUrl.includes('localhost') ) {
            await this.idamSignInPage.signIn(
                iaConfig.TestHomeOfficeGenericUserName,
                iaConfig.TestHomeOfficeGenericPassword
        )} else {
            await this.idamSignInPage.signIn(
                iaConfig.TestHomeOfficeBailsUserName,
                iaConfig.TestHomeOfficeBailsPassword
        )}
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
            iaConfig.TestLawFirmOrgAUserName,
            iaConfig.TestLawFirmOrgAPassword
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
        if (iaConfig.CcdWebUrl.includes('localhost') ) {
            await this.idamSignInPage.signIn(
                iaConfig.TestLawFirmOrg2CreatorUserName,
                iaConfig.TestLawFirmOrg2CreatorPassword
        )} else {
            await this.idamSignInPage.signIn(
                iaConfig.TestLawFirmOrgCUserName,
                iaConfig.TestLawFirmOrgCPassword
            );
        }
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

    async signInAsLegalOpsA() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestLegalOpsAUserName,
            iaConfig.TestLegalOpsAPassword
        );
    }
    async signInAsJudicial() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestJudicialUserName,
            iaConfig.TestJudicialPassword
        );
    }
    async signInAsWaAdmin() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        await this.idamSignInPage.signIn(
            iaConfig.TestWaAdminUserName,
            iaConfig.TestWaAdminPassword
        );
    }

    async signOut() {
        await browser.waitForAngularEnabled(false);
        await browser.driver.manage().deleteAllCookies();
        await browser.get(iaConfig.CcdWebUrl + '/auth/logout');
        await browser.get(iaConfig.CcdWebUrl + '/');
        await this.idamSignInPage.waitUntilLoaded();
    }

    async signInAsAdminOfficerBails() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        if (iaConfig.CcdWebUrl.includes('localhost') ) {
            await this.idamSignInPage.signIn(
                iaConfig.TestAdminOfficerUserName,
                iaConfig.TestAdminOfficerPassword
        )} else {
            await this.idamSignInPage.signIn(
                iaConfig.TestAdminOfficerBailsUserName,
                iaConfig.TestAdminOfficerBailsPassword
        )}
    }

    async signInAsJudgeBails() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        if (iaConfig.CcdWebUrl.includes('localhost') ) {
            await this.idamSignInPage.signIn(
                iaConfig.TestJudgeUserName,
                iaConfig.TestJudgePassword
        )} else {
            await this.idamSignInPage.signIn(
                iaConfig.TestJudgeBailsUserName,
                iaConfig.TestJudgeBailsPassword
        )}
    }

    async signInAsLawFirmOrgUserABails() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        if (iaConfig.CcdWebUrl.includes('localhost') ) {
            await this.idamSignInPage.signIn(
                iaConfig.TestLawFirmOrgCreatorUserName,
                iaConfig.TestLawFirmOrgCreatorPassword
        )} else {
            await this.idamSignInPage.signIn(
                iaConfig.TestLawFirmOrgABailsUserName,
                iaConfig.TestLawFirmOrgABailsPassword
        )}
    }

    async signInAsLawFirmOrgUserBBails() {
        await this.signOut();
        await this.idamSignInPage.waitUntilLoaded();
        if (iaConfig.CcdWebUrl.includes('demo') ) {
            await this.idamSignInPage.signIn(
                iaConfig.TestLawFirmOrgBBailsUserName,
                iaConfig.TestLawFirmOrgBBailsPassword
        )} else {
            await this.idamSignInPage.signIn(
               iaConfig.TestLawFirmOrgBUserName,
               iaConfig.TestLawFirmOrgBPassword
        )}
    }

    async checkExUiLoaded() {
        let EC = protractor.ExpectedConditions;
        await browser.wait(EC.visibilityOf(element(by.linkText('Sign out'))), 30000);
        await browser.wait(EC.visibilityOf(element(by.linkText('Filters'))), 30000);
        await browser.wait(EC.invisibilityOf(element(by.css('div.spinner'))), 30000);
    }

    async signInWithExUiLoad(signInType) {
        for (let i = 0; i < 5; i++) {
            try {
                await signInType();
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }
}
