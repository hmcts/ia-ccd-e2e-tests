import { RequestHomeOfficeDataFlow } from '../../../flows/request-home-office-data.flow';
import { Then } from 'cucumber';

const requestHomeOfficeDataFlow = new RequestHomeOfficeDataFlow();

Then(/^I request home office data$/, async function () {
  await requestHomeOfficeDataFlow.requestHomeOfficeData(true);
});
