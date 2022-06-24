import { EditBailApplicationPreSubmitFlow } from '../../../flows/bails-edit-bail-application-pre-submit.flow';
import { Given } from 'cucumber';

const editBailApplicationPreSubmitFlow = new EditBailApplicationPreSubmitFlow();

Given(/^I edit my saved application as a `(Admin Officer|Home Office Bails|Legal Rep)` for a (Prison|Immigration removal centre) detention with (no|one|two) financial condition supporters and with (a|no) Legal Representative$/,
    async function (
    user,
    detentionFacility,
    noOfSupporters,
    legalRepresentativeOrNot) {
    await editBailApplicationPreSubmitFlow.editSavedApplication(false, user, detentionFacility, noOfSupporters, legalRepresentativeOrNot);
});
