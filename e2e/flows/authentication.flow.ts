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
        await browser.manage().addCookie({name: 'XSRF-TOKEN', domain: 'manage-case.demo.platform.hmcts.net', value: 'YLe4qIKj--9u-22xHtm5Zz9zqjlf6eXdfzOc'});
        await browser.manage().addCookie({name: '__auth__', domain: 'manage-case.demo.platform.hmcts.net', value: 'eyJ0eXAiOiJKV1QiLCJ6aXAiOiJOT05FIiwia2lkIjoiWjRCY2pWZ2Z2dTVaZXhLekJFRWxNU200M0xzPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiJpYS5sZWdhbHJlcC5hLmNjZEBnbWFpbC5jb20iLCJjdHMiOiJPQVVUSDJfU1RBVEVMRVNTX0dSQU5UIiwiYXV0aF9sZXZlbCI6MCwiYXVkaXRUcmFja2luZ0lkIjoiMjE0ODFmYWQtYWMwOS00NDlkLTg1ODItOTgwNjlmNTk1MDllLTYwODk4OTQiLCJpc3MiOiJodHRwczovL2Zvcmdlcm9jay1hbS5zZXJ2aWNlLmNvcmUtY29tcHV0ZS1pZGFtLWRlbW8uaW50ZXJuYWw6ODQ0My9vcGVuYW0vb2F1dGgyL3JlYWxtcy9yb290L3JlYWxtcy9obWN0cyIsInRva2VuTmFtZSI6ImFjY2Vzc190b2tlbiIsInRva2VuX3R5cGUiOiJCZWFyZXIiLCJhdXRoR3JhbnRJZCI6Ik9wRUhBWXBYamdING0ydHVDVGRCcXN1akhjcyIsIm5vbmNlIjoiRDVkLXIxeFZvcXhZWkVzaFA2emZiLXdBR1g5NmM2VHRUS0VDUHdRTTdrMCIsImF1ZCI6Inh1aXdlYmFwcCIsIm5iZiI6MTYwNzY5NTY4NSwiZ3JhbnRfdHlwZSI6ImF1dGhvcml6YXRpb25fY29kZSIsInNjb3BlIjpbIm9wZW5pZCIsInByb2ZpbGUiLCJyb2xlcyIsImNyZWF0ZS11c2VyIiwibWFuYWdlLXVzZXIiXSwiYXV0aF90aW1lIjoxNjA3Njk1Njg1LCJyZWFsbSI6Ii9obWN0cyIsImV4cCI6MTYwNzcyNDQ4NSwiaWF0IjoxNjA3Njk1Njg1LCJleHBpcmVzX2luIjoyODgwMCwianRpIjoiRWJsWDZELVVyOEJOcUpBT3pHNUktRzMzbXI0In0.BmhebPAq7zZiBmVA8u0ttRGh58LKqoFlpvuF78SaEGM2q6qyLQKijf4KIgdIL5PfwlNhIeUNRbFb1TgoSElJfAhr4ny1PCS2Z4luqAfLW01hz0uq83RuRnTT1W1000aiytScnqFTJgVpOdSw0b_qDOj585AhVzPxo0n9alH-Fm_rwPN2aW5SSX8u1fuBR_bZSVihv9ZB4Ml10mufFJZ-fryfxYjo6ceYEj0VbJLC09xcBNfrZ0VrEVdAC6eLF7-pZJBZZOJK9nFsi8wQYqeIsV4Za75E2aQ0JMJrx6-AWNMTWRqgwRcf0JrRBpdYSiYmV3v_5VSeS-NUReV6cYO-FQ'});
        await browser.manage().addCookie({name: '_oauth2_proxy', domain: 'manage-case.demo.platform.hmcts.net', value: 'eyJFbWFpbCI6InJvaGl0aC50aXJ1QGhtY3RzLm5ldCJ9|1607513931|-r64FCh8mhPWG_59mBS_P_6k0VM='});
        await browser.manage().addCookie({name: 'ai_user', domain: 'manage-case.demo.platform.hmcts.net', value: 'm6YWZ|2020-12-02T12:02:59.563Z'});
        await browser.manage().addCookie({name: 'roles', domain: 'manage-case.demo.platform.hmcts.net', value: 'j%3A%5B%22caseworker-ia%22%2C%22caseworker%22%2C%22payments%22%2C%22caseworker-ia-legalrep-solicitor%22%5D'});
        await browser.get(iaConfig.CcdWebUrl + '/');
        await this.idamSignInPage.waitUntilLoaded();
    }

}
