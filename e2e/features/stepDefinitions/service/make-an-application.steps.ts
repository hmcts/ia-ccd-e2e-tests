import { MakeAnApplication } from '../../../flows/make-an-application.flow';
import { Given } from '@cucumber/cucumber';

const makeAnApplicationSteps = new MakeAnApplication();

Given(/^I make an application for `?([^`]+)`? type$/, async applicationType => {
  await makeAnApplicationSteps.completeMakeAnApplication(true, applicationType);
});
