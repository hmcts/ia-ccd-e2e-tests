const iaConfig = require('../ia.conf');

export enum Wait {
    instant = 1,
    minimal = iaConfig.WaitForAngular ? 1000 : 30000,
    short = iaConfig.WaitForAngular ? 30000 : 100000,
    normal = iaConfig.WaitForAngular ? 15000 : 40000,
    long = iaConfig.WaitForAngular ? 30000 : 60000
}
