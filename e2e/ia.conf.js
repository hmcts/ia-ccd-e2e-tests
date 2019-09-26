module.exports = {

  CcdGatewayUrl: process.env.TEST_E2E_URL_GATEWAY || 'https://gateway-ccd.aat.platform.hmcts.net',
  CcdWebUrl: process.env.TEST_E2E_URL_WEB || 'https://www-ccd.aat.platform.hmcts.net',
  UseHeadlessBrowser: process.env.TEST_E2E_HEADLESS !== 'false',
  ProxyUrl: process.env.TEST_E2E_URL_PROXY || 'http://proxyout.reform.hmcts.net:8080',
  RunWithNumberOfBrowsers: process.env.TEST_E2E_NUM_BROWSERS || 1,
  UseProxy: process.env.TEST_E2E_USE_PROXY !== 'false',
  WaitForAngular: process.env.TEST_E2E_WAIT_FOR_ANGULAR !== 'false',
  FailFast: process.env.TEST_E2E_FAIL_FAST !== 'false',
  NightlyTag: process.env.TEST_E2E_ANNOTATION || '--cucumberOpts.tags=@nightly-test',


  TestCaseOfficerUserName: process.env.TEST_CASEOFFICER_USERNAME,
  TestCaseOfficerPassword: process.env.TEST_CASEOFFICER_PASSWORD,
  TestAdminOfficerUserName: process.env.TEST_ADMINOFFICER_USERNAME,
  TestAdminOfficerPassword: process.env.TEST_ADMINOFFICER_PASSWORD,
  TestJudiciaryUserName: process.env.TEST_JUDICIARY_USERNAME,
  TestJudiciaryPassword: process.env.TEST_JUDICIARY_PASSWORD,
  TestLawFirmAUserName: process.env.TEST_LAW_FIRM_A_USERNAME,
  TestLawFirmAPassword: process.env.TEST_LAW_FIRM_A_PASSWORD,
  TestLawFirmBUserName: process.env.TEST_LAW_FIRM_B_USERNAME,
  TestLawFirmBPassword: process.env.TEST_LAW_FIRM_B_PASSWORD,
  TestLawFirmCUserName: process.env.TEST_LAW_FIRM_C_USERNAME,
  TestLawFirmCPassword: process.env.TEST_LAW_FIRM_C_PASSWORD,
  TestAdminUserName: process.env.TEST_ADMIN_USERNAME,
  TestAdminPassword: process.env.TEST_ADMIN_PASSWORD,
  TestHomeOfficeApcUserName: process.env.TEST_HOMEOFFICE_APC_USERNAME,
  TestHomeOfficeApcPassword: process.env.TEST_HOMEOFFICE_APC_PASSWORD,
  TestHomeOfficeLartUserName: process.env.TEST_HOMEOFFICE_LART_USERNAME,
  TestHomeOfficeLartPassword: process.env.TEST_HOMEOFFICE_LART_PASSWORD,
  TestHomeOfficePouUserName: process.env.TEST_HOMEOFFICE_POU_USERNAME,
  TestHomeOfficePouPassword: process.env.TEST_HOMEOFFICE_POU_PASSWORD,
  TestHomeOfficeGenericUserName: process.env.TEST_HOMEOFFICE_GENERIC_USERNAME,
  TestHomeOfficeGenericPassword: process.env.TEST_HOMEOFFICE_GENERIC_PASSWORD

};
