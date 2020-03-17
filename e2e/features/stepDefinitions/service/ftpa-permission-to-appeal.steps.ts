import { ApplyForPermissionToAppealFlow } from '../../../flows/apply-for-permission-to-appeal.flow';
import { SelectFtpaApplicantType } from '../../../flows/ftpa-applicant-type.flow';
import { Then } from 'cucumber';

const applyForPermissionToAppealFlow = new ApplyForPermissionToAppealFlow();
const selectFtpaApplicantType = new SelectFtpaApplicantType();

Then(/^I apply for ftpa permission to appeal$/, async function () {
    await applyForPermissionToAppealFlow.appeal(true);
});

Then(/^I select Appellant for the applicant type$/, async function() {
    await selectFtpaApplicantType.choseAppellant(true);
});

Then(/^I select Home Office for the applicant type$/, async function() {
    await selectFtpaApplicantType.choseHomeOffice(true);
});
