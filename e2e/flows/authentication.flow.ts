import { browser, element, protractor, by } from 'protractor';
import { IdamSignInPage } from '../pages/idam-sign-in.page';

const iaConfig = require('../ia.conf');

export class AuthenticationFlow {

    private idamSignInPage = new IdamSignInPage();

    async signOut() {
        await browser.waitForAngularEnabled(false);
        await browser.driver.manage().deleteAllCookies();
        await browser.get(iaConfig.CcdWebUrl + '/auth/logout');
        await browser.get(iaConfig.CcdWebUrl + '/');
        await this.idamSignInPage.waitUntilLoaded();
    }

    async signInAsCaseOfficer() {
        for (let i = 0; i < 5; i++) {
            try {
                await this.signOut();
                await this.idamSignInPage.signIn(
                    iaConfig.TestCaseOfficerUserName,
                    iaConfig.TestCaseOfficerPassword
                );
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }

    async signInAsSrCaseOfficer() {
        for (let i = 0; i < 5; i++) {
            try {
                await this.signOut();
                await this.idamSignInPage.waitUntilLoaded();
                await this.idamSignInPage.signIn(
                    iaConfig.TestSrCaseOfficerUserName,
                    iaConfig.TestSrCaseOfficerPassword
                );
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }

    async signInAsAdminOfficer() {
        for (let i = 0; i < 5; i++) {
            try {
                await this.signOut();
                await this.idamSignInPage.waitUntilLoaded();
                await this.idamSignInPage.signIn(
                    iaConfig.TestAdminOfficerUserName,
                    iaConfig.TestAdminOfficerPassword
                );
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }

    async signInAsHomeOfficeApc() {
        for (let i = 0; i < 5; i++) {
            try {
                await this.signOut();
                await this.idamSignInPage.waitUntilLoaded();
                await this.idamSignInPage.signIn(
                    iaConfig.TestHomeOfficeApcUserName,
                    iaConfig.TestHomeOfficeApcPassword
                );
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }

    async signInAsHomeOfficeLart() {
        for (let i = 0; i < 5; i++) {
            try {
                await this.signOut();
                await this.idamSignInPage.waitUntilLoaded();
                await this.idamSignInPage.signIn(
                    iaConfig.TestHomeOfficeLartUserName,
                    iaConfig.TestHomeOfficeLartPassword
                );
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }

    async signInAsHomeOfficePou() {
        for (let i = 0; i < 5; i++) {
            try {
                await this.signOut();
                await this.idamSignInPage.waitUntilLoaded();
                await this.idamSignInPage.signIn(
                    iaConfig.TestHomeOfficePouUserName,
                    iaConfig.TestHomeOfficePouPassword
                );
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }

    async signInAsHomeOfficeGeneric() {
        for (let i = 0; i < 5; i++) {
            try {
                await this.signOut();
                await this.idamSignInPage.waitUntilLoaded();
                await this.idamSignInPage.signIn(
                    iaConfig.TestHomeOfficeGenericUserName,
                    iaConfig.TestHomeOfficeGenericPassword
                );
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }

    async signInAsHomeOfficeBails() {
        for (let i = 0; i < 5; i++) {
            try {
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
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }

    async signInAsJudiciary() {
        for (let i = 0; i < 5; i++) {
            try {
                await this.signOut();
                await this.idamSignInPage.waitUntilLoaded();
                await this.idamSignInPage.signIn(
                    iaConfig.TestJudiciaryUserName,
                    iaConfig.TestJudiciaryPassword
                );
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }

    async signInAsLawFirmA() {
        for (let i = 0; i < 5; i++) {
            try {
                await this.signOut();
                await this.idamSignInPage.waitUntilLoaded();
                await this.idamSignInPage.signIn(
                    iaConfig.TestLawFirmAUserName,
                    iaConfig.TestLawFirmAPassword
                );
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }

    async signInAsLawFirmB() {
        for (let i = 0; i < 5; i++) {
            try {
                await this.signOut();
                await this.idamSignInPage.waitUntilLoaded();
                await this.idamSignInPage.signIn(
                    iaConfig.TestLawFirmBUserName,
                    iaConfig.TestLawFirmBPassword
                );
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }

    async signInAsLawFirmC() {
        for (let i = 0; i < 5; i++) {
            try {
                await this.signOut();
                await this.idamSignInPage.waitUntilLoaded();
                await this.idamSignInPage.signIn(
                    iaConfig.TestLawFirmCUserName,
                    iaConfig.TestLawFirmCPassword
                );
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }

    async signInAsJudge() {
        for (let i = 0; i < 5; i++) {
            try {
                await this.signOut();
                await this.idamSignInPage.waitUntilLoaded();
                await this.idamSignInPage.signIn(
                    iaConfig.TestJudgeUserName,
                    iaConfig.TestJudgePassword
                );
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }

    async signInAsLawFirmOrgUserA() {
        for (let i = 0; i < 5; i++) {
            try {
                await this.signOut();
                await this.idamSignInPage.waitUntilLoaded();
                await this.idamSignInPage.signIn(
                    iaConfig.TestLawFirmOrgAUserName,
                    iaConfig.TestLawFirmOrgAPassword
                );
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }

    async signInAsLawFirmOrgUserB() {
        for (let i = 0; i < 5; i++) {
            try {
                await this.signOut();
                await this.idamSignInPage.waitUntilLoaded();
                await this.idamSignInPage.signIn(
                    iaConfig.TestLawFirmOrgBUserName,
                    iaConfig.TestLawFirmOrgBPassword
                );
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }

    async signInAsLawFirmOrgUserC() {
        for (let i = 0; i < 5; i++) {
            try {
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
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }
    async signInAsLawFirmOrgUserD() {
        for (let i = 0; i < 5; i++) {
            try {
                await this.signOut();
                await this.idamSignInPage.waitUntilLoaded();
                await this.idamSignInPage.signIn(
                    iaConfig.TestLawFirmOrgDUserName,
                    iaConfig.TestLawFirmOrgDPassword
                );
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }

    async signInAsLawFirmOrgCreator() {
        for (let i = 0; i < 5; i++) {
            try {
                await this.signOut();
                await this.idamSignInPage.waitUntilLoaded();
                await this.idamSignInPage.signIn(
                    iaConfig.TestLawFirmOrgCreatorUserName,
                    iaConfig.TestLawFirmOrgCreatorPassword
                );
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }

    async signInAsLawFirmOrg2Creator() {
        for (let i = 0; i < 5; i++) {
            try {
                await this.signOut();
                await this.idamSignInPage.waitUntilLoaded();
                await this.idamSignInPage.signIn(
                    iaConfig.TestLawFirmOrg2CreatorUserName,
                    iaConfig.TestLawFirmOrg2CreatorPassword
                );
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }

    async signInAsLegalOpsA() {
        for (let i = 0; i < 5; i++) {
            try {
                await this.signOut();
                await this.idamSignInPage.waitUntilLoaded();
                await this.idamSignInPage.signIn(
                    iaConfig.TestLegalOpsAUserName,
                    iaConfig.TestLegalOpsAPassword
                );
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }
    async signInAsJudicial() {
        for (let i = 0; i < 5; i++) {
            try {
                await this.signOut();
                await this.idamSignInPage.waitUntilLoaded();
                await this.idamSignInPage.signIn(
                    iaConfig.TestJudicialUserName,
                    iaConfig.TestJudicialPassword
                );
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }
    async signInAsWaAdmin() {
        for (let i = 0; i < 5; i++) {
            try {
                await this.signOut();
                await this.idamSignInPage.waitUntilLoaded();
                await this.idamSignInPage.signIn(
                    iaConfig.TestWaAdminUserName,
                    iaConfig.TestWaAdminPassword
                );
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }

    async signInAsAdminOfficerBails() {
        for (let i = 0; i < 5; i++) {
            try {
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
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }

    async signInAsJudgeBails() {
        for (let i = 0; i < 5; i++) {
            try {
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
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }

    async signInAsLawFirmOrgUserABails() {
        for (let i = 0; i < 5; i++) {
            try {
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
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }

    async signInAsLawFirmOrgUserBBails() {
        for (let i = 0; i < 5; i++) {
            try {
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
                await this.checkExUiLoaded();
                break;
            } catch (err) {
                console.log('Unsuccessful log in');
                console.log(err);
            }
        }
    }

    async checkExUiLoaded() {
        let EC = protractor.ExpectedConditions;
        await browser.wait(EC.visibilityOf(element(by.linkText('Sign out'))), 30000);
        await browser.wait(EC.visibilityOf(element(by.css('h2#search-result-heading__text'))), 30000);
        await browser.wait(EC.invisibilityOf(element(by.css('div.spinner-container'))), 30000);
    }
}
