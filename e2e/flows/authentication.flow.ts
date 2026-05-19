import { browser } from 'protractor';
import { IdamSignInPage } from '../pages/idam-sign-in.page';
import { CcdPage } from "../pages/ccd.page";

const iaConfig = require('../ia.conf');

export type UserRole =
  'Case Officer' |
  'Sr Case Officer' |
  'Admin Officer' |
  'Legal Rep' |
  'Home Office APC' |
  'Home Office LART' |
  'Home Office POU' |
  'Home Office Generic' |
  'Home Office Bails' |
  'Judge' |
  'Legal Org User Rep A' |
  'Legal Org User Rep B' |
  'Legal Org User Rep C' |
  'Legal Org User Rep D' |
  'Legal Org User Rep Creator' |
  'Legal Org2 User Rep Creator' |
  'Legal Ops A' |
  'Judicial' |
  'WaAdmin' |
  'Judge Bails' |
  'Legal Org User Rep A Bails' |
  'Legal Org User Rep B Bails';

let caseOfficerCookies;
let srCaseOfficerCookies;
let adminOfficerCookies;
let legalRepCookies;
let homeOfficeAPCCookies;
let homeOfficeLARTCookies;
let homeOfficePOUCookies;
let homeOfficeGenericCookies;
let homeOfficeBailsCookies;
let judgeCookies;
let legalOrgUserRepACookies;
let legalOrgUserRepBCookies;
let legalOrgUserRepCCookies;
let legalOrgUserRepDCookies;
let legalOrgUserRepCreatorCookies;
let legalOrg2UserRepCreatorCookies;
let legalOpsACookies;
let judicialCookies;
let waAdminCookies;
let judgeBailsCookies;
let legalOrgUserRepABailsCookies;
let legalOrgUserRepBBailsCookies;

export class AuthenticationFlow {
  private idamSignInPage = new IdamSignInPage();
  private ccdPage = new CcdPage();

  async signOut() {
    await browser.waitForAngularEnabled(false);
    await browser.driver.manage().deleteAllCookies();
    await browser.get(`${iaConfig.CcdWebUrl}/auth/logout`);
    await browser.sleep(3000);
    await browser.get(`${iaConfig.CcdWebUrl}/`);
    await this.idamSignInPage.waitUntilLoaded();
  }

  getCookiesByRole(role: UserRole) {
    switch (role) {
    case 'Case Officer':
      return caseOfficerCookies;
    case 'Sr Case Officer':
      return srCaseOfficerCookies;
    case 'Admin Officer':
      return adminOfficerCookies;
    case 'Legal Rep':
      return legalRepCookies;
    case 'Home Office APC':
      return homeOfficeAPCCookies;
    case 'Home Office LART':
      return homeOfficeLARTCookies;
    case 'Home Office POU':
      return homeOfficePOUCookies;
    case 'Home Office Generic':
      return homeOfficeGenericCookies;
    case 'Home Office Bails':
      return homeOfficeBailsCookies;
    case 'Judge':
      return judgeCookies;
    case 'Legal Org User Rep A':
      return legalOrgUserRepACookies;
    case 'Legal Org User Rep B':
      return legalOrgUserRepBCookies;
    case 'Legal Org User Rep C':
      return legalOrgUserRepCCookies;
    case 'Legal Org User Rep D':
      return legalOrgUserRepDCookies;
    case 'Legal Org User Rep Creator':
      return legalOrgUserRepCreatorCookies;
    case 'Legal Org2 User Rep Creator':
      return legalOrg2UserRepCreatorCookies;
    case 'Legal Ops A':
      return legalOpsACookies;
    case 'Judicial':
      return judicialCookies;
    case 'WaAdmin':
      return waAdminCookies;
    case 'Judge Bails':
      return judgeBailsCookies;
    case 'Legal Org User Rep A Bails':
      return legalOrgUserRepABailsCookies;
    case 'Legal Org User Rep B Bails':
      return legalOrgUserRepBBailsCookies;
    }
  }

  setCookiesByRole(role: UserRole, cookies) {
    switch (role) {
    case 'Case Officer':
      caseOfficerCookies = cookies;
      return;
    case 'Sr Case Officer':
      srCaseOfficerCookies = cookies;
      return;
    case 'Admin Officer':
      adminOfficerCookies = cookies;
      return;
    case 'Legal Rep':
      legalRepCookies = cookies;
      return;
    case 'Home Office APC':
      homeOfficeAPCCookies = cookies;
      return;
    case 'Home Office LART':
      homeOfficeLARTCookies = cookies;
      return;
    case 'Home Office POU':
      homeOfficePOUCookies = cookies;
      return;
    case 'Home Office Generic':
      homeOfficeGenericCookies = cookies;
      return;
    case 'Home Office Bails':
      homeOfficeBailsCookies = cookies;
      return;
    case 'Judge':
      judgeCookies = cookies;
      return;
    case 'Legal Org User Rep A':
      legalOrgUserRepACookies = cookies;
      return;
    case 'Legal Org User Rep B':
      legalOrgUserRepBCookies = cookies;
      return;
    case 'Legal Org User Rep C':
      legalOrgUserRepCCookies = cookies;
      return;
    case 'Legal Org User Rep D':
      legalOrgUserRepDCookies = cookies;
      return;
    case 'Legal Org User Rep Creator':
      legalOrgUserRepCreatorCookies = cookies;
      return;
    case 'Legal Org2 User Rep Creator':
      legalOrg2UserRepCreatorCookies = cookies;
      return;
    case 'Legal Ops A':
      legalOpsACookies = cookies;
      return;
    case 'Judicial':
      judicialCookies = cookies;
      return;
    case 'WaAdmin':
      waAdminCookies = cookies;
      return;
    case 'Judge Bails':
      judgeBailsCookies = cookies;
      return;
    case 'Legal Org User Rep A Bails':
      legalOrgUserRepABailsCookies = cookies;
      return;
    case 'Legal Org User Rep B Bails':
      legalOrgUserRepBBailsCookies = cookies;
      return;
    }
  }

  async loadCookiesByRole(role: UserRole) {
    await browser.manage().deleteAllCookies();
    await Promise.all(this.getCookiesByRole(role).map((cookie) => browser.manage().addCookie(cookie)));
    await this.ccdPage.get(`${iaConfig.CcdWebUrl}/cases`);
    await this.checkExUiLoaded();
  }

  async signInByRole(role: UserRole) {
    const cookies = await this.getCookiesByRole(role);
    if (cookies) {
      return this.loadCookiesByRole(role);
    } else {
      switch (role) {
      case 'Case Officer':
        await this.signInAsCaseOfficer();
        break;
      case 'Sr Case Officer':
        await this.signInAsSrCaseOfficer();
        break;
      case 'Admin Officer':
        await this.signInAsAdminOfficer();
        break;
      case 'Legal Rep':
        await this.signInAsLawFirmA();
        break;
      case 'Home Office APC':
        await this.signInAsHomeOfficeApc();
        break;
      case 'Home Office LART':
        await this.signInAsHomeOfficeLart();
        break;
      case 'Home Office POU':
        await this.signInAsHomeOfficePou();
        break;
      case 'Home Office Generic':
        await this.signInAsHomeOfficeGeneric();
        break;
      case 'Home Office Bails':
        await this.signInAsHomeOfficeBails();
        break;
      case 'Judge':
        await this.signInAsJudge();
        break;
      case 'Legal Org User Rep A':
        await this.signInAsLawFirmOrgUserA();
        break;
      case 'Legal Org User Rep B':
        await this.signInAsLawFirmOrgUserB();
        break;
      case 'Legal Org User Rep C':
        await this.signInAsLawFirmOrgUserC();
        break;
      case 'Legal Ops A':
        await this.signInAsLegalOpsA();
        break;
      case 'Judicial':
        await this.signInAsJudicial();
        break;
      case 'WaAdmin':
        await this.signInAsWaAdmin();
        break;
      case 'Judge Bails':
        await this.signInAsJudgeBails();
        break;
      case 'Legal Org User Rep A Bails':
        await this.signInAsLawFirmOrgUserABails();
        break;
      case 'Legal Org User Rep B Bails':
        await this.signInAsLawFirmOrgUserBBails();
        break;
      case 'Legal Org User Rep D':
        await this.signInAsLawFirmOrgUserD();
        break;
      case 'Legal Org User Rep Creator':
        await this.signInAsLawFirmOrgCreator();
        break;
      case 'Legal Org2 User Rep Creator':
        await this.signInAsLawFirmOrg2Creator();
        break;
      default:
        throw new Error(`Unknown role: ${role}`);
      }
      const newCookies = await browser.manage().getCookies();
      this.setCookiesByRole(role, newCookies);
    }
  }

  async signInAsCaseOfficer() {
    for (let i = 0; i < 5; i++) {
      try {
        await this.signOut();
        await this.idamSignInPage.signIn(iaConfig.TestCaseOfficerUserName, iaConfig.TestCaseOfficerPassword);
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
        await this.idamSignInPage.signIn(iaConfig.TestSrCaseOfficerUserName, iaConfig.TestSrCaseOfficerPassword);
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
        await this.idamSignInPage.signIn(iaConfig.TestAdminOfficerUserName, iaConfig.TestAdminOfficerPassword);
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
        await this.idamSignInPage.signIn(iaConfig.TestHomeOfficeApcUserName, iaConfig.TestHomeOfficeApcPassword);
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
        await this.idamSignInPage.signIn(iaConfig.TestHomeOfficeLartUserName, iaConfig.TestHomeOfficeLartPassword);
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
        await this.idamSignInPage.signIn(iaConfig.TestHomeOfficePouUserName, iaConfig.TestHomeOfficePouPassword);
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
        await this.idamSignInPage.signIn(iaConfig.TestHomeOfficeGenericUserName, iaConfig.TestHomeOfficeGenericPassword);
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
        if (iaConfig.CcdWebUrl.includes('localhost')) {
          await this.idamSignInPage.signIn(iaConfig.TestHomeOfficeGenericUserName, iaConfig.TestHomeOfficeGenericPassword);
        } else {
          await this.idamSignInPage.signIn(iaConfig.TestHomeOfficeBailsUserName, iaConfig.TestHomeOfficeBailsPassword);
        }
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
        await this.idamSignInPage.signIn(iaConfig.TestLawFirmAUserName, iaConfig.TestLawFirmAPassword);
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
        await this.idamSignInPage.signIn(iaConfig.TestLawFirmBUserName, iaConfig.TestLawFirmBPassword);
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
        await this.idamSignInPage.signIn(iaConfig.TestLawFirmCUserName, iaConfig.TestLawFirmCPassword);
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
        await this.idamSignInPage.signIn(iaConfig.TestJudgeUserName, iaConfig.TestJudgePassword);
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
        await this.idamSignInPage.signIn(iaConfig.TestLawFirmOrgAUserName, iaConfig.TestLawFirmOrgAPassword);
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
        await this.idamSignInPage.signIn(iaConfig.TestLawFirmOrgBUserName, iaConfig.TestLawFirmOrgBPassword);
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
        if (iaConfig.CcdWebUrl.includes('localhost')) {
          await this.idamSignInPage.signIn(iaConfig.TestLawFirmOrg2CreatorUserName, iaConfig.TestLawFirmOrg2CreatorPassword);
        } else {
          await this.idamSignInPage.signIn(iaConfig.TestLawFirmOrgCUserName, iaConfig.TestLawFirmOrgCPassword);
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
        await this.idamSignInPage.signIn(iaConfig.TestLawFirmOrgDUserName, iaConfig.TestLawFirmOrgDPassword);
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
        await this.idamSignInPage.signIn(iaConfig.TestLawFirmOrgCreatorUserName, iaConfig.TestLawFirmOrgCreatorPassword);
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
        await this.idamSignInPage.signIn(iaConfig.TestLawFirmOrg2CreatorUserName, iaConfig.TestLawFirmOrg2CreatorPassword);
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
        await this.idamSignInPage.signIn(iaConfig.TestLegalOpsAUserName, iaConfig.TestLegalOpsAPassword);
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
        await this.idamSignInPage.signIn(iaConfig.TestJudicialUserName, iaConfig.TestJudicialPassword);
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
        await this.idamSignInPage.signIn(iaConfig.TestWaAdminUserName, iaConfig.TestWaAdminPassword);
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
        if (iaConfig.CcdWebUrl.includes('localhost')) {
          await this.idamSignInPage.signIn(iaConfig.TestJudgeUserName, iaConfig.TestJudgePassword);
        } else {
          await this.idamSignInPage.signIn(iaConfig.TestJudgeBailsUserName, iaConfig.TestJudgeBailsPassword);
        }
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
        if (iaConfig.CcdWebUrl.includes('localhost')) {
          await this.idamSignInPage.signIn(iaConfig.TestLawFirmOrgCreatorUserName, iaConfig.TestLawFirmOrgCreatorPassword);
        } else {
          await this.idamSignInPage.signIn(iaConfig.TestLawFirmOrgABailsUserName, iaConfig.TestLawFirmOrgABailsPassword);
        }
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
        if (iaConfig.CcdWebUrl.includes('demo')) {
          await this.idamSignInPage.signIn(iaConfig.TestLawFirmOrgBBailsUserName, iaConfig.TestLawFirmOrgBBailsPassword);
        } else {
          await this.idamSignInPage.signIn(iaConfig.TestLawFirmOrgBUserName, iaConfig.TestLawFirmOrgBPassword);
        }
        await this.checkExUiLoaded();
        break;
      } catch (err) {
        console.log('Unsuccessful log in');
        console.log(err);
      }
    }
  }

  async checkExUiLoaded() {
    await this.ccdPage.waitForSpinner();
    const signOutPath = '//a[contains(@class, "hmcts-header__navigation-link")][contains(text(), "Sign out")]';
    await this.ccdPage.waitForXpathElementVisible(signOutPath);
  }
}
