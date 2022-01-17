import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class ExclusionsFlow {

    private ccdFormPage = new CcdFormPage();

    async legalOpsExclusion(clickContinue = false) {
        await this.ccdFormPage.headingContains('Exclusions');
        await this.ccdFormPage.click('Add');
        await this.ccdFormPage.headingContains('Choose who the exclusion is for');
        await this.ccdFormPage.click( 'Exclude me');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.setFieldValue(
            'some exclusions reason',
            'text area'
        );
        await this.ccdFormPage.click('Continue');
        await browser.sleep(200);
        await this.ccdFormPage.click('Confirm exclusion');
        await this.ccdFormPage.contentContains('You\'ve excluded yourself from a case.');

    }
    async legalOpsExcludeAnotherLegalOps(clickContinue = false) {
        await this.ccdFormPage.headingContains('Exclusions');
        await this.ccdFormPage.click('Add');
        await this.ccdFormPage.headingContains('Choose who the exclusion is for');
        await this.ccdFormPage.click( 'Exclude another person');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click( 'Legal Ops');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.setFieldValue(
            'some exclusions reason',
            'text area'
        );
        await this.ccdFormPage.click('Continue');
        await browser.sleep(200);
        await this.ccdFormPage.click('Confirm exclusion');
        await this.ccdFormPage.contentContains('You\'ve excluded yourself from a case.');
    }

    async JudicialExclusion(clickContinue = false) {
        await this.ccdFormPage.headingContains('Exclusions');
        await this.ccdFormPage.click('Add');
        await this.ccdFormPage.headingContains('Choose who the exclusion is for');
        await this.ccdFormPage.click('Exclude me');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.setFieldValue(
            'some exclusions reason',
            'text area'
        );
        await this.ccdFormPage.click('Continue');
        await browser.sleep(200);
        await this.ccdFormPage.click('Confirm exclusion');
        await this.ccdFormPage.contentContains('You\'ve excluded yourself from a case.');

    }
    async judicialExcludeAnotherJudicial(clickContinue = false) {
        await this.ccdFormPage.headingContains('Exclusions');
        await this.ccdFormPage.click('Add');
        await this.ccdFormPage.headingContains('Choose who the exclusion is for');
        await this.ccdFormPage.click( 'Exclude another person');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click( 'Judicial');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.setFieldValue(
            'some exclusions reason',
            'text area'
        );
        await this.ccdFormPage.click('Continue');
        await browser.sleep(200);
        await this.ccdFormPage.click('Confirm exclusion');
        await this.ccdFormPage.contentContains('You\'ve excluded yourself from a case.');
    }

    async adminExclusion(clickContinue = false) {
        await this.ccdFormPage.headingContains('Exclusions');
        await this.ccdFormPage.click('Add');
        await this.ccdFormPage.headingContains('Choose who the exclusion is for');
        await this.ccdFormPage.click('Exclude me');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.setFieldValue(
            'some exclusions reason',
            'text area'
        );
        await this.ccdFormPage.click('Continue');
        await browser.sleep(200);
        await this.ccdFormPage.click('Confirm exclusion');
        await this.ccdFormPage.contentContains('You\'ve excluded yourself from a case.');

    }

    async adminExcludeAnotherAdmin(clickContinue = false) {
        await this.ccdFormPage.headingContains('Exclusions');
        await this.ccdFormPage.click('Add');
        await this.ccdFormPage.headingContains('Choose who the exclusion is for');
        await this.ccdFormPage.click( 'Exclude another person');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click( 'Admin');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.setFieldValue(
            'some exclusions reason',
            'text area'
        );
        await this.ccdFormPage.click('Continue');
        await browser.sleep(200);
        await this.ccdFormPage.click('Confirm exclusion');
        await this.ccdFormPage.contentContains('You\'ve excluded yourself from a case.');
    }
};
