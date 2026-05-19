import axios from "axios";
import RedisClient from "../helpers/RedisClient";

const iaConfig = require('../ia.conf');

const idamUrl = iaConfig.IdamApiUrl;
const idamClientSecret = iaConfig.IdamRpxClientSecret;
const redirectUrl = 'https://localhost:3000/redirectUrl';

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

async function getUserTokenFromCache(cacheKey: string, email: string, password: string) {
  const redisClient = RedisClient.getInstance();
  const cachedToken = await redisClient.getFromCache(cacheKey);
  if (cachedToken) {
    return cachedToken;
  }
  const tokenToCache = await getUserToken(email, password);
  await redisClient.setCache(cacheKey, tokenToCache);
  return tokenToCache;
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

export {
  getUserId,
  getUserTokenFromCache
};
