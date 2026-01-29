import { UserInfo } from "../aip/idam-service";

const iaConfig = require('../ia.conf');
const legalRepUserName: string = iaConfig.TestLawFirmOrgAUserName;
const legalRepPassword: string = iaConfig.TestLawFirmOrgAPassword;
const legalRepBailUserName: string = iaConfig.TestLawFirmOrgABailsUserName;
const legalRepBailPassword: string = iaConfig.TestLawFirmOrgABailsPassword;
const adminOfficerBailUserName: string = iaConfig.TestAdminOfficerBailsUserName;
const adminOfficerBailPassword: string = iaConfig.TestAdminOfficerBailsPassword;
const homeOfficeBailUserName: string = iaConfig.TestHomeOfficeBailsUserName;
const homeOfficeBailPassword: string = iaConfig.TestHomeOfficeBailsPassword;

export default class CaseHelper {
  private static instance: CaseHelper;
  private legalRep: UserInfo = {email: "", password: ""};
  private legalRepBail: UserInfo = {email: "", password: ""};
  private adminOfficerBail: UserInfo = {email: "", password: ""};
  private homeOfficeBail: UserInfo = {email: "", password: ""};
  private caseUrl = "";

  public static getInstance(): CaseHelper {
    if (!CaseHelper.instance) {
      CaseHelper.instance = new CaseHelper();
    }
    return CaseHelper.instance;
  }

  setLegalRep(user: UserInfo) {
    this.legalRep = user;
  }

  getLegalRep() {
    if (this.legalRep.email === "") {
      this.legalRep = {email: legalRepUserName, password: legalRepPassword};
    }
    return this.legalRep;
  }

  setLegalRepBail(user: UserInfo) {
    this.legalRepBail = user;
  }

  getLegalRepBail() {
    if (this.legalRepBail.email === "") {
      this.legalRepBail = {email: legalRepBailUserName, password: legalRepBailPassword};
    }
    return this.legalRepBail;
  }

  setAdminOfficerBail(user: UserInfo) {
    this.adminOfficerBail = user;
  }

  getAdminOfficerBail() {
    if (this.adminOfficerBail.email === "") {
      this.adminOfficerBail = {email: adminOfficerBailUserName, password: adminOfficerBailPassword};
    }
    return this.adminOfficerBail;
  }

  setHomeOfficeBail(user: UserInfo) {
    this.homeOfficeBail = user;
  }

  getHomeOfficeBail() {
    if (this.homeOfficeBail.email === "") {
      this.homeOfficeBail = {email: homeOfficeBailUserName, password: homeOfficeBailPassword};
    }
    return this.homeOfficeBail;
  }

  getBailUser(user: string) {
    switch (user) {
      case 'Legal Rep':
        return this.getLegalRepBail();
      case 'Admin Officer':
        return this.getAdminOfficerBail();
      case 'Home Office Bails':
        return this.getHomeOfficeBail();
      default:
        throw new Error(`User role '${user}' is not defined in getUser function`);
    }
  }

  setBailUser(user: string, newUser: UserInfo) {
    switch (user) {
      case 'Legal Rep':
        return this.setLegalRepBail(newUser);
      case 'Admin Officer':
        return this.setAdminOfficerBail(newUser);
      case 'Home Office Bails':
        return this.setHomeOfficeBail(newUser);
      default:
        throw new Error(`User role '${user}' is not defined in getUser function`);
    }
  }

  setStoredCaseUrlFromId(caseId: string, jurisdictionId: string, caseType: string) {
    this.caseUrl = `${iaConfig.CcdWebUrl}/cases/case-details/${jurisdictionId}/${caseType}/${caseId}`;
  }

  getStoredCaseUrl() {
    return this.caseUrl;
  }
}
