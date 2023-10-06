
module.exports = {

  CcdGatewayUrl: 'https://gateway-ccd.aat.platform.hmcts.net',
  CcdWebUrl: 'https://xui-ia-case-api-pr-1497.preview.platform.hmcts.net',
  CcdApiUrl: process.env.TEST_E2E_CCD_API_URL || 'http://ccd-data-store-api-aat.service.core-compute-demo.internal',
  UseHeadlessBrowser: process.env.TEST_E2E_HEADLESS !== 'false',
  ProxyUrl: process.env.TEST_E2E_URL_PROXY || 'http://proxyout.reform.hmcts.net:8080',
  RunWithNumberOfBrowsers: process.env.TEST_E2E_NUM_BROWSERS || 1,
  UseProxy: process.env.TEST_E2E_USE_PROXY !== 'false',
  WaitForAngular: process.env.TEST_E2E_WAIT_FOR_ANGULAR !== 'false',
  FailFast: process.env.TEST_E2E_FAIL_FAST !== 'false',
  NightlyTag: process.env.TEST_E2E_ANNOTATION || '--cucumberOpts.tags=@nightly-test',
  IdamClientSecret: process.env.IDAM_SECRET,
  IdamApiUrl: process.env.IDAM_URL || 'http://idam-api.aat.platform.hmcts.net',
  s2sUrl: process.env.S2S_URL || 'http://rpe-service-auth-provider-aat.service.core-compute-demo.internal',
  TestCaseOfficerUserName: 'CRD_func_test_aat_stcw1@justice.gov.uk',
  TestCaseOfficerPassword: 'AldgateT0wer',
  TestAdminOfficerUserName: 'ia.adm1nofficer.ccd@gmail.com',
  TestAdminOfficerPassword: 'AldgateT0wer',
  TestJudiciaryUserName: 'ia.iacjudge.ccd@gmail.com',
  TestJudiciaryPassword: 'AldgateT0wer',
  TestLawFirmAUserName: 'ialegalreporgcreator12@mailnesia.com',
  TestLawFirmAPassword: 'Aldg@teT0wer',
  TestLawFirmBUserName: 'ia.legalrep.b.ccd@gmail.com',
  TestLawFirmBPassword: 'AldgateT0wer',
  TestLawFirmCUserName: 'ia.legalrep.c.ccd@gmail.com',
  TestLawFirmCPassword: 'AldgateT0wer',
  TestAdminUserName: 'ia.adm1nofficer.ccd@gmail.com',
  TestAdminPassword: 'AldgateT0wer',
  TestHomeOfficeApcUserName: ' ia.respondentapc.ccd@gmail.com',
  TestHomeOfficeApcPassword: 'AldgateT0wer',
  TestHomeOfficePouUserName: 'ia.respondentpou.ccd@gmail.com',
  TestHomeOfficePouPassword: 'AldgateT0wer',
  TestHomeOfficeGenericUserName: process.env.TEST_HOMEOFFICE_GENERIC_USERNAME,
  TestHomeOfficeGenericPassword: 'AldgateT0wer',
  TestJudgeUserName: '330127EMP-@ejudiciary.net',
  TestJudgePassword: 'Hmcts1234',
  TestLawFirmOrgAUserName:'ialegalreporgcreator12@mailnesia.com',
  TestLawFirmOrgAPassword: 'Aldg@teT0wer',
  TestLawFirmOrgBUserName: 'ia.legalrep.b.sc@mailnesia.com',
  TestLawFirmOrgBPassword: 'AldgateT0wer',
  TestLawFirmOrgCreatorUserName:'ialegalreporgcreator12@mailnesia.com',
  TestLawFirmOrgCreatorPassword:'Aldg@teT0wer',
  TestLawFirmOrgCreatorUserName:'ialegalreporgcreator12@mailnesia.com',
  TestLawFirmOrgSuccessPassword:'Aldg@teT0wer',
  isSaveAndContinueEnabled: process.env.IS_SAVE_AND_CONTINUE_ENABLED || false,
  isfeePaymentEnabled: process.env.IA_FEEPAYMENT_ENABLED || false,
  isOutOfCountryEnabled: "true",
  
  TestLawFirmOrgABailsUserName:'ia.legalrep.orgcreator@mailnesia.com',
  TestLawFirmOrgABailsPassword:'AldgateT0wer',

  TestHomeOfficeBailsUserName: 'ia.respondentbail.ccd1@mailnesia.com',
  TestHomeOfficeBailsPassword: 'AldgateT0wer',

  TestAdminOfficerBailsUserName: 'ia.adm1nofficer.4.ccd@mailnesia.com',
  TestAdminOfficerBailsPassword: 'AldgateT0wer',

  TestJudgeBailsUserName:'ia.iacjudge.4.ccd@mailnesia.com',
  TestJudgeBailsPassword:'AldgateT0wer',
  };
  
     
	 