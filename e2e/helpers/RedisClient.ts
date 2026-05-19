import { createClient } from 'redis';

const iaConfig = require('../ia.conf');

const redisOpts = {
  url: iaConfig.redisUrl,
  ttl: iaConfig.redisTtlInSeconds
};

export default class RedisClient {
  // eslint-disable-next-line no-use-before-define
  private static instance: RedisClient;
  private redisClient;

  constructor() {
    this.redisClient = createClient(redisOpts);
    this.redisClient.on('error', err => console.log('Redis Client Error', err));
  }

  public static getInstance(): RedisClient {
    if (!RedisClient.instance) {
      RedisClient.instance = new RedisClient();
    }
    return RedisClient.instance;
  }

  async getFromCache(someKey: string) {
    await this.redisClient.connect();
    const value = await this.redisClient.get(someKey);
    await this.redisClient.quit();
    return value;
  }

  async setCache(someKey: string, someValue: string) {
    await this.redisClient.connect();
    await this.redisClient.set(someKey, someValue);
    await this.redisClient.quit();
  }
}
