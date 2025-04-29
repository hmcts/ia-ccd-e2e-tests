import { CcdFormPage } from '../../../pages/ccd-form.page';
import { StartAppealFlow } from '../../../flows/start-appeal.flow';
import { Given, Then } from 'cucumber';
import { expect } from 'chai';

const isfeePaymentEnabled = require('../../../ia.conf').isfeePaymentEnabled === 'true';
const isOutOfCountryEnabled = require('../../../ia.conf').isOutOfCountryEnabled === 'true';
const ccdFormPage = new CcdFormPage();
const startAppealFlow = new StartAppealFlow();

Given('I complete the `Tell us about your client` page', async function () {
  expect(await ccdFormPage.headingContains('Tell us about your client')).to.equal(true);
  await startAppealFlow.completeScreeningQuestions(true);
});

Given('I complete the `Tell us about your client out of country` page', async function () {
  expect(await ccdFormPage.headingContains('Tell us about your client')).to.equal(true);
  await startAppealFlow.completeScreeningQuestionsOutOfCountry(true);
});

Given('I complete the `Home Office details` page', async function () {
  expect(await ccdFormPage.headingContains('Home Office details')).to.equal(true);
  await startAppealFlow.completeHomeOfficeReference(true);
});

Given('I complete the `Home Office details ooc` page', async function () {
  expect(await ccdFormPage.headingContains('Home Office details')).to.equal(true);
  await startAppealFlow.completeHomeOfficeReference(true, true);
});

Given('I complete the `Upload the Notice of Decision` page', async function () {
  expect(await ccdFormPage.headingContains('Upload the Notice of Decision')).to.equal(true);
  await startAppealFlow.completeUploadNoticeDecision(true);
});
Given('I complete the `Add appeal form` page', async function () {
  expect(await ccdFormPage.headingContains('Upload appeal form')).to.equal(true);
  await startAppealFlow.completeUploadAppealForm(true);
});

Given('I complete the `Basic details` form', async function () {
  expect(await ccdFormPage.headingContains('Basic details')).to.equal(true);
  await startAppealFlow.completeBasicDetails(false);
});

Given('I complete the `Basic details` page', async function () {
  expect(await ccdFormPage.headingContains('Basic details')).to.equal(true);
  await startAppealFlow.completeBasicDetails(true);
});

Given("I complete the `Tell us about your client's nationality` page", async function () {
  expect(await ccdFormPage.headingContains("Tell us about your client's nationality")).to.equal(true);
  await startAppealFlow.completeNationality(true);
});

Given("I complete the `Your client's address` page", async function () {
  expect(await ccdFormPage.headingContains("Your client's address")).to.equal(true);
  await startAppealFlow.completeClientAddress(true);
});

Given("I complete the `The appellant's contact preference` page", async function () {
  expect(await ccdFormPage.headingContains("The appellant's contact preference")).to.equal(true);
  await startAppealFlow.completeContactPreference(true);
});

Given('I complete the `Type of appeal` page', async function () {
  expect(await ccdFormPage.headingContains('Type of appeal')).to.equal(true);
  await startAppealFlow.completeAppealType(true);
});

Given('I complete the `EA appeal type` page', async function () {
  expect(await ccdFormPage.headingContains('Type of appeal')).to.equal(true);
  await startAppealFlow.completeGivenAppealType(true, 'EA');
});

Given('I complete the `The grounds of your appeal` page', async function () {
  expect(await ccdFormPage.headingContains('The grounds of your appeal')).to.equal(true);
  await startAppealFlow.completeAppealGrounds(true);
});

Given('I complete the `EA appeal grounds` page', async function () {
  expect(await ccdFormPage.headingContains('The grounds of your appeal')).to.equal(true);
  await startAppealFlow.completedGivenAppealGrounds(true, 'EA');
});

Given('I complete the `New matters` page', async function () {
  expect(await ccdFormPage.headingContains('New matters')).to.equal(true);
  await startAppealFlow.completeNewMatters(true);
});

Given('I complete the `Deportation order` page', async function () {
  expect(await ccdFormPage.headingContains('Deportation order')).to.equal(true);
  await startAppealFlow.completeDeportationOrder(true);
});

Given('I complete the `Has your client appealed against any other UK immigration decisions?` page', async function () {
  expect(await ccdFormPage.headingContains('Has your client appealed against any other UK immigration decisions?')).to.equal(true);
  await startAppealFlow.completeOtherAppeals(true);
});

Given('I complete the `Legal representative details` page', async function () {
  expect(await ccdFormPage.headingContains('Legal representative details')).to.equal(true);
  await startAppealFlow.completeLegalRepresentativeDetails(true);
});

Given('I complete the `Remission details` page', async function () {
  expect(await ccdFormPage.headingContains('Fee remissions')).to.equal(true);
  await startAppealFlow.completeRemissionDetails(true, 'a remission');
});

Given('I complete the `no remission details` page', async function () {
  expect(await ccdFormPage.headingContains('Fee remissions')).to.equal(true);
  await startAppealFlow.completeRemissionDetails(true, 'no remission');
});

Given('I complete the `Start appeal check your answers` page', async function () {
  expect(await ccdFormPage.headingContains('Check your answers')).to.equal(true);
  await startAppealFlow.completeCheckYourAnswers(true);
});

Given(/^I skip the `?([^`]+)`? page by clicking `?([^`]+)`?$/, async function (pageName, buttonName) {
  expect(await ccdFormPage.headingContains(pageName)).to.equal(true);
  await ccdFormPage.click(buttonName);
});

Given('I save my initial appeal', async function () {
  if (isfeePaymentEnabled) {
    await startAppealFlow.saveInitialAppealWithFee(true, 'PA', 'no remission', 'hearing fee');
  } else {
    await startAppealFlow.saveInitialNonPaymentAppeal(true, 'PA');
  }
});

Given('I save my initial appeal with address', async function () {
  if (isfeePaymentEnabled) {
    await startAppealFlow.saveInitialAppealWithFee(true, 'PA', 'no remission', 'hearing fee', true, `Airborne Studios, 52 Newton Street, Manchester`, `M1 1ED`);
  } else {
    await startAppealFlow.saveInitialNonPaymentAppeal(true, 'PA', true, `Airborne Studios, 52 Newton Street, Manchester`, `M1 1ED`);
  }
});

Given(/^I save my initial appeal with appellant living in UK `?([^\s`]+)`?$/, async function (appellantInUk) {
  if (isOutOfCountryEnabled) {
    if (isfeePaymentEnabled) {
      await startAppealFlow.saveInitialAppealWithFeeOutOfCountry(true, 'PA', 'no remission', 'hearing fee', appellantInUk);
    } else {
      await startAppealFlow.saveInitialNonPaymentAppealOutOfCountry(true, 'PA', appellantInUk);
    }
  } else {
    if (isfeePaymentEnabled) {
      await startAppealFlow.saveInitialAppealWithFee(true, 'PA', 'no remission', 'hearing fee');
    } else {
      await startAppealFlow.saveInitialNonPaymentAppeal(true, 'PA');
    }
  }
});

Given(/^I save my out of country `?([^\s`]+)`? appeal with decision type `?([^\s`]+)`?$/, async function (lateAppeal, decisionType) {
  if (isOutOfCountryEnabled) {
    if (isfeePaymentEnabled) {
      await startAppealFlow.saveInitialAppealWithFeeOutOfCountryWithDecision(true, 'PA', 'no remission', 'hearing fee', 'No', decisionType, lateAppeal, 'No', 'No');
    } else {
      await startAppealFlow.saveInitialNonPaymentAppealOutOfCountryWithDecision(true, 'PA', 'No', decisionType, lateAppeal, 'No', 'No');
    }
  } else {
    if (isfeePaymentEnabled) {
      await startAppealFlow.saveInitialAppealWithFee(true, 'PA', 'no remission', 'hearing fee');
    } else {
      await startAppealFlow.saveInitialNonPaymentAppeal(true, 'PA');
    }
  }
});

// tslint:disable-next-line:max-line-length
Given(/^I save my out of country `?([^\s`]+)`? appeal with decision type `?([^\s`]+)`? with address `?([^\s`]+)`? and with sponsor `?([^\s`]+)`?$/, async function (lateAppeal, decisionType, hasAddress = 'Yes', hasSponsor = 'Yes') {
  if (isOutOfCountryEnabled) {
    if (isfeePaymentEnabled) {
      await startAppealFlow.saveInitialAppealWithFeeOutOfCountryWithDecision(true, 'HU', 'no remission', 'hearing fee', 'No', decisionType, lateAppeal, hasAddress, hasSponsor);
    } else {
      await startAppealFlow.saveInitialNonPaymentAppealOutOfCountryWithDecision(true, 'PA', 'No', decisionType, lateAppeal, hasAddress, hasSponsor);
    }
  } else {
    if (isfeePaymentEnabled) {
      await startAppealFlow.saveInitialAppealWithFee(true, 'PA', 'no remission', 'hearing fee');
    } else {
      await startAppealFlow.saveInitialNonPaymentAppeal(true, 'PA');
    }
  }
});

// tslint:disable-next-line:max-line-length
Given(/^I save my out of country appeal with sponsor given name `?([^\s`]+)`? family name `?([^`]+)`? contactPreference `?([^`]+)`? authorisation `?([^`]+)`?$/, async function (givenName, familyName, contactPreference, authorisation) {
  if (isOutOfCountryEnabled) {
    if (isfeePaymentEnabled) {
      await startAppealFlow.saveInitialAppealWithFeeOutOfCountryWithSponsor(true, givenName, familyName, contactPreference, authorisation);
    } else {
      await startAppealFlow.saveInitialNonPaymentAppealOutOfCountryWithSponsor(true, givenName, familyName, contactPreference, authorisation);
    }
  } else {
    if (isfeePaymentEnabled) {
      await startAppealFlow.saveInitialAppealWithFee(true, 'PA', 'no remission', 'hearing fee');
    } else {
      await startAppealFlow.saveInitialNonPaymentAppeal(true, 'PA');
    }
  }
});

Given(/^I save my initial internal `?([^\s`]+)`? appeal type without remission and `?([^\s`]+)`? hearing fee and pay `?([^\s`]+)`?$/, async function (appealType, feeType, paymentChoice) {
  await startAppealFlow.saveInitialInternalAppealWithoutRemission(true, appealType, feeType, paymentChoice);
});

Given(/^I save my initial detained `?([^\s`]+)`? appeal type without remission and `?([^\s`]+)`? hearing fee and pay `?([^\s`]+)`?$/, async function (appealType, feeType, paymentChoice) {
  await startAppealFlow.saveInitialDetainedAppealWithoutRemission(true, appealType, feeType, paymentChoice);
});

Given(/^I save my initial `?([^\s`]+)`? appeal type without remission and `?([^\s`]+)`? hearing fee and pay `?([^\s`]+)`?$/, async function (appealType, feeType, paymentChoice) {
  await startAppealFlow.saveInitialAppealWithoutRemission(true, appealType, feeType, paymentChoice);
});

Given(/^I save my initial `?([^\s`]+)`? appeal type with `?([^`]+)`? and `?([^\s`]+)`? hearing fee$/, async function (appealType, remission, feeType) {
  await startAppealFlow.saveInitialAppealWithFee(true, appealType, remission, feeType);
});

Given(/^I save my initial `?([^\s`]+)`? appeal type with `?([^`]+)`? and pay now `?([^\s`]+)`? hearing fee$/, async function (appealType, remission, feeType) {
  await startAppealFlow.saveInitialAppealPayNowWithFee(true, appealType, remission, feeType);
});

Given(/^I save my initial `?([^\s`]+)`? appeal type with `?([^`]+)`? and pay now `?([^\s`]+)`? hearing fee and out of time$/, async function (appealType, remission, feeType) {
  await startAppealFlow.saveInitialAppealPayNowWithFeeOutOfTime(true, appealType, remission, feeType);
});

Given(/^I save my initial `?([^\s`]+)`? appeal type with `?([^`]+)`? and `?([^\s`]+)`? hearing fee and out of time$/, async function (appealType, remission, feeType) {
  await startAppealFlow.saveInitialAppealWithFeeOutOfTime(true, appealType, remission, feeType);
});

Given(/^I save my initial `?([^\s`]+)`? appeal type with `?([^`]+)`? and pay offline `?([^\s`]+)`? hearing fee$/, async function (appealType, remission, feeType) {
  await startAppealFlow.saveInitialAppealWithFeePayOffline(true, appealType, remission, feeType);
});

Given(/^I save my initial `?([^\s`]+)`? appeal type with `?([^`]+)`? and `?([^\s`]+)`? hearing fee and pay offline$/, async function (appealType, remission, feeType) {
  await startAppealFlow.saveInitialAppealWithFeePayOffline(true, appealType, remission, feeType);
});

Given(/^I save my initial `?([^\s`]+)`? appeal type with `?([^`]+)`? and `?([^\s`]+)`? hearing fee and pay later$/, async function (appealType, remission, feeType) {
  await startAppealFlow.saveInitialAppealWithFeePayLater(true, appealType, remission, feeType);
});

Given(/^I save my initial `?([^\s`]+)`? appeal type with `?([^`]+)`? and pay offline `?([^\s`]+)`? hearing fee and out of time$/, async function (appealType, remission, feeType) {
  await startAppealFlow.saveInitialOutOfTimeAppealWithFeePayOffline(true, appealType, remission, feeType);
});

Given(/^I save my initial `?([^\s`]+)`? appeal type with `?([^`]+)`? and pay later `?([^\s`]+)`? hearing fee and out of time$/, async function (appealType, remission, feeType) {
  await startAppealFlow.saveInitialOutOfTimeAppealWithFeePayLater(true, appealType, remission, feeType);
});

Given('I save my initial appeal with out of time decision letter', async function () {
  await startAppealFlow.saveOutOfTimeAppeal(true);
});

Given(/^I save my initial appeal with `?([^`]+)`? address and `?([^`]+)`? postcode$/, async function (address, postcode) {
  await startAppealFlow.saveAppeal(true, true, address, postcode);
});

Given(/^I save my initial `?([^\s`]+)`? appeal for nonPayment `?([^\s`]+)`? hearing$/, async function (appealType, hearingOption) {
  await startAppealFlow.saveInitialNonPaymentAppeal(true, appealType, false, '', '', hearingOption);
});

Given('I wait for any found addresses to load', async function () {
  await ccdFormPage.doesDropdownHaveValues('Select an address');
});

Given(/^I save my initial appeal with Home Office Reference\/Case ID `?([^\s`]+)`?$/, async function (homeOfficeReference) {
  await startAppealFlow.saveInitialAppealWithHomeOfficeReference(true, homeOfficeReference);
});

Given(/^I save my initial appeal with client living in United Kingdom `?([^\s`]+)`?$/, async function (appellantInUk) {
  await startAppealFlow.completeOutOfCountryQuestion(true, appellantInUk);
});

Then(/^I see a list of all nationalities$/, async function () {
  const nationalities = await ccdFormPage.getFieldOptions('Nationality', 'first', 'Nationality', 'first');

  expect(nationalities).to.have.lengthOf(252);
  expect(nationalities.includes('Afghanistan')).to.equal(true);
  expect(nationalities.includes('Stateless')).to.equal(true);
  expect(nationalities.includes('Zimbabwe')).to.equal(true);
});

Given('I complete the `Entry clearance decision details` page', async function () {
  expect(await ccdFormPage.headingContains('Entry clearance decision details')).to.equal(true);
  await startAppealFlow.completeGlobalWebFormReference(true);
});

Given('I complete the `Departure date` page', async function () {
  expect(await ccdFormPage.headingContains('Departure date')).to.equal(true);
  await startAppealFlow.completeDepartureDate(true);
});

Given('I complete the `Decision type` page', async function () {
  expect(await ccdFormPage.headingContains('Out of country decision')).to.equal(true);
  await startAppealFlow.completeDecisionType(true, 'refusalOfHumanRights');
});

Given('I complete the `Decision type protection claim` page', async function () {
  expect(await ccdFormPage.headingContains('Out of country decision')).to.equal(true);
  await startAppealFlow.completeDecisionType(true, 'protectionClaim');
});

Given('I complete the `Decision type remove client` page', async function () {
  expect(await ccdFormPage.headingContains('Out of country decision')).to.equal(true);
  await startAppealFlow.completeDecisionType(true, 'removeClient');
});

Given('I complete the `Is your client currently living in the United Kingdom?` page', async function () {
  expect(await ccdFormPage.headingContains('Tell us about your client')).to.equal(true);
  await startAppealFlow.completeOutOfCountryQuestion(true);
});

Given("I complete the `Your client's ooc address` page", async function () {
  expect(await ccdFormPage.headingContains("Your client's address")).to.equal(true);
  await startAppealFlow.completeClientAddressOutOfCountry(true, true);
});

Given('I complete the `Sponsor` page', async function () {
  await startAppealFlow.completeSponsorQuestion(true, 'Yes');
  await startAppealFlow.completeSponsorNames(true);
  await startAppealFlow.completeSponsorAddress(true, 'First Tier Tribunal Immigration & Asylum Chamber, Taylor House, 88 Rosebery Avenue, London', 'EC1R 4QU');
  await startAppealFlow.completeSponsorContactPreference(true, '');
  await startAppealFlow.completeSponsorAuthorisation(true);
});

Given(/^I save my legal rep details and continue `?([^\s`]+)`?$/, async function (appealType) {
  if (isfeePaymentEnabled) {
    await startAppealFlow.saveLegalRepAndContinueWithFee(true, 'without', appealType);
  } else {
    await startAppealFlow.saveLegalRepAndContinueNonPaymentAppeal(true);
  }
});
