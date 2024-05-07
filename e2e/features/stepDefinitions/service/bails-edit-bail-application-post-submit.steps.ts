import { EditBailApplicationPostSubmitFlow } from '../../../flows/bails-edit-bail-application-post-submit.flow';
import { Given } from 'cucumber';

const editBailApplicationPostSubmitFlow = new EditBailApplicationPostSubmitFlow();

Given(
  /^I edit my submitted application as a `Admin Officer` for a (Prison|Immigration removal centre) detention with (no|one|two) financial condition supporters and with (a|no) Legal Representative that had (a|no) Legal Representative before$/,
  async function (detentionFacility, noOfSupporters, legalRepresentativeOrNot, previousLegalRepresentativeOrNot) {
    await editBailApplicationPostSubmitFlow.editSubmittedApplication(false, detentionFacility, noOfSupporters, legalRepresentativeOrNot, previousLegalRepresentativeOrNot);
  },
);
