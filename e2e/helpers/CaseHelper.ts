import { UserInfo } from "../aip/idam-service";

const iaConfig = require('../ia.conf');
const legalRepUserName: string = iaConfig.TestLawFirmOrgAUserName;
const legalRepPassword: string = iaConfig.TestLawFirmOrgAPassword;

export default class CaseHelper {
  private static instance: CaseHelper;
  private legalRep: UserInfo = {email: "", password: ""};
  private caseUrl: string = "";

  public static getInstance(): CaseHelper {
    if (!CaseHelper.instance) {
      CaseHelper.instance = new CaseHelper();
    }
    return CaseHelper.instance;
  }

  setLegalRep(user: UserInfo) {
    this.legalRep = user
  }

  getLegalRep() {
    if (this.legalRep.email === "") {
      this.legalRep = {email: legalRepUserName, password: legalRepPassword};
    }
    return this.legalRep;
  }

  setStoredCaseUrlFromId(caseId: string, jurisdictionId: string, caseType: string) {
    this.caseUrl = `${iaConfig.CcdWebUrl}/cases/case-details/${jurisdictionId}/${caseType}/${caseId}`;
  }

  getStoredCaseUrl() {
    return this.caseUrl;
  }
}
