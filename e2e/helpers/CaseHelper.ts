const iaConfig = require('../ia.conf');

export default class CaseHelper {
  // eslint-disable-next-line no-use-before-define
  private static instance: CaseHelper;
  private caseUrl = "";

  public static getInstance(): CaseHelper {
    if (!CaseHelper.instance) {
      CaseHelper.instance = new CaseHelper();
    }
    return CaseHelper.instance;
  }

  setStoredCaseUrlFromId(caseId: string, jurisdictionId: string, caseType: string) {
    this.caseUrl = `${iaConfig.CcdWebUrl}/cases/case-details/${jurisdictionId}/${caseType}/${caseId}`;
  }

  getStoredCaseUrl() {
    return this.caseUrl;
  }
}
