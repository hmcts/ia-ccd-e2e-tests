import { ApplyForPermissionToAppealFlow } from '../../../flows/apply-for-permission-to-appeal.flow';
import { Then } from 'cucumber';

const applyForPermissionToAppealFlow = new ApplyForPermissionToAppealFlow();

Then(/^I apply for ftpa permission to appeal$/, async function () {
    await applyForPermissionToAppealFlow.appeal(true);
});
