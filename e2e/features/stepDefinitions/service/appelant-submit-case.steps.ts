import { Given } from 'cucumber';
import { getS2sToken } from '../../../aip/s2s';
import { CcdService, Events } from '../../../aip/ccd-service';
import { createUser, getUserId, getUserToken } from '../../../aip/idam-service';
import { CcdPage } from '../../../pages/ccd.page';
const iaConfig = require('../../../ia.conf');

const ccdPage = new CcdPage();
const ccdUrl = iaConfig.CcdWebUrl;

Given(/^An appellant has submitted an appeal$/, async function () {
  const appellantConfig = await createUser();
  const userToken = await getUserToken(appellantConfig);
  const userId = await getUserId(userToken);
  const serviceToken = await getS2sToken();
  const ccdService = new CcdService();
  const securityHeaders = {userToken, serviceToken};
  const caseDetails = await ccdService.createCase(userId, securityHeaders);
  await ccdService.updateAppeal(Events.SUBMIT_APPEAL, userId, caseDetails, securityHeaders);

  this.caseDetails = caseDetails;
});

Given(/^I am viewing the appellant's case$/, async function () {
  await ccdPage.get(`${ccdUrl}/case/IA/Asylum/${this.caseDetails.id}`);
  await ccdPage.contentContains('Immigration');
});
