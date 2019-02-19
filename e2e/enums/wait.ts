const iaConfig = require('../ia.conf');

export enum Wait {
    minimal = iaConfig.WaitForAngular ? 3000 : 100,
    short = iaConfig.WaitForAngular ? 10000 : 1000,
    normal = iaConfig.WaitForAngular ? 40000 : 10000,
    long = iaConfig.WaitForAngular ? 120000 : 60000
}
