import { BuildCaseFlow } from '../../../flows/build-case.flow';
import { Then } from 'cucumber';

const buildCaseFlow = new BuildCaseFlow();

Then(/^I build my case$/, async function () {
  await buildCaseFlow.buildCase(true);
});
