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
        await browser.manage().addCookie({name: 'XSRF-TOKEN', domain: 'manage-case.demo.platform.hmcts.net', value: 'yNjF9HGw-0Kw6aWmAy2JUNPkSbA4ChfEbM6U'});
        await browser.manage().addCookie({name: '__auth__', domain: 'manage-case.demo.platform.hmcts.net', value: 'eyJ0eXAiOiJKV1QiLCJ6aXAiOiJOT05FIiwia2lkIjoiWjRCY2pWZ2Z2dTVaZXhLekJFRWxNU200M0xzPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiJpYS5sZWdhbHJlcC5hLmNjZEBnbWFpbC5jb20iLCJjdHMiOiJPQVVUSDJfU1RBVEVMRVNTX0dSQU5UIiwiYXV0aF9sZXZlbCI6MCwiYXVkaXRUcmFja2luZ0lkIjoiYzRjNTJiZTMtOWM0OC00NzNlLThjOWQtZTY2N2I1MGI5MThiLTM0ODg0NTUiLCJpc3MiOiJodHRwczovL2Zvcmdlcm9jay1hbS5zZXJ2aWNlLmNvcmUtY29tcHV0ZS1pZGFtLWRlbW8uaW50ZXJuYWw6ODQ0My9vcGVuYW0vb2F1dGgyL3JlYWxtcy9yb290L3JlYWxtcy9obWN0cyIsInRva2VuTmFtZSI6ImFjY2Vzc190b2tlbiIsInRva2VuX3R5cGUiOiJCZWFyZXIiLCJhdXRoR3JhbnRJZCI6IkxVZ1pmRzN5UVJtT2JXWHFzOFlGMWM2ZlVFSSIsIm5vbmNlIjoiVHlhcWxjYy1ycW1BNFRfanB4Q2Q5eWtYc0V4ZlA5WXlEM2lrcDU3LWFIUSIsImF1ZCI6Inh1aXdlYmFwcCIsIm5iZiI6MTYxOTUyOTQyOCwiZ3JhbnRfdHlwZSI6ImF1dGhvcml6YXRpb25fY29kZSIsInNjb3BlIjpbIm9wZW5pZCIsInByb2ZpbGUiLCJyb2xlcyIsImNyZWF0ZS11c2VyIiwibWFuYWdlLXVzZXIiXSwiYXV0aF90aW1lIjoxNjE5NTI5NDI3LCJyZWFsbSI6Ii9obWN0cyIsImV4cCI6MTYxOTU1ODIyOCwiaWF0IjoxNjE5NTI5NDI4LCJleHBpcmVzX2luIjoyODgwMCwianRpIjoiNHNKaThERzdpUnhCN2pVM3JjUG80VVc5dWFjIn0.htSyVoF_0fhGVWzsV2G1xZ15rrsaeaiFjbap6BpoI-_pfghg-SZojN2AlH-6ZUMTZKqv3iBhFBB_IPWZAelWsePJlpJ5hUc2NyHeJ-W98XNOYecm9C01NLaYqSrVpAkSnghngxxKfmbGWKLVe_AZHOgy_5APyuWmcHlnOJZCPVuxcrO1S6Bs70FpybHH0TPFkcL3AYwqieWfTnkftAxmTUEVzr4rNEFrkSHy8N_CK9owElYgWAYyuhUig0J-stCeuLprnpF3-bkTLrSIAQBkIoVdMyEuY5CRvkCvCKnGuBY6xlec6dK45MdxSIKuS-RONQ7lo1tfN3JxlqFJKeEMEw'});
        await browser.manage().addCookie({name: '_oauth2_proxy', domain: 'manage-case.demo.platform.hmcts.net', value: 'eyJFbWFpbCI6InJvaGl0aC50aXJ1QGhtY3RzLm5ldCJ9|1619529423|diu0VrrgLV30yNkfFknX95WPDYQ='});
        await browser.manage().addCookie({name: 'ai_user', domain: 'manage-case.demo.platform.hmcts.net', value: 'm6YWZ|2020-12-02T12:02:59.563Z'});
        await browser.get(iaConfig.CcdWebUrl + '/');
        await this.idamSignInPage.waitUntilLoaded();
    }

}
