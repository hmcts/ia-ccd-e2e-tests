import { isJWTExpired } from "./jwt-utils";
import axios from "axios";

const iaConfig = require('../ia.conf');
const otp = require('otp');
const s2sSecret: string = iaConfig.s2sSecret;
const s2sUrl: string = iaConfig.s2sUrl;
const microServiceName: string = iaConfig.s2sMicroserviceName;

let serviceToken = null;

async function requestServiceToken() {
  const uri = `${s2sUrl}/lease`;
  const oneTimePassword = await otp(s2sSecret).totp();
  const request = {
    uri: uri,
    body: {
      microservice: microServiceName,
      oneTimePassword: oneTimePassword
    }
  };
  let res;
  try {
    res = await axios.post(request.uri, request.body);
  } catch (err) {
    console.error(err);
  }
  if (res && res.data) {
    serviceToken = res.data;
    console.log('Received S2S token and stored token');
  } else {
    console.error('Could not retrieve S2S token');
  }
  return serviceToken;
}

async function getS2sToken() {
  if (serviceToken == null || isJWTExpired(serviceToken)) {
    console.log('Token expired Attempting to acquire a new one.');
    await requestServiceToken();
  }
  return `Bearer ${serviceToken}`;
}

export { getS2sToken };
