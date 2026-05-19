import axios from "axios";

const iaConfig = require('../ia.conf');

const legalRepUserName: string = iaConfig.TestLawFirmOrgAUserName;
const legalRepPassword: string = iaConfig.TestLawFirmOrgAPassword;
const legalRepBailUserName: string = iaConfig.TestLawFirmOrgABailsUserName;
const legalRepBailPassword: string = iaConfig.TestLawFirmOrgABailsPassword;
const adminOfficerBailUserName: string = iaConfig.TestAdminOfficerBailsUserName;
const adminOfficerBailPassword: string = iaConfig.TestAdminOfficerBailsPassword;
const homeOfficeBailUserName: string = iaConfig.TestHomeOfficeBailsUserName;
const homeOfficeBailPassword: string = iaConfig.TestHomeOfficeBailsPassword;
const idamUrl = iaConfig.IdamApiUrl;
const idamClientSecret = iaConfig.IdamRpxClientSecret;
const redirectUrl = 'https://localhost:3000/redirectUrl';

type UserInfo = {
  email: string;
  password: string;
};

async function getUserToken(email: string, password: string) {
  try {
    const response = await axios.post(
      `${idamUrl}/o/token`, '',
      {
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        params: {
          grant_type: 'password',
          redirect_uri: redirectUrl,
          client_id: 'xuiwebapp',
          client_secret: idamClientSecret,
          username: email,
          password,
          scope: 'profile openid roles manage-user create-user search-user'
        }
      }
    );
    return `Bearer ${response.data.access_token}`;
  } catch (error) {
    console.error(`Error in getUserToken: ${error.message}`);
    throw error;
  }
}

async function getUserTokenLegalRep() {
  if (iaConfig.xBrowser) {
    return getUserTokenLegalRepBail();
  }
  return getUserToken(legalRepUserName, legalRepPassword);
}

async function getUserTokenLegalRepBail() {
  return getUserToken(legalRepBailUserName, legalRepBailPassword);
}

async function getUserTokenAdminOfficer() {
  return getUserToken(adminOfficerBailUserName, adminOfficerBailPassword);
}

async function getUserTokenHomeOfficeBail() {
  return getUserToken(homeOfficeBailUserName, homeOfficeBailPassword);
}

async function getUserId(userToken: string) {
  try {
    const userDetails = await axios.get(`${idamUrl}/details`, {headers: {Authorization: userToken}});
    return userDetails.data.id;
  } catch (error) {
    console.error(`Error in getUserId: ${error.message}`);
    throw error;
  }
}

async function getUserIdLegalRep() {
  if (iaConfig.xBrowser) {
    return getUserIdLegalRepBail();
  }
  return getUserId(await getUserTokenLegalRep());
}

async function getUserIdLegalRepBail() {
  return getUserId(await getUserTokenLegalRepBail());
}

async function getUserIdAdminOfficer() {
  return getUserId(await getUserTokenAdminOfficer());
}

async function getUserIdHomeOfficeBail() {
  return getUserId(await getUserTokenHomeOfficeBail());
}

export {
  UserInfo,
  getUserId,
  getUserTokenAdminOfficer,
  getUserTokenHomeOfficeBail,
  getUserTokenLegalRep,
  getUserTokenLegalRepBail,
  getUserIdAdminOfficer,
  getUserIdHomeOfficeBail,
  getUserIdLegalRep,
  getUserIdLegalRepBail
};
