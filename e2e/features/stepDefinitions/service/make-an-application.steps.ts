import { MakeAnApplication } from '../../../flows/make-an-application.flow';
import { Given } from 'cucumber';

const makeAnApplicationSteps = new MakeAnApplication();

Given(/^I make an application for `?([^`]+)`? type$/, async function (applicationType) {
  await makeAnApplicationSteps.completeMakeAnApplication(true, applicationType);
});
