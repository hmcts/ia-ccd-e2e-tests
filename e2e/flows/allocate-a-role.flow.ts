import { CcdFormPage } from '../pages/ccd-form.page';
import { WorkAllocationPage } from '../pages/work-allocation.page';
import { browser } from 'protractor';

export class AllocateARoleFlow {

    private ccdFormPage = new CcdFormPage();
    private workAllocationPage = new WorkAllocationPage();

    async allocateARoleLink(clickContinue = false, user, index) {
        await this.ccdFormPage.headingContains(user);
        await this.ccdFormPage.click('Allocate a role', index);
    }

    async reserveToMe(clickContinue = false, userRole: string) {
        await this.ccdFormPage.headingContains('Choose a role');
        await this.ccdFormPage.click(userRole);
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.headingContains('Choose how to allocate the role');
        await this.ccdFormPage.click( 'Reserve to me');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Confirm allocation');
    }

    async legalOpsToAnotherLegalOps(clickContinue = false) {
        await this.ccdFormPage.headingContains('Choose a role');
        await this.ccdFormPage.click( 'Case Manager');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.headingContains('Choose how to allocate the role');
        await this.ccdFormPage.click( 'Allocate to another person');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.headingContains('Find the person');
        await this.workAllocationPage.enterAllocateUserEmailInput('IAC');
        await browser.sleep(3000)
        await this.workAllocationPage.selectUser()
        await browser.sleep(5000)
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.headingContains('Duration of role');
        await this.ccdFormPage.click('7 days');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Confirm allocation');
    }

    async judicialToLegalOps(clickContinue = false) {
        await this.ccdFormPage.headingContains('Choose a role');
        await this.ccdFormPage.click('Case Manager');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.headingContains('Find the person');
        await this.workAllocationPage.enterAllocateUserEmailInput('IAC');
        await browser.sleep(3000)
        await this.workAllocationPage.selectUser()
        await browser.sleep(5000)
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.headingContains('Duration of role');
        await this.ccdFormPage.click('7 days');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Confirm allocation');
    }

    async legalOpsToJudicial(clickContinue = false) {
        await this.ccdFormPage.headingContains('Choose a role');
        await this.ccdFormPage.click('Lead Judge');
        await this.ccdFormPage.click('Continue');
        await this.workAllocationPage.enterAllocateUserEmailInput('Vim');
        await browser.sleep(2000);
        await this.workAllocationPage.selectUser()
        await browser.sleep(3000)
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Confirm allocation');
    }

    async Judiciary(clickContinue = false) {
        await this.ccdFormPage.headingContains('Judiciary');
        await this.ccdFormPage.click('Allocate a role');
        await this.ccdFormPage.headingContains('Choose a role');
        await this.ccdFormPage.click('Lead Judge');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.headingContains('Choose how to allocate the role');
        await this.ccdFormPage.doesDropdownHaveValues('Tom Cruz(330085EMP-@ejudiciary.net)');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Confirm allocation');
    }

    async judicialToAnotherJudicial(clickContinue = false) {
        await this.ccdFormPage.headingContains('Choose a role');
        await this.ccdFormPage.click('Hearing Judge');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.headingContains('Choose how to allocate the role');
        await this.ccdFormPage.click( 'Allocate to another person');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.headingContains('Find the person');
        await this.workAllocationPage.enterAllocateUserEmailInput('Vim');
        await browser.sleep(3000)
        await this.workAllocationPage.selectUser()
        await browser.sleep(5000)
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.headingContains('Duration of role');
        await this.ccdFormPage.click('7 days');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Confirm allocation');
    }
};
