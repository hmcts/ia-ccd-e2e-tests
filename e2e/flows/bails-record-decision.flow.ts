import { browser } from 'protractor';
import { CcdFormPage } from '../pages/ccd-form.page';

export class RecordDecision {

    private ccdFormPage = new CcdFormPage();
    private waitTime = 1000

    async completeJudgeName(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await browser.sleep(this.waitTime);
        await this.ccdFormPage.setFieldValue('Judge name', 'Mr Judge Judgerson');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeSsConsent(clickContinue = false, SsConsentYesOrNo) {
        await this.ccdFormPage.runAccessbility();
        await browser.sleep(this.waitTime);
        await this.ccdFormPage.setFieldValue('Is Secretary of State consent needed?', SsConsentYesOrNo);
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeTribunalDecision(clickContinue = false, tribunalDecision) {
        await this.ccdFormPage.runAccessbility();
        await browser.sleep(this.waitTime);
        await this.ccdFormPage.setFieldValue('What is the Tribunal\'s decision?', tribunalDecision);
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeReasonsForRefusal(clickContinue = false, ssConsent) {
        await this.ccdFormPage.runAccessbility();
        await browser.sleep(this.waitTime);
        if (ssConsent === 'No') {
            await this.ccdFormPage.setFieldValue('Enter the reasons for refusal', 'This is a reason for refusing the application.');
        }
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeReasonsForDecision(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await browser.sleep(this.waitTime);
        await this.ccdFormPage.setFieldValue('Enter the reasons the judge is minded to grant bail', 'This is a reason for minding to grant bail.');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeSsConsentDecision(clickContinue = false, SsConsentDecisionYesOrNo) {
        await this.ccdFormPage.runAccessbility();
        await browser.sleep(this.waitTime);
        await this.ccdFormPage.setFieldValue('Does the Secretary of State give consent to grant bail?', SsConsentDecisionYesOrNo);
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeReleaseStatus(clickContinue = false, releaseStatusYesOrNo) {
        await this.ccdFormPage.runAccessbility();
        await browser.sleep(this.waitTime);
        await this.ccdFormPage.setFieldValue('Will the applicant be released with immediate effect? This includes a situation where the individual will be subject to electronic monitoring.', releaseStatusYesOrNo);
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeConditions(clickContinue = false, conditions = []) {
        await this.ccdFormPage.runAccessbility();
        await browser.sleep(this.waitTime);
        if (conditions.includes('Appearance')) {
            await this.ccdFormPage.click('Appearance (where bail is going to be transferred to the Home Office)');
            await this.ccdFormPage.setFieldValue('Enter the appearance conditions the applicant will be subject to', 'The applicant is to appear before an Immigration Officer at Big Ben between 11am and 1pm on 1st January 2023 or any other place and on any other date and time that may be required by the Home Office or an Immigration Officer.  -OR-  The Applicant must appear before an Immigration Officer on a date and time and by such means as may be notified to him by the Home Office in writing.');
        }
        if (conditions.includes('Activities')) {
            await this.ccdFormPage.click('Activities');
            await this.ccdFormPage.setFieldValue('Enter the activities conditions the applicant will be subject to', 'The Applicant shall not undertake the activities listed below while on immigration bail without further order:  The Applicant is not allowed to work')
        }
        if (conditions.includes('Residence')) {
            await this.ccdFormPage.click('Residence');
            await this.ccdFormPage.setFieldValue('Enter the residence conditions the applicant will be subject to', 'The applicant must reside at 123 Fake Street.  Where an Immigration Judge makes a conditional grant with deferred commencement:  The applicant will reside at an address approved by the probation/offender manager.  By virtue of para 3(8) of schedule 10 of The Immigration Act 2016 this grant of bail will not commence until such address has been approved by probation.  The approval of a residence address will be reviewed by the Tribunal on the first available date after [ ] days unless the Tribunal is notified prior to that date that accommodation has been approved and bail commenced in which case the matter will be dealt with administratively.  In the event that the applicant has not been released then at least 2 clear days before the bail review hearing, the Secretary of State is to update the Tribunal in writing as to the progress made in relation to sourcing and/or approving accommodation for the applicant.')
        }
        if (conditions.includes('Reporting')) {
            await this.ccdFormPage.click('Reporting (where bail is NOT going to be transferred to the Home Office)');
            await this.ccdFormPage.setFieldValue('Enter the reporting conditions the applicant will be subject to', 'The Applicant must report to an Immigration Officer at Big Ben at 12pm on the 1st of every month.')
        }
        if (conditions.includes('Electronic Monitoring')) {
            await this.ccdFormPage.click('Electronic Monitoring');
            await this.ccdFormPage.setFieldValue('Enter the electronic monitoring conditions the applicant will be subject to', 'Note: Where the Tribunal has directed that the Applicant should be subject to an electronic monitoring condition there may be a delay of release of up to 72 hours pending arrangements for the electronic monitoring device.  Bail is granted conditional upon: the applicant being compliant with the fitting of an electronic monitoring device at the point of release from detention; and  the Secretary of State promptly arranging the fitting of the electronic monitoring device at the place of the Applicant\'s detention. If the secretary of State does not complete the fitting of the electronic monitoring device within 72 hours then this grant of bail will commence and the applicant is to be released subject to the other conditions of this grant of bail. In such an event the Secretary of State will make arrangements for the fitting of the electronic monitoring device post release.')
        }
        if (conditions.includes('Other')) {
            await this.ccdFormPage.click('Other');
            await this.ccdFormPage.setFieldValue('Enter the other conditions the applicant will be subject to', 'This other new condition.')
        }
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeFinancialCondition(clickContinue = false, financialConditionYesOrNo) {
        await this.ccdFormPage.runAccessbility();
        await browser.sleep(this.waitTime);
        await this.ccdFormPage.setFieldValue('Will the applicant be subject to a financial condition?', financialConditionYesOrNo);
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeFinancialConditionDetails(clickContinue = false, financialConditionDetailsYesOrNo) {
        await this.ccdFormPage.runAccessbility();
        await browser.sleep(this.waitTime);
        await this.ccdFormPage.setFieldValue('Is the financial condition amount correct?', financialConditionDetailsYesOrNo);
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeConfirmFinancialConditionAmount(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await browser.sleep(this.waitTime);
        await this.ccdFormPage.typeText('financialCondAmount1', '1');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeFinancialConditionSupporter(clickContinue = false, numberOfSupporters, yesOrNoForEachSupporter = []) {
        for (let i = 0; i < numberOfSupporters; i++) {
            await this.ccdFormPage.runAccessbility();
            await browser.sleep(this.waitTime);
            await this.ccdFormPage.setFieldValue('Did the judge agree to accept financial condition supporter ' + (i + 1) + '?', yesOrNoForEachSupporter[i]);
            if (clickContinue) {
                await this.ccdFormPage.click('Continue');
            }
            await this.ccdFormPage.runAccessbility();
            await browser.sleep(this.waitTime);
            await this.ccdFormPage.typeText('financialAmountSupporterUndertakes' + (i + 1), '1');
            if (clickContinue) {
                await this.ccdFormPage.click('Continue');
            }
        }
    }

    async completeBailTransfer(clickContinue = false, bailTransferYesOrNo) {
        await this.ccdFormPage.runAccessbility();
        await browser.sleep(this.waitTime);
        await this.ccdFormPage.setFieldValue('Will the future management of bail for this applicant transfer to the Secretary of State?', bailTransferYesOrNo);
        if (bailTransferYesOrNo === 'No') {
            await this.ccdFormPage.setFieldValue('Enter any relevant details (Optional)', 'Other relevant details');
        }
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeCheckYourAnswers(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await browser.sleep(this.waitTime);
        if (clickContinue) {
            await this.ccdFormPage.click('Record decision');
            browser.sleep(30000)
        }
    }

    async recordDecision(
    clickContinue = false,
    SsConsentYesOrNo: string,
    tribunalDecision: string,
    SsConsentDecisionYesOrNo: string,
    releaseStatusYesOrNo: string,
    conditions: string[],
    financialConditionYesOrNo: string,
    financialConditionDetailsYesOrNo: string,
    numberOfSupporters: number,
    yesOrNoForEachSupporter: string[],
    bailTransferYesOrNo: string) {
        await this.ccdFormPage.runAccessbility();
        await browser.sleep(this.waitTime);
        await this.ccdFormPage.selectNextStep('Record the decision');
        await this.ccdFormPage.click('Go');
        await this.completeJudgeName(true);
        await this.completeSsConsent(true, SsConsentYesOrNo)
        await this.completeTribunalDecision(true, tribunalDecision)
        if (tribunalDecision === 'Refused') {
            await this.completeReasonsForRefusal(true, 'No')
            await this.completeCheckYourAnswers(true)
        } else if (tribunalDecision === 'Granted') {
            await this.completeReleaseStatus(true, releaseStatusYesOrNo)
            await this.completeConditions(true, conditions)
            await this.completeFinancialCondition(true, financialConditionYesOrNo)
            if (financialConditionYesOrNo === 'Yes') {
                await this.completeFinancialConditionDetails(true, financialConditionDetailsYesOrNo)
                await this.completeConfirmFinancialConditionAmount(true)
                if (numberOfSupporters > 0) {
                    await this.completeFinancialConditionSupporter(true, numberOfSupporters, yesOrNoForEachSupporter)
                }
            }
            await this.completeBailTransfer(true, bailTransferYesOrNo)
            await this.completeCheckYourAnswers(true)
        } else if (tribunalDecision === 'Minded to grant') {
            await this.completeReasonsForDecision(true)
            await this.completeSsConsentDecision(true, SsConsentDecisionYesOrNo)
            if (SsConsentDecisionYesOrNo === 'No') {
                await this.completeReasonsForRefusal(true, 'Yes')
                await this.completeCheckYourAnswers(true)
            } else if (SsConsentDecisionYesOrNo === 'Yes') {
                await this.completeReleaseStatus(true, releaseStatusYesOrNo)
                await this.completeConditions(true, conditions)
                await this.completeFinancialCondition(true, financialConditionYesOrNo)
                if (financialConditionYesOrNo === 'Yes') {
                    await this.completeFinancialConditionDetails(true, financialConditionDetailsYesOrNo)
                    await this.completeConfirmFinancialConditionAmount(true)
                    if (numberOfSupporters > 0) {
                        await this.completeFinancialConditionSupporter(true, numberOfSupporters, yesOrNoForEachSupporter)
                    }
                }
                await this.completeBailTransfer(true, bailTransferYesOrNo)
                await this.completeCheckYourAnswers(true)
            }
        }
        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }
}
