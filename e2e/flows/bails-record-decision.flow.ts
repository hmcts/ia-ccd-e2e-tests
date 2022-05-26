import { CcdFormPage } from '../pages/ccd-form.page';

export class RecordDecision {

    private ccdFormPage = new CcdFormPage();

    async completeJudgeName(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Judge name', 'Mr Judge Judgerson');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeSsConsent(clickContinue = false, yesOrNo) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Is Secretary of State consent needed?', yesOrNo);
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeTribunalDecision(clickContinue = false, decision) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('What is the Tribunal\'s decision?', decision);
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeReasonsForRefusal(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Enter the reasons for refusal', 'This is a reason for refusing the application.');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeReasonsForDecision(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Enter the reasons the judge is minded to grant bail', 'This is a reason for minding to grant bail.');
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeSsConsentDecision(clickContinue = false, yesOrNo) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Does the Secretary of State give consent to grant bail?', yesOrNo);
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeReleaseStatus(clickContinue = false, yesOrNo) {
        await this.ccdFormPage.runAccessbility();
        await this.ccdFormPage.setFieldValue('Will the applicant be released with immediate effect?', yesOrNo);
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeConditions(clickContinue = false, choices = []) {
        await this.ccdFormPage.runAccessbility();
        if (choices.includes('Appearance')) {
            await this.ccdFormPage.click('Appearance (where bail is going to be transferred to the Home Office)');
        }
        if (choices.includes('Activities')) {
            await this.ccdFormPage.click('Activities');
        }
        if (choices.includes('Residence')) {
            await this.ccdFormPage.click('Residence');
        }
        if (choices.includes('Reporting')) {
            await this.ccdFormPage.click('Reporting (where bail is NOT going to be transferred to the Home Office)');
        }
        if (choices.includes('Electronic Monitoring')) {
            await this.ccdFormPage.click('Electronic Monitoring');
        }
        if (choices.includes('Other')) {
            await this.ccdFormPage.click('Other');
        }
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }
}
