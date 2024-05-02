import { Given } from 'cucumber';
import { ListCaseThroughEvent } from "../../../flows/bails-list-case-event.flow";

const listCaseThroughEvent = new ListCaseThroughEvent();

Given('I list the bails case through Case Listing event', async function () {
  await listCaseThroughEvent.listCase(true);
});