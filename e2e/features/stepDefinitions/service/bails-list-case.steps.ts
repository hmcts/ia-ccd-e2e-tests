import { Given } from '@cucumber/cucumber';
import { ListCaseThroughEvent } from '../../../flows/bails-list-case-event.flow';

const listCaseThroughEvent = new ListCaseThroughEvent();

Given('I list the bails case through Case Listing event', async() => {
  await listCaseThroughEvent.listCase(true);
});

Given('I fill out the Participant attendance page', async() => {
  await listCaseThroughEvent.fillOutParticipantAttendancePage(false);
});

Given('I fill out the hearing venue details page', async() => {
  await listCaseThroughEvent.fillOutHearingVenueDetailsPage(false);
});
