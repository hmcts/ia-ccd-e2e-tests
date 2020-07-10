import { SubmitCaseFlow } from '../../../flows/submit-case.flow';
import { Logger } from '../../../helpers/logger';
import { Then } from 'cucumber';

const isSaveAndContinueEnabled = require('../../../ia.conf').isSaveAndContinueEnabled === 'true';

const submitCaseFlow = new SubmitCaseFlow();

Then(/^I submit my case$/, async function () {
  if (isSaveAndContinueEnabled) {
    await submitCaseFlow.submitCase(true);
  } else {
    Logger.log(`INFO: 'I submit my case' step is ignored because the Save and Continue feature is disabled.`);
    Logger.log(`INFO: case was submitted in the build case step.`);
  }
});
