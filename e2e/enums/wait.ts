import { WaitForAngular } from '../ia.conf';

export enum Wait {
  instant = 1,
  minimal = WaitForAngular ? 900 : 27000,
  short = WaitForAngular ? 27000 : 90000,
  normal = WaitForAngular ? 45000 : 1240000,
  long = WaitForAngular ? 270000 : 640000,
}
