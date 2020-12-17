const iaConfig = require('../ia.conf');

export enum Wait {
    instant = 1,
    minimal = iaConfig.WaitForAngular ? 300 : 9000,
    short = iaConfig.WaitForAngular ? 9000 : 30000,
    normal = iaConfig.WaitForAngular ? 15000 : 1240000,
    long = iaConfig.WaitForAngular ? 90000 : 180000
}
