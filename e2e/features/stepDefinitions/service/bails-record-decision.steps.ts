import { RecordDecision } from '../../../flows/bails-record-decision.flow';
import { Given } from '@cucumber/cucumber';

const recordDecision = new RecordDecision();

Given(/^I record a refused decision with SS consent No with (no|one|two) financial condition supporters$/, async function (noOfSupporters) {
  let numberOfSupporters;
  if (noOfSupporters === 'no') {
    numberOfSupporters = 0;
  } else if (noOfSupporters === 'one') {
    numberOfSupporters = 1;
  } else if (noOfSupporters === 'two') {
    numberOfSupporters = 2;
  }
  await recordDecision.recordDecision(true, 'No', 'Refused', 'N/A', 'N/A', ['N/A'], 'N/A', 'N/A', numberOfSupporters, ['N/A'], 'N/A');
});

Given(/^I record a refused decision with SS consent Yes with (no|one|two) financial condition supporters$/, async function (noOfSupporters) {
  let numberOfSupporters;
  if (noOfSupporters === 'no') {
    numberOfSupporters = 0;
  } else if (noOfSupporters === 'one') {
    numberOfSupporters = 1;
  } else if (noOfSupporters === 'two') {
    numberOfSupporters = 2;
  }
  await recordDecision.recordDecision(true, 'Yes', 'Refused', 'N/A', 'N/A', ['N/A'], 'N/A', 'N/A', numberOfSupporters, ['N/A'], 'N/A');
});

Given(/^I record a refused decision with SS consent Yes and Minded to grant with (no|one|two) financial condition supporters$/, async function (noOfSupporters) {
  let numberOfSupporters;
  if (noOfSupporters === 'no') {
    numberOfSupporters = 0;
  } else if (noOfSupporters === 'one') {
    numberOfSupporters = 1;
  } else if (noOfSupporters === 'two') {
    numberOfSupporters = 2;
  }
  await recordDecision.recordDecision(true, 'Yes', 'Minded to grant', 'No', 'N/A', ['N/A'], 'N/A', 'N/A', numberOfSupporters, ['N/A'], 'N/A');
});

Given(/^I record a granted decision with SS consent No with (no|one|two) financial condition supporters$/, async function (noOfSupporters) {
  let numberOfSupporters;
  if (noOfSupporters === 'no') {
    numberOfSupporters = 0;
  } else if (noOfSupporters === 'one') {
    numberOfSupporters = 1;
  } else if (noOfSupporters === 'two') {
    numberOfSupporters = 2;
  }
  await recordDecision.recordDecision(true, 'No', 'Granted', 'N/A', 'Yes', ['Residence'], 'Yes', 'No', numberOfSupporters, ['N/A'], 'Yes');
});

Given(/^I record a granted decision with SS consent Yes with (no|one|two) financial condition supporters$/, async function (noOfSupporters) {
  let numberOfSupporters;
  if (noOfSupporters === 'no') {
    numberOfSupporters = 0;
  } else if (noOfSupporters === 'one') {
    numberOfSupporters = 1;
  } else if (noOfSupporters === 'two') {
    numberOfSupporters = 2;
  }
  await recordDecision.recordDecision(true, 'Yes', 'Minded to grant', 'Yes', 'Yes', ['Appearance'], 'No', 'N/A', numberOfSupporters, ['N/A'], 'No');
});

Given(/^I record a conditional grant decision with SS consent No with (no|one|two) financial condition supporters$/, async function (noOfSupporters) {
  let numberOfSupporters;
  if (noOfSupporters === 'no') {
    numberOfSupporters = 0;
  } else if (noOfSupporters === 'one') {
    numberOfSupporters = 1;
  } else if (noOfSupporters === 'two') {
    numberOfSupporters = 2;
  }
  await recordDecision.recordDecision(true, 'Yes', 'Minded to grant', 'Yes', 'No', ['Other', 'Reporting'], 'No', 'N/A', numberOfSupporters, ['N/A'], 'No');
});

Given(/^I record a conditional grant decision with SS consent Yes with (no|one|two) financial condition supporters$/, async function (noOfSupporters) {
  let numberOfSupporters;
  if (noOfSupporters === 'no') {
    numberOfSupporters = 0;
  } else if (noOfSupporters === 'one') {
    numberOfSupporters = 1;
  } else if (noOfSupporters === 'two') {
    numberOfSupporters = 2;
  }
  await recordDecision.recordDecision(true, 'Yes', 'Minded to grant', 'Yes', 'No', ['Activities', 'Electronic Monitoring'], 'No', 'N/A', numberOfSupporters, ['N/A'], 'No');
});
