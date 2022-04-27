
module.exports = {

  CcdGatewayUrl: 'https://gateway-ccd.demo.platform.hmcts.net',
  CcdWebUrl: 'https://manage-case.demo.platform.hmcts.net',
  CcdApiUrl: process.env.TEST_E2E_CCD_API_URL || 'http://ccd-data-store-api-aat.service.core-compute-aat.internal',
  UseHeadlessBrowser: process.env.TEST_E2E_HEADLESS !== 'false',
  ProxyUrl: process.env.TEST_E2E_URL_PROXY || 'http://proxyout.reform.hmcts.net:8080',
  RunWithNumberOfBrowsers: process.env.TEST_E2E_NUM_BROWSERS || 1,
  UseProxy: process.env.TEST_E2E_USE_PROXY !== 'false',
  WaitForAngular: process.env.TEST_E2E_WAIT_FOR_ANGULAR !== 'false',
  FailFast: process.env.TEST_E2E_FAIL_FAST !== 'false',
  NightlyTag: process.env.TEST_E2E_ANNOTATION || '--cucumberOpts.tags=@nightly-test',
  IdamClientSecret: process.env.IDAM_SECRET,
  IdamApiUrl: process.env.IDAM_URL || 'http://idam-api.aat.platform.hmcts.net',
  s2sUrl: process.env.S2S_URL || 'http://rpe-service-auth-provider-aat.service.core-compute-aat.internal',
  TestOutputDir: process.env.E2E_OUTPUT_DIR || './reports/tests',

  TestCaseOfficerUserName: 'ia.caseofficer.ccd@gmail.com',
  TestCaseOfficerPassword: 'AldgateT0wer',
  TestAdminOfficerUserName: 'ia.adm1nofficer.ccd@gmail.com',
  TestAdminOfficerPassword: 'AldgateT0wer',
  TestJudiciaryUserName: 'ia.iacjudge.ccd@gmail.com',
  TestJudiciaryPassword: 'AldgateT0wer',
  TestLawFirmAUserName: 'ia.legalrep.a.ccd@gmail.com',
  TestLawFirmAPassword: 'AldgateT0wer',
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
  TestJudgeUserName: 'ia.iacjudge.ccd@gmail.com',
  TestJudgePassword: 'AldgateT0wer',
  TestLawFirmOrgAUserName:'ialegalreporgcreator12@mailinator.com',
  TestLawFirmOrgAPassword: 'Aldg@teT0wer',
  TestLawFirmOrgBUserName: process.env.TEST_LAW_FIRM_SHARE_CASE_B_USERNAME,
  TestLawFirmOrgBPassword: 'AldgateT0wer',

   TestLawFirmOrgSuccessUserName:'ialegalreporgcreator12@mailinator.com',
  TestLawFirmOrgSuccessPassword:'Aldg@teT0wer',

  isSaveAndContinueEnabled: process.env.IS_SAVE_AND_CONTINUE_ENABLED || false,
  isfeePaymentEnabled: process.env.IA_FEEPAYMENT_ENABLED || false,
  isOutOfCountryEnabled: process.env.IA_OUT_OF_COUNTRY_ENABLED || true
  };





