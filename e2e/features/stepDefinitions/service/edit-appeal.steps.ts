import { StartAppealFlow } from '../../../flows/start-appeal.flow';
import { Given } from 'cucumber';

const isfeePaymentEnabled = require('../../../ia.conf').isfeePaymentEnabled === 'true';
const isOutOfCountryEnabled = require('../../../ia.conf').isOutOfCountryEnabled === 'true';
const startAppealFlow = new StartAppealFlow();

Given(/^I edit the appeal with appellant living in UK `?([^\s`]+)`?$/, async function (appellantInUk) {
    if (isOutOfCountryEnabled) {
        if (appellantInUk === 'No') {
            if (isfeePaymentEnabled) {
                await startAppealFlow.editInitialAppealWithFeeOutOfCountryWithSponsor(true, 'Smith', 'Benett', 'wantsSms', 'Yes');
            } else {
                await startAppealFlow.editInitialNonPaymentAppealOutOfCountryWithSponsor(true, 'Smith', 'Benett', 'wantsSms', 'Yes');
            }
        } else {
            if (isfeePaymentEnabled) {
                await startAppealFlow.editInitialAppealWithFee(true, 'PA', 'no remission', 'hearing fee');
            } else {
                await startAppealFlow.editInitialNonPaymentAppeal(true, 'PA');
            }
        }
    } else {
        if (isfeePaymentEnabled) {
            await startAppealFlow.editInitialAppealWithFee(true, 'PA', 'no remission', 'hearing fee');
        } else {
            await startAppealFlow.editInitialNonPaymentAppeal(true, 'PA');
        }
    }
});

Given(/^I edit the appeal after submit with appellant living in UK `?([^\s`]+)`?$/, async function (appellantInUk) {
    if (isOutOfCountryEnabled) {
        if (appellantInUk === 'No') {
            await startAppealFlow.editInitialAppealAfterSubmitWithFeeOutOfCountryWithSponsor(true, 'Smith', 'Benett', 'wantsSms', 'Yes');
        } else {
            await startAppealFlow.editInitialAppealAppealAfterSubmit(true);
        }
    }
});
