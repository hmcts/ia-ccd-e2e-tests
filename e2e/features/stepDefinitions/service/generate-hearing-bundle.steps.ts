import { HearingBundleFlow } from '../../../flows/generate-hearing-bundle.flow';
import { Then } from '@cucumber/cucumber';

const hearingBundleFlow = new HearingBundleFlow();

Then(/^I generate the hearing bundle$/, async function () {
  await hearingBundleFlow.generateHearingBundle();
});
