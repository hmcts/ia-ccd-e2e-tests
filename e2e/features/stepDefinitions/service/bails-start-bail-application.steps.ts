import { StartBailApplicationFlow } from '../../../flows/bails-start-bail-application.flow';
import { Given } from '@cucumber/cucumber';

const startBailApplicationFlow = new StartBailApplicationFlow();

Given(/^I save my initial application as a `(Admin Officer|Home Office Bails|Legal Rep)` for a (Prison|Immigration removal centre) detention with (no|one|two) financial condition supporters and with (a|no) Legal Representative$/,
    async function (
    user,
    detentionFacility,
    noOfSupporters,
    legalRepresentativeOrNot) {
    await startBailApplicationFlow.saveInitialApplication(true, user, detentionFacility, noOfSupporters, legalRepresentativeOrNot);
});

Given(/^I save my initial application as a `(Home Office Bails|Legal Rep)` for a (Prison|Immigration removal centre) detention with (no|one|two) financial condition supporters and with (a|no) Legal Representative with no files uploaded$/,
    async function (
    user,
    detentionFacility,
    noOfSupporters,
    legalRepresentativeOrNot) {
    await startBailApplicationFlow.saveInitialApplicationNoFiles(true, user, detentionFacility, noOfSupporters, legalRepresentativeOrNot);
});
