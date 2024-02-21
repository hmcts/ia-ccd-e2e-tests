import { FtpaAppealFlow } from '../../../flows/ftpa-appeal.flow';
import { Given, Then } from '@cucumber/cucumber';
import { expect } from 'chai';
import { Wait } from '../../../enums/wait';
import { CcdPage } from '../../../pages/ccd.page';

const ftpaAppealFlow = new FtpaAppealFlow();
const ccdPage = new CcdPage();

Given(/^I submit FTPA Appellant appeal$/, async function () {
  await ftpaAppealFlow.submitAppellantAppeal(true);
});

Given(/^I submit FTPA Respondent appeal$/, async function () {
  await ftpaAppealFlow.submitRespondentAppeal(true);
});

Then(/^I verify the (presence|absence) of appellant FTPA documents under (Documents|FTPA) tab$/, async function (seeOrNotSee, documentOrFtpa) {

    const isDisplayed = (seeOrNotSee === 'presence');
    const isFtpa = (documentOrFtpa === 'FTPA');
    if (isDisplayed) {
        if (isFtpa) {
            expect(await ccdPage.headingContains('FTPA', isDisplayed)).to.equal(isDisplayed);
            expect(await ccdPage.contentContains('Appellant: Application for permission to appeal', Wait.instant)).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Document', 'FTPAAppellantGrounds.pdf', true, 1, 'Grounds of the application')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Describe the document', 'This is the FTPA Appellant grounds', true, 1, 'Grounds of the application')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Document', 'FTPAAppellantEvidence.pdf', true, 1, 'Supporting evidence')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Describe the document', 'This is the FTPA Appellant evidence', true, 1, 'Supporting evidence')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Application date', '{$TODAY|D MMM YYYY}', true)).to.equal(true);
        } else {
            expect(await ccdPage.headingContains('Documents', isDisplayed)).to.equal(isDisplayed);
            expect(await ccdPage.isFieldValueDisplayed('Document', 'FTPAAppellantGrounds.pdf', true, 1, 'FTPA Appellant documents')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Description', 'This is the FTPA Appellant grounds', true, 1, 'FTPA Appellant documents')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Date uploaded', '{$TODAY|D MMM YYYY}', true, 1, 'FTPA Appellant documents')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Description', 'This is the FTPA Appellant evidence', true, 1, 'FTPA Appellant documents', 1)).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Document', 'FTPAAppellantEvidence.pdf', true, 1, 'FTPA Appellant documents', 1)).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Date uploaded', '{$TODAY|D MMM YYYY}', true, 1, 'FTPA Appellant documents', 1)).to.equal(true);
        }
    } else {
        expect(await ccdPage.contentContains('FTPAAppellantGrounds.pdf', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('FTPAAppellantEvidence.pdf', Wait.instant)).to.equal(false);
        if (isFtpa) {
            expect(await ccdPage.contentContains('Appellant: Application for permission to appeal', Wait.instant)).to.equal(false);
            expect(await ccdPage.contentContains('Grounds of the application', Wait.instant)).to.equal(false);
            expect(await ccdPage.contentContains('Supporting evidence', Wait.instant)).to.equal(false);
        } else {
            expect(await ccdPage.contentContains('FTPA Appellant documents', Wait.instant)).to.equal(false);
        }
    }
});

Then(/^I verify the (presence|absence) of respondent FTPA documents under (Documents|FTPA) tab$/, async function (seeOrNotSee, documentOrFtpa) {

    const isDisplayed = (seeOrNotSee === 'presence');
    const isFtpa = (documentOrFtpa === 'FTPA');
    if (isDisplayed) {
        if (isFtpa) {
            expect(await ccdPage.headingContains('FTPA', isDisplayed)).to.equal(isDisplayed);
            expect(await ccdPage.contentContains('Home Office: Application for permission to appeal', Wait.instant)).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Document', 'FTPARespondentGrounds.pdf', true, 1, 'Grounds of the application')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Describe the document', 'This is the FTPA Respondent grounds', true, 1, 'Grounds of the application')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Document', 'FTPARespondentEvidence.pdf', true, 1, 'Supporting evidence')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Describe the document', 'This is the FTPA Respondent evidence', true, 1, 'Supporting evidence')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Application date', '{$TODAY|D MMM YYYY}', true)).to.equal(true);
        } else {
            expect(await ccdPage.headingContains('Documents', isDisplayed)).to.equal(isDisplayed);
            expect(await ccdPage.isFieldValueDisplayed('Document', 'FTPARespondentGrounds.pdf', true, 1, 'FTPA Home Office documents')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Description', 'This is the FTPA Respondent grounds', true, 1, 'FTPA Home Office documents')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Date uploaded', '{$TODAY|D MMM YYYY}', true, 1, 'FTPA Home Office documents')).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Description', 'This is the FTPA Respondent evidence', true, 1, 'FTPA Home Office documents', 1)).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Document', 'FTPARespondentEvidence.pdf', true, 1, 'FTPA Home Office documents', 1)).to.equal(true);
            expect(await ccdPage.isFieldValueDisplayed('Date uploaded', '{$TODAY|D MMM YYYY}', true, 1, 'FTPA Home Office documents', 1)).to.equal(true);
        }
    } else {
        expect(await ccdPage.contentContains('FTPARespondentGrounds.pdf', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('FTPARespondentEvidence.pdf', Wait.instant)).to.equal(false);
        if (isFtpa) {
            expect(await ccdPage.contentContains('Home Office: Application for permission to appeal', Wait.instant)).to.equal(false);
            expect(await ccdPage.contentContains('Grounds of the application', Wait.instant)).to.equal(false);
            expect(await ccdPage.contentContains('Supporting evidence', Wait.instant)).to.equal(false);
        } else {
            expect(await ccdPage.contentContains('FTPA Home Office documents', Wait.instant)).to.equal(false);
        }
    }
});
