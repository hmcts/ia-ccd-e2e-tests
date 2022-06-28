import { EndApplication } from '../../../flows/bails-end-application.flow';
import { Given } from 'cucumber';

const endApplication = new EndApplication();

Given('I end the application', async function () {
  await endApplication.endApplication(true);
});
