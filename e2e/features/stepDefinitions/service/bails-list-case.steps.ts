import { Given } from 'cucumber';
import { ListCaseThroughEvent } from '../../../flows/bails-list-case-event.flow';

const listCaseThroughEvent = new ListCaseThroughEvent();

Given('I list the bails case through Case Listing event', async function () {
  await listCaseThroughEvent.listCase(true);
});

Given('I fill out the Participant attendance page', async function () {
  await listCaseThroughEvent.fillOutParticipantAttendancePage(false);
});

Given('I fill out the hearing venue details page', async function () {
  await listCaseThroughEvent.fillOutHearingVenueDetailsPage(false);
});
