import { SubmitBailApplicationFlow } from '../../../flows/bails-submit-bail-application.flow';
import { Given } from '@cucumber/cucumber';

const submitBailApplicationFlow = new SubmitBailApplicationFlow();

Given(/^I submit my bail application as a `(Admin Officer|Home Office Bails|Legal Rep)`$/, async function (user) {
    await submitBailApplicationFlow.submitBailApplication(false, user);
});

