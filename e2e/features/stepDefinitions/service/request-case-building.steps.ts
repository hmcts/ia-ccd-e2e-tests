import { Then } from '@cucumber/cucumber';
import { RequestCaseBuildingFlow } from '../../../flows/request-case-building.flow';

const requestCaseBuildingFlow = new RequestCaseBuildingFlow();

Then(/^I request case building$/, async function () {
  await requestCaseBuildingFlow.requestCaseBuilding();
});
