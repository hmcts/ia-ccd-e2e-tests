import { MakeNewApplicationFlow } from '../../../flows/bails-make-new-application.flow';
import { Given } from 'cucumber';

const makeNewApplicationFlow = new MakeNewApplicationFlow();

Given(/^I make a new application as a `(Admin Officer|Home Office Bails|Legal Rep)` for a (Prison|Immigration removal centre) detention with (no|one|two) financial condition supporters and with (a|no) Legal Representative$/,
    async function (
    user,
    detentionFacility,
    noOfSupporters,
    legalRepresentativeOrNot) {
    await makeNewApplicationFlow.makeNewApplication(true, user, detentionFacility, noOfSupporters, legalRepresentativeOrNot);
});
