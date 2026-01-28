import { UserInfo } from "../aip/idam-service";

const iaConfig = require('../ia.conf');
const legalRepUserName: string = iaConfig.TestLawFirmOrgAUserName;
const legalRepPassword: string = iaConfig.TestLawFirmOrgAPassword;
const adminOfficerUserName: string = iaConfig.TestAdminOfficerBailsUserName;
const adminOfficerPassword: string = iaConfig.TestAdminOfficerBailsPassword;
const homeOfficeUserName: string = iaConfig.TestHomeOfficeBailsUserName;
const homeOfficePassword: string = iaConfig.TestHomeOfficeBailsPassword;

export default class CaseHelper {
  private static instance: CaseHelper;
  private legalRep: UserInfo = {email: "", password: ""};
  private adminOfficer: UserInfo = {email: "", password: ""};
  private homeOffice: UserInfo = {email: "", password: ""};
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

  setAdminOfficer(user: UserInfo) {
    this.adminOfficer = user;
  }

  getAdminOfficer() {
    if (this.adminOfficer.email === "") {
      this.adminOfficer = {email: adminOfficerUserName, password: adminOfficerPassword};
    }
    return this.adminOfficer;
  }

  setHomeOffice(user: UserInfo) {
    this.homeOffice = user;
  }

  getHomeOffice() {
    if (this.homeOffice.email === "") {
      this.homeOffice = {email: homeOfficeUserName, password: homeOfficePassword};
    }
    return this.homeOffice;
  }


  getBailUser(user: string) {
    switch (user) {
      case 'Legal Rep':
        return this.getLegalRep();
      case 'Admin Officer':
        return this.getAdminOfficer();
      case 'Home Office Bails':
        return this.getHomeOffice();
      default:
        throw new Error(`User role '${user}' is not defined in getUser function`);
    }
  }

  setBailUser(user: string, newUser: UserInfo) {
    switch (user) {
      case 'Legal Rep':
        return this.setLegalRep(newUser);
      case 'Admin Officer':
        return this.setAdminOfficer(newUser);
      case 'Home Office Bails':
        return this.setHomeOffice(newUser);
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
