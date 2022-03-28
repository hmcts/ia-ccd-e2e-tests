import { CcdFormPage } from '../../../pages/ccd-form.page';
import { StartBailApplicationFlow } from '../../../flows/start-bail-application.flow';
import { Given } from 'cucumber';
import { expect } from 'chai';

const ccdFormPage = new CcdFormPage();
const startBailApplicationFlow = new StartBailApplicationFlow();

Given(/^I save my initial application as a `(Admin Officer|Home Office|Legal Rep)` for a (Prison|Immigration removal centre) detention with (no|one|two) financial condition supporters and with (a|no) Legal Representative$/,
    async function (
    user,
    detentionFacility,
    noOfSupporters,
    legalRepresentativeOrNot) {
    await startBailApplicationFlow.saveInitialApplication(true, user, detentionFacility, noOfSupporters, legalRepresentativeOrNot);
});

Given('I complete the `Before you start` page', async function () {
    expect(await ccdFormPage.headingContains('Before you start')).to.equal(true);
    await startBailApplicationFlow.completeBeforeYouStart(true);
});

Given('I complete the `Which party sent the application to the Tribunal?` page', async function () {
    expect(await ccdFormPage.headingContains('Which party sent the application to the Tribunal?')).to.equal(true);
    await startBailApplicationFlow.completeWhichPartySentApplication(true, 'Applicant');
});

Given('I complete the `What is the applicant’s name?` page', async function () {
    expect(await ccdFormPage.headingContains('What is the applicant’s name?')).to.equal(true);
    await startBailApplicationFlow.completeApplicantName(true);
});

Given('I complete the `What is the applicant’s date of birth?` page', async function () {
    expect(await ccdFormPage.headingContains('What is the applicant’s date of birth?')).to.equal(true);
    await startBailApplicationFlow.completeApplicantDOB(true);
});

Given('I complete the `What is the applicant’s gender?` page', async function () {
    expect(await ccdFormPage.headingContains('What is the applicant’s gender?')).to.equal(true);
    await startBailApplicationFlow.completeApplicantGender(true);
});

Given('I complete the `What is the applicant’s nationality?` page', async function () {
    expect(await ccdFormPage.headingContains('What is the applicant’s nationality?')).to.equal(true);
    await startBailApplicationFlow.completeApplicantNationality(true);
});

Given('I complete the `What is the applicant’s Home Office reference number?` page', async function () {
    expect(await ccdFormPage.headingContains('What is the applicant’s Home Office reference number?')).to.equal(true);
    await startBailApplicationFlow.completeApplicantReferenceNumber(true);
});

Given('I complete the `Where is the applicant detained?` page', async function () {
    expect(await ccdFormPage.headingContains('Where is the applicant detained?')).to.equal(true);
    await startBailApplicationFlow.completeDetentionFacility(true, 'Prison');
});

Given('I complete the `In which prison is the applicant detained?` page', async function () {
    expect(await ccdFormPage.headingContains('In which prison is the applicant detained?')).to.equal(true);
    await startBailApplicationFlow.completeWhichPrison(true);
});

Given('I complete the `In which immigration removal centre is the applicant detained?` page', async function () {
    expect(await ccdFormPage.headingContains('In which immigration removal centre is the applicant detained?')).to.equal(true);
    await startBailApplicationFlow.completeWhichIRC(true);
});

Given('I complete the `What date did the applicant arrive in the UK?` page', async function () {
    expect(await ccdFormPage.headingContains('What date did the applicant arrive in the UK?')).to.equal(true);
    await startBailApplicationFlow.completeDateOfApplicantArrival(true);
});

Given('I complete the `Does the applicant have access to a mobile phone?` page', async function () {
    expect(await ccdFormPage.headingContains('Does the applicant have access to a mobile phone?')).to.equal(true);
    await startBailApplicationFlow.completeApplicantMobilePhone(true);
});

Given('I complete the `Does the applicant have an appeal hearing pending in the First-tier Tribunal?` page', async function () {
    expect(await ccdFormPage.headingContains('Does the applicant have an appeal hearing pending in the First-tier Tribunal (IAC)?')).to.equal(true);
    await startBailApplicationFlow.completeAppealHearingPending(true);
});

Given('I complete the `Has the applicant made an application for immigration bail before?` page', async function () {
    expect(await ccdFormPage.headingContains('Has the applicant made an application for immigration bail before?')).to.equal(true);
    await startBailApplicationFlow.completePreviousBailApplication(true);
});

Given('I complete the `Has the applicant been refused immigration bail at a hearing within the last 28 days?` page', async function () {
    expect(await ccdFormPage.headingContains('Has the applicant been refused immigration bail at a hearing within the last 28 days?')).to.equal(true);
    await startBailApplicationFlow.completeRefusedBail(true);
});

Given('I complete the `Does the applicant have somewhere to live if this bail application is granted?` page', async function () {
    expect(await ccdFormPage.headingContains('Does the applicant have somewhere to live if this bail application is granted?')).to.equal(true);
    await startBailApplicationFlow.completeApplicantPlaceToLive(true);
});

Given('I complete the `At what address will the applicant live if this bail application is granted?` page', async function () {
    expect(await ccdFormPage.headingContains('At what address will the applicant live if this bail application is granted?')).to.equal(true);
    await startBailApplicationFlow.completeApplicantAddress(true);
});

Given('I complete the `Does the applicant agree to be bound by a financial condition?` page', async function () {
    expect(await ccdFormPage.headingContains('Does the applicant agree to be bound by a financial condition?')).to.equal(true);
    await startBailApplicationFlow.completeFinancialConditionAgree(true);
});

Given('I complete the `Does the applicant have a financial condition supporter?` page', async function () {
    expect(await ccdFormPage.headingContains('Does the applicant have a financial condition supporter?')).to.equal(true);
    await startBailApplicationFlow.completeFinancialConditionSupporter(true, 'Yes');
});

Given(/^I complete the `What is the financial condition supporter’s name` page for supporter (1|2|3|4)$/, async function (number) {
    expect(await ccdFormPage.headingContains('What is the financial condition supporter’s name?')).to.equal(true);
    await startBailApplicationFlow.completeFinancialConditionSupporterName(true, number);
});

Given(/^I complete the `What is the financial condition supporter’s address` page for supporter (1|2|3|4)$/, async function (number) {
    expect(await ccdFormPage.headingContains('What is the financial condition supporter’s address?')).to.equal(true);
    await startBailApplicationFlow.completeFinancialConditionSupporterAddress(true, number);
});

Given(/^I complete the `What are the financial condition supporter’s contact details` page for supporter (1|2|3|4)$/, async function (number) {
    expect(await ccdFormPage.headingContains('What are the financial condition supporter’s contact details?')).to.equal(true);
    await startBailApplicationFlow.completeFinancialConditionSupporterContactDetails(true, number);
});

Given(/^I complete the `What is the financial condition supporter’s date of birth` page for supporter (1|2|3|4)$/, async function (number) {
    expect(await ccdFormPage.headingContains('What is the financial condition supporter’s date of birth?')).to.equal(true);
    await startBailApplicationFlow.completeFinancialConditionSupporterDOB(true, number);
});

Given(/^I complete the `What is the financial condition supporter’s relationship to the applicant` page for supporter (1|2|3|4)$/, async function (number) {
    expect(await ccdFormPage.headingContains('What is the financial condition supporter’s relationship to the applicant?')).to.equal(true);
    await startBailApplicationFlow.completeFinancialConditionSupporterRelationship(true, number);
});

Given(/^I complete the `What is the financial condition supporter’s occupation` page for supporter (1|2|3|4)$/, async function (number) {
    expect(await ccdFormPage.headingContains('What is the financial condition supporter’s occupation?')).to.equal(true);
    await startBailApplicationFlow.completeFinancialConditionSupporterOccupation(true, number);
});

Given(/^I complete the `What is the financial condition supporter’s immigration status` page for supporter (1|2|3|4)$/, async function (number) {
    expect(await ccdFormPage.headingContains('What is the financial condition supporter’s immigration status?')).to.equal(true);
    await startBailApplicationFlow.completeFinancialConditionSupporterImmigrationStatus(true, number);
});

Given(/^I complete the `What is the financial condition supporter’s nationality` page for supporter (1|2|3|4)$/, async function (number) {
    expect(await ccdFormPage.headingContains('What is the financial condition supporter’s nationality?')).to.equal(true);
    await startBailApplicationFlow.completeFinancialConditionSupporterNationality(true, number);
});

Given(/^I complete the `Does the financial condition supporter have a passport` page for supporter (1|2|3|4)$/, async function (number) {
    expect(await ccdFormPage.headingContains('Does the financial condition supporter have a passport?')).to.equal(true);
    await startBailApplicationFlow.completeFinancialConditionSupporterPassport(true, number);
});

Given(/^I complete the `What is the financial condition supporter’s passport number` page for supporter (1|2|3|4)$/, async function (number) {
    expect(await ccdFormPage.headingContains('What is the financial condition supporter’s passport number?')).to.equal(true);
    await startBailApplicationFlow.completeFinancialConditionSupporterPassportNumber(true, number);
});

Given(/^I complete the `What amount does the financial condition supporter undertake to pay` page for supporter (1|2|3|4)$/, async function (number) {
    expect(await ccdFormPage.headingContains('What amount does the financial condition supporter undertake to pay?')).to.equal(true);
    await startBailApplicationFlow.completeFinancialConditionSupporterUndertaking(true, number);
});

Given(/^I complete the `Does the applicant have another financial condition supporter` page for supporter (1|2|3)$/, async function (number) {
    expect(await ccdFormPage.headingContains('Does the applicant have another financial condition supporter?')).to.equal(true);
    await startBailApplicationFlow.completeAnotherFinancialConditionSupporter(true, number);
});

Given('I complete the `Grounds for bail` page', async function () {
    expect(await ccdFormPage.headingContains('Grounds for bail')).to.equal(true);
    await startBailApplicationFlow.completeGroundsForBailInfo(true);
});

Given('I complete the `On what grounds is the applicant applying for bail?` page', async function () {
    expect(await ccdFormPage.headingContains('On what grounds is the applicant applying for bail?')).to.equal(true);
    await startBailApplicationFlow.completeGroundsForBail(true);
});

Given('I complete the `Do you want to provide supporting evidence?` page', async function () {
    expect(await ccdFormPage.headingContains('Do you want to provide supporting evidence?')).to.equal(true);
    await startBailApplicationFlow.completeSupportingEvidenceYesNo(true, 'Yes');
});

Given('I complete the `Provide supporting evidence` page', async function () {
    expect(await ccdFormPage.headingContains('Provide supporting evidence')).to.equal(true);
    await startBailApplicationFlow.completeSupportingEvidenceUpload(true);
});

Given('I complete the `Does the applicant consent to future management of bail being transferred to the Home Office?` page', async function () {
    expect(await ccdFormPage.headingContains('Does the applicant consent to future management of bail being transferred to the Home Office?')).to.equal(true);
    await startBailApplicationFlow.completeBailTransfer(true);
});

Given('I complete the `Does the applicant or any financial condition supporters need an interpreter at the hearing?` page', async function () {
    expect(await ccdFormPage.headingContains('Does the applicant or any financial condition supporters need an interpreter at the hearing?')).to.equal(true);
    await startBailApplicationFlow.completeInterpreterRequirements(true);
});

Given('I complete the `Does the applicant, the applicant’s legal representative or any financial condition supporters have a disability which may affect them at the hearing?` page', async function () {
    expect(await ccdFormPage.headingContains('Does the applicant, the applicant’s legal representative or any financial condition supporters have a disability which may affect them at the hearing?')).to.equal(true);
    await startBailApplicationFlow.completeDisabilityRequirements(true);
});

Given('I complete the `Would the applicant be able to join the hearing by video link?` page', async function () {
    expect(await ccdFormPage.headingContains('Would the applicant be able to join the hearing by video link?')).to.equal(true);
    await startBailApplicationFlow.completeVideoLinkRequirements(true);
});

Given('I complete the `Does the applicant have a legal representative?` page', async function () {
    expect(await ccdFormPage.headingContains('Does the applicant have a legal representative?')).to.equal(true);
    await startBailApplicationFlow.completeLegalRepYesNo(true, 'Yes');
});

Given('I complete the `Enter the legal representative’s details` page', async function () {
    expect(await ccdFormPage.headingContains('Enter the legal representative’s details')).to.equal(true);
    await startBailApplicationFlow.completeLegalRepDetails(true, 'NonLR');
});

Given('I complete the `Upload B1 form` page', async function () {
    expect(await ccdFormPage.headingContains('Upload B1 form')).to.equal(true);
    await startBailApplicationFlow.completeB1Upload(true);
});

Given('I complete the `Check your answers` page', async function () {
    expect(await ccdFormPage.headingContains('Check your answers')).to.equal(true);
    await startBailApplicationFlow.completeCheckYourAnswers(true);
});
