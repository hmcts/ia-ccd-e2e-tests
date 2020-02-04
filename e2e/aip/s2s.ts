const rp = require('request-promise');
const iaConfig = require('../ia.conf');

async function getS2sToken() {
  const response = await rp.post({
    uri: `${iaConfig.s2sUrl}/testing-support/lease`,
    json: true,
    body: {
      microservice: 'iac'
    }
  });

  return 'Bearer ' + response;
}

export {
  getS2sToken
};
