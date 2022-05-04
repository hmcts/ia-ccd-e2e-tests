import { StartBailApplicationFlow } from '../../../flows/bails-start-bail-application.flow';
import { Given } from 'cucumber';

const startBailApplicationFlow = new StartBailApplicationFlow();

Given(/^I save my initial application as a `(Admin Officer|Home Office User|Legal Rep)` for a (Prison|Immigration removal centre) detention with (no|one|two) financial condition supporters and with (a|no) Legal Representative$/,
    async function (
    user,
    detentionFacility,
    noOfSupporters,
    legalRepresentativeOrNot) {
    await startBailApplicationFlow.saveInitialApplication(true, user, detentionFacility, noOfSupporters, legalRepresentativeOrNot);
});
