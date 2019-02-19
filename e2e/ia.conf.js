module.exports = {

  CcdGatewayUrl: process.env.TEST_E2E_URL_GATEWAY || 'https://gateway-ccd.aat.platform.hmcts.net',
  CcdWebUrl: process.env.TEST_E2E_URL_WEB || 'https://www-ccd.aat.platform.hmcts.net',
  UseHeadlessBrowser: process.env.TEST_E2E_HEADLESS !== 'false',
  ProxyUrl: process.env.TEST_E2E_URL_PROXY || 'http://proxyout.reform.hmcts.net:8080',
  RunWithNumberOfBrowsers: process.env.TEST_E2E_NUM_BROWSERS || 1,
  UseProxy: process.env.TEST_E2E_USE_PROXY !== 'false',
  RunningOnAAT: process.env.TEST_RUNNING_ON_AAT !== 'false',

  TestCaseOfficerUserName: process.env.TEST_CASEOFFICER_USERNAME,
  TestCaseOfficerPassword: process.env.TEST_CASEOFFICER_PASSWORD,
  TestJudiciaryUserName: process.env.TEST_JUDICIARY_USERNAME,
  TestJudiciaryPassword: process.env.TEST_JUDICIARY_PASSWORD,
  TestLawFirmAUserName: process.env.TEST_LAW_FIRM_A_USERNAME,
  TestLawFirmAPassword: process.env.TEST_LAW_FIRM_A_PASSWORD,
  TestLawFirmBUserName: process.env.TEST_LAW_FIRM_B_USERNAME,
  TestLawFirmBPassword: process.env.TEST_LAW_FIRM_B_PASSWORD,
  TestLawFirmCUserName: process.env.TEST_LAW_FIRM_C_USERNAME,
  TestLawFirmCPassword: process.env.TEST_LAW_FIRM_C_PASSWORD

};
