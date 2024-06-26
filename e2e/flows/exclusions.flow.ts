import { CcdFormPage } from '../pages/ccd-form.page';
import { WorkAllocationPage } from '../pages/work-allocation.page';
import { browser } from 'protractor';

export class ExclusionsFlow {
  private ccdFormPage = new CcdFormPage();
  private workAllocationPage = new WorkAllocationPage();

  async clickAddLink(clickContinue = false) {
    await this.ccdFormPage.click('Add');
  }
  async excludeMe(clickContinue = false) {
    await this.ccdFormPage.headingContains('Choose who the exclusion is for');
    await this.ccdFormPage.click('Exclude me');
    await this.ccdFormPage.click('Continue');
    await this.workAllocationPage.addExclusionReason('some exclusions reason');
    await this.ccdFormPage.click('Continue');
    await browser.sleep(200);
    await this.ccdFormPage.click('Confirm exclusion');
    await this.ccdFormPage.contentContains("You've excluded yourself from a case.");
  }
  async legalOpsExcludeAnotherLegalOps(clickContinue = false, userRole, emailText) {
    await this.ccdFormPage.headingContains('Choose who the exclusion is for');
    await this.ccdFormPage.click('Exclude another person');
    await this.ccdFormPage.click('Continue');
    await this.ccdFormPage.click(userRole);
    await this.ccdFormPage.click('Continue');
    await this.ccdFormPage.headingContains('Find the person');
    await this.workAllocationPage.enterAllocateUserEmailInput(emailText);
    await browser.sleep(3000);
    await this.workAllocationPage.selectUser();
    await browser.sleep(5000);
    await this.ccdFormPage.click('Continue');
    await this.workAllocationPage.addExclusionReason('some exclusions reason');
    await this.ccdFormPage.click('Continue');
    await browser.sleep(200);
    await this.ccdFormPage.click('Confirm exclusion');
    await this.ccdFormPage.contentContains("You've added an exclusion.");
  }

  async JudicialExclusion(clickContinue = false) {
    await this.ccdFormPage.headingContains('Choose who the exclusion is for');
    await this.ccdFormPage.click('Exclude me');
    await this.ccdFormPage.click('Continue');
    await this.ccdFormPage.setFieldValue('some exclusions reason', 'text area');
    await this.ccdFormPage.click('Continue');
    await browser.sleep(200);
    await this.ccdFormPage.click('Confirm exclusion');
    await this.ccdFormPage.contentContains("You've excluded yourself from a case.");
  }
  async judicialExcludeAnotherJudicial(clickContinue = false) {
    await this.ccdFormPage.headingContains('Choose who the exclusion is for');
    await this.ccdFormPage.click('Exclude another person');
    await this.ccdFormPage.click('Continue');
    await this.ccdFormPage.click('Judicial');
    await this.ccdFormPage.click('Continue');
    await this.ccdFormPage.setFieldValue('some exclusions reason', 'text area');
    await this.ccdFormPage.click('Continue');
    await browser.sleep(200);
    await this.ccdFormPage.click('Confirm exclusion');
    await this.ccdFormPage.contentContains("You've added an exclusion.");
  }

  async adminExclusion(clickContinue = false) {
    await this.ccdFormPage.headingContains('Choose who the exclusion is for');
    await this.ccdFormPage.click('Exclude me');
    await this.ccdFormPage.click('Continue');
    await this.ccdFormPage.setFieldValue('some exclusions reason', 'text area');
    await this.ccdFormPage.click('Continue');
    await browser.sleep(200);
    await this.ccdFormPage.click('Confirm exclusion');
    await this.ccdFormPage.contentContains("You've excluded yourself from a case.");
  }

  async adminExcludeAnotherAdmin(clickContinue = false) {
    await this.ccdFormPage.headingContains('Choose who the exclusion is for');
    await this.ccdFormPage.click('Exclude another person');
    await this.ccdFormPage.click('Continue');
    await this.ccdFormPage.click('Admin');
    await this.ccdFormPage.click('Continue');
    await this.ccdFormPage.setFieldValue('some exclusions reason', 'text area');
    await this.ccdFormPage.click('Continue');
    await browser.sleep(200);
    await this.ccdFormPage.click('Confirm exclusion');
    await this.ccdFormPage.contentContains("You've added an exclusion.");
  }
}
