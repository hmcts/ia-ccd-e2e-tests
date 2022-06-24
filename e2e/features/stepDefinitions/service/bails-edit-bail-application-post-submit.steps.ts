import { EditBailApplicationPostSubmitFlow } from '../../../flows/bails-edit-bail-application-post-submit.flow';
import { Given } from 'cucumber';

const editBailApplicationPostSubmitFlow = new EditBailApplicationPostSubmitFlow();

Given(/^I edit my submitted application as a `(Admin Officer|Home Office Bails|Legal Rep)` for a (Prison|Immigration removal centre) detention with (no|one|two) financial condition supporters and with (a|no) Legal Representative$/,
    async function (
    user,
    detentionFacility,
    noOfSupporters,
    legalRepresentativeOrNot) {
    await editBailApplicationPostSubmitFlow.editSubmittedApplication(false, user, detentionFacility, noOfSupporters, legalRepresentativeOrNot);
});
