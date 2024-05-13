const rp = require('request-promise');
const iaConfig = require('../ia.conf');

const idamUrl = iaConfig.IdamApiUrl;
const idamClientSecret = iaConfig.IdamClientSecret;
const redirectUrl = 'https://localhost:3000/redirectUrl';

async function createUser() {
  const randomNumber = parseInt(Math.random() * 10000000 + '', 10);
  const email = `ia_citizen${randomNumber}@hmcts.net`;
  const password = 'Apassword123';
  const options = {
    url: `${idamUrl}/testing-support/accounts`,
    json: true,
    body: {
      email: email,
      forename: 'ATestForename',
      password: password,
      surname: 'ATestSurname',
      roles: [
        {
          code: 'citizen',
        },
      ],
    },
    insecure: true,
    timeout: 10000,
    resolveWithFullResponse: true,
  };
  try {
    await rp.post(options);

    return { email: email, password };
  } catch (error) {
    console.log(`Error createUser ${error.message}`);
  }
}

async function getUserToken(appellantConfig) {
  const authResponse = await rp.post({
    uri: `${idamUrl}/oauth2/authorize`,
    json: true,
    headers: {
      Accept: 'application/json',
    },
    auth: {
      user: appellantConfig.email,
      pass: appellantConfig.password,
    },
    form: {
      response_type: 'code',
      client_id: 'ccd_gateway',
      redirect_uri: redirectUrl,
    },
  });

  const tokenResponse = await rp.post({
    uri: `${idamUrl}/oauth2/token`,
    json: true,
    form: {
      code: authResponse.code,
      grant_type: 'authorization_code',
      redirect_uri: redirectUrl,
      client_id: 'ccd_gateway',
      client_secret: idamClientSecret,
    },
  });

  return 'Bearer ' + tokenResponse.access_token;
}

async function getUserId(userToken: string) {
  const userDetails = await rp.get({
    url: `${idamUrl}/details`,
    json: true,
    headers: {
      Authorization: userToken,
    },
  });

  return userDetails.id;
}

export { createUser, getUserToken, getUserId };
