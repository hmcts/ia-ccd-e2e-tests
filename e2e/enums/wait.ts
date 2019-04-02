const iaConfig = require('../ia.conf');

export enum Wait {
    instant = 1,
    minimal = iaConfig.WaitForAngular ? 100 : 3000,
    short = iaConfig.WaitForAngular ? 3000 : 10000,
    normal = iaConfig.WaitForAngular ? 15000 : 40000,
    long = iaConfig.WaitForAngular ? 30000 : 60000
}
