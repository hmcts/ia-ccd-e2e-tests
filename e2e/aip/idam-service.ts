import axios from "axios";
import { isJWTExpired } from "./jwt-utils";

const rp = require('request-promise');
const iaConfig = require('../ia.conf');

const idamUrl = iaConfig.IdamApiUrl;
const idamSecret = iaConfig.IdamSecret;
const idamTestingSupportUrl = iaConfig.IdamTestingSupportUrl;
const idamWebUrl = iaConfig.IdamWebUrl;
const idamClientSecret = iaConfig.IdamRpxClientSecret;
const redirectUrl = 'https://localhost:3000/redirectUrl';

let idamTestingAccessToken;

type UserInfo = {
  email: string;
  password: string;
  forename?: string;
  surname?: string;
  userId?: string;
  userToken?: string;
  caseId?: string;
};

async function setTestingSupportToken() {
  try {
    const response = await rp.post({
      uri: `${idamWebUrl}/o/token`,
      form: {
        grant_type: 'client_credentials',
        client_id: 'iac',
        client_secret: idamSecret,
        scope: 'profile roles'
      },
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      json: true // Automatically parses the JSON response
    });
    idamTestingAccessToken = response.access_token;
  } catch (error) {
    console.error(`Error in setTestingSupportToken: ${error.message}`);
  }
}

async function createUser(): Promise<UserInfo> {
  if (idamTestingAccessToken === undefined) {
    await setTestingSupportToken();
  }
  const randomNumber = parseInt(Math.random() * 10000000 + '', 10);
  const email = `ia_citizen${randomNumber}@hmcts.net`;
  const password = 'Apassword123';

  try {
    await axios.post(`${idamTestingSupportUrl}/test/idam/users`, {
      password: password,
      user: {
        email: email,
        forename: 'ATestForename',
        surname: 'ATestSurname',
        roleNames: ['citizen']
      }
    }, {
      headers: {
        'Authorization': `Bearer ${idamTestingAccessToken}`,
        'Content-Type': 'application/json'
      },
      timeout: 10000
    });
    let userInfo = {email: email, password: password} as UserInfo;
    userInfo.userToken = await getUserToken(userInfo);
    userInfo.userId = await getUserId(userInfo.userToken);
    return userInfo;
  } catch (error) {
    console.log(`Error createUser ${error.message}`);
  }
}

async function getUserToken(userConfig: UserInfo) {
  if (userConfig.userToken && !isJWTExpired(userConfig.userToken)) {
    return userConfig.userToken;
  }
  try {
    const response = await axios.post(
      `${idamUrl}/o/token`, '',
      {
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        params: {
          grant_type: 'password',
          redirect_uri: redirectUrl,
          client_id: 'xuiwebapp',
          client_secret: idamClientSecret,
          username: userConfig.email,
          password: userConfig.password,
          scope: 'profile openid roles manage-user create-user search-user'
        }
      }
    );
    return `Bearer ${response.data.access_token}`;
  } catch (error) {
    console.error(`Error in getUserToken: ${error.message}`);
  }
}

async function getUserId(userToken: string) {
  try {
    const userDetails = await axios.get(`${idamUrl}/details`, {
      headers: {
        'Authorization': userToken
      }
    });
    return userDetails.data.id;
  } catch (error) {
    console.error(`Error in getUserId: ${error.message}`);
  }
}

export { createUser, UserInfo, getUserToken, getUserId };
