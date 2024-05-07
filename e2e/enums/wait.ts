const iaConfig = require('../ia.conf');

export enum Wait {
  instant = 1,
  minimal = iaConfig.WaitForAngular ? 900 : 27000,
  short = iaConfig.WaitForAngular ? 27000 : 90000,
  normal = iaConfig.WaitForAngular ? 45000 : 1240000,
  long = iaConfig.WaitForAngular ? 270000 : 640000,
}
