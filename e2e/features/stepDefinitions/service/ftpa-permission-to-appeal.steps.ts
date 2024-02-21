import { FtpaAppellantAppealFlow } from '../../../flows/ftpa-appellant-appeal.flow';
import { FtpaRespondentAppealFlow } from '../../../flows/ftpa-respondent-appeal';

import { SelectFtpaApplicantType } from '../../../flows/ftpa-applicant-type.flow';
import { Then } from '@cucumber/cucumber';

const ftpaAppellantFlow = new FtpaAppellantAppealFlow();
const ftpaRespondentFlow = new FtpaRespondentAppealFlow();
const selectFtpaApplicantType = new SelectFtpaApplicantType();

Then(/^I apply for appellant FTPA$/, async function () {
    await ftpaAppellantFlow.appeal(true);
});

Then(/^I apply for respondent FTPA$/, async function () {
    await ftpaRespondentFlow.appeal(true);
});

Then(/^I select Appellant for the applicant type$/, async function() {
    await selectFtpaApplicantType.choseAppellant(true);
});

Then(/^I select Home Office for the applicant type$/, async function() {
    await selectFtpaApplicantType.choseHomeOffice(true);
});
