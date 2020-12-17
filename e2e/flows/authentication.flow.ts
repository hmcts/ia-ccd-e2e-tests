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

    async signOut() {
        await browser.waitForAngularEnabled(false);
        await browser.driver.manage().deleteAllCookies();
        await browser.get(iaConfig.CcdGatewayUrl + '/logout');
        await browser.manage().addCookie({name: 'XSRF-TOKEN', domain: 'manage-case.aat.platform.hmcts.net', value: 'QoH3QnzF-FBIUbHYUMb95GrQE_q_Qxlpkvzg'});
        await browser.manage().addCookie({name: '__auth__', domain: 'manage-case.aat.platform.hmcts.net', value: 'eyJ0eXAiOiJKV1QiLCJ6aXAiOiJOT05FIiwia2lkIjoiMWVyMFdSd2dJT1RBRm9qRTRyQy9mYmVLdTNJPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiJpYS5sZWdhbHJlcC5hLmNjZEBnbWFpbC5jb20iLCJjdHMiOiJPQVVUSDJfU1RBVEVMRVNTX0dSQU5UIiwiYXV0aF9sZXZlbCI6MCwiYXVkaXRUcmFja2luZ0lkIjoiYjcxZGI0MmYtNmJhZS00YTgxLWE4NjEtNDg4NTcyZmQwZWI5LTIxMTY4NDQ1IiwiaXNzIjoiaHR0cHM6Ly9mb3JnZXJvY2stYW0uc2VydmljZS5jb3JlLWNvbXB1dGUtaWRhbS1hYXQyLmludGVybmFsOjg0NDMvb3BlbmFtL29hdXRoMi9yZWFsbXMvcm9vdC9yZWFsbXMvaG1jdHMiLCJ0b2tlbk5hbWUiOiJhY2Nlc3NfdG9rZW4iLCJ0b2tlbl90eXBlIjoiQmVhcmVyIiwiYXV0aEdyYW50SWQiOiJUbnY3U19lVlZjdVNwWmRCbGVuR2dnMEtHNWciLCJub25jZSI6IkdaWUYyYTZmbVFIU0FobldLYlc2VlFVczQzTnM3TFc5WElGeVhkUVVGWXMiLCJhdWQiOiJ4dWl3ZWJhcHAiLCJuYmYiOjE2MDgyMDIyMjUsImdyYW50X3R5cGUiOiJhdXRob3JpemF0aW9uX2NvZGUiLCJzY29wZSI6WyJvcGVuaWQiLCJwcm9maWxlIiwicm9sZXMiLCJjcmVhdGUtdXNlciIsIm1hbmFnZS11c2VyIl0sImF1dGhfdGltZSI6MTYwODIwMjIyNCwicmVhbG0iOiIvaG1jdHMiLCJleHAiOjE2MDgyMzEwMjUsImlhdCI6MTYwODIwMjIyNSwiZXhwaXJlc19pbiI6Mjg4MDAsImp0aSI6IjM4VXdxdWlRM19VbW5relJUMnpFVnZGdVRQayJ9.ParR0sW11CTTbZpaO5PFQ8Pz46caPxERxYGT_l1itzu_sQneZEhKpDwEGklxtzD4YVy6b3RtotmmeBPjC0TGYqXIFv8bAjpiGwqik2HhbSxCmFS33PMpZnIBDgjUXHG482zAz_6wsNuMZZ8R2EclnRjT-eUC7V8a8TIBrifdBBxCmwVRW2p9GtIhWV60WRkHfeb6qynD1y5sOL2EOl_6IvzkU9Ky56Zl6Oi1fBO355CvWMBdzExpmOA05GJBOvjyPDydYcJNbgtHMS6NjH5zhxQq5CF_preAUZLgmDDwcGIzzSKJ6E66ilOu-Pmi5W8NMX7sHOMf4-kY8HRccvaF7g'});
        //await browser.manage().addCookie({name: '_oauth2_proxy', domain: 'manage-case.aat.platform.hmcts.net', value: 'eyJFbWFpbCI6InJvaGl0aC50aXJ1QGhtY3RzLm5ldCJ9|1607513931|-r64FCh8mhPWG_59mBS_P_6k0VM='});
        await browser.manage().addCookie({name: 'ai_user', domain: 'manage-case.aat.platform.hmcts.net', value: 'R/xh9|2020-11-20T16:56:58.039Z'});
        await browser.manage().addCookie({name: 'roles', domain: 'manage-case.aat.platform.hmcts.net', value: 'j%3A%5B%22caseworker-ia%22%2C%22caseworker%22%2C%22payments%22%2C%22caseworker-ia-legalrep-solicitor%22%5D'});
        await browser.get(iaConfig.CcdWebUrl + '/');
        await this.idamSignInPage.waitUntilLoaded();
    }

}
