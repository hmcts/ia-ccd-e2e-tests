import { BailsAddCaseNoteFlow } from '../../../flows/bails-add-a-case-note.flow';
import { Given } from '@cucumber/cucumber';

const bailsAddCaseNoteFlow = new BailsAddCaseNoteFlow();

Given('I add a case note', async() => {
  await bailsAddCaseNoteFlow.addCaseNote(true, '');
});

Given(/^I add a case note for application `?([^`]+)`?$/, async applicationNumber => {
  await bailsAddCaseNoteFlow.addCaseNote(true, applicationNumber);
});
