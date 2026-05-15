import { EndApplication } from '../../../flows/bails-end-application.flow';
import { Given } from '@cucumber/cucumber';

const endApplication = new EndApplication();

Given('I end the application', async() => {
  await endApplication.endApplication(true);
});
