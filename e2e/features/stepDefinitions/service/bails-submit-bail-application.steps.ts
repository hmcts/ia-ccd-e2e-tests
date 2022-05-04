import { SubmitBailApplicationFlow } from '../../../flows/bails-submit-bail-application.flow';
import { Given } from 'cucumber';

const submitBailApplicationFlow = new SubmitBailApplicationFlow();

Given(/^I submit my bail application as a `(Admin Officer|Home Office User|Legal Rep)`$/, async function (user) {
    await submitBailApplicationFlow.submitBailApplication(true, user);
});
