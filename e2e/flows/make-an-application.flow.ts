import { CcdFormPage } from '../pages/ccd-form.page';

export class MakeAnApplication {
  private ccdFormPage = new CcdFormPage();

  async completeMakeAnApplication(clickContinue = false, applicationType = '') {
    await this.chooseMakeAnApplicationType(true, applicationType);
    await this.completeMakeAnApplicationDetails(true, applicationType);
  }

  async chooseMakeAnApplicationType(clickContinue = false, applicationType) {
    await this.ccdFormPage.selectNextStep('Make an application');

    await this.ccdFormPage.setFieldValue('Type of application', applicationType);

    if (clickContinue) {
      await this.ccdFormPage.click('Continue');
    }
  }

  async completeMakeAnApplicationDetails(clickContinue = false, applicationType) {
    if (applicationType === 'Adjourn') {
      await this.ccdFormPage.setFieldValue('Explain why you need an adjournment and for how long you need it.', 'A reason for adjounment');
    }
    if (applicationType === 'Expedite') {
      await this.ccdFormPage.setFieldValue('Explain why you need to expedite the appeal. Include the latest date you ' + 'would like the appeal to be decided by and state if you are willing for the appeal to be decided without a hearing.', 'A reason for expedite');
    }
    if (applicationType === 'Link/unlink appeals') {
      await this.ccdFormPage.setFieldValue('Explain why you want to link or unlink this appeal. You must include the ' + 'appellant name and HMCTS appeal reference of each appeal you want to link to or unlink from.', 'A reason to link or unlink');
    }
    if (applicationType === "Judge's review of application decision") {
      await this.ccdFormPage.setFieldValue('Tell us which application decision you want to be reviewed by a Judge and explain why you think the original ' + 'decision was wrong.', 'A reason for Judge review');
    }
    if (applicationType === 'Reinstate an ended appeal') {
      await this.ccdFormPage.setFieldValue('Explain why you believe the Tribunal should reinstate this appeal.', 'A reason for reinstate');
    }
    if (applicationType === 'Time extension') {
      await this.ccdFormPage.setFieldValue('Tell us which task you need more time to complete, explain why you need more time and include how much more ' + 'time you will need.', 'A reason for time extension');
    }
    if (applicationType === 'Transfer') {
      await this.ccdFormPage.setFieldValue('Tell us which hearing centre you want to transfer the appeal to and why.', 'A reason for transfer');
    }
    if (applicationType === 'Update appeal details') {
      await this.ccdFormPage.setFieldValue('Tell us which appeal details you want to update and explain why the changes are necessary.', 'A reason to update appeal details');
    }
    if (applicationType === 'Update hearing requirements') {
      await this.ccdFormPage.setFieldValue('Tell us which hearing requirements you want to update and explain why the changes are necessary.', 'A reason to update hearing requirements');
    }
    if (applicationType === 'Withdraw') {
      await this.ccdFormPage.setFieldValue('Explain why you want to withdraw the appeal.', 'A reason to withdraw');
    }
    if (applicationType === 'Other') {
      await this.ccdFormPage.setFieldValue('Describe the application you are making and explain the reasons for the application.', 'A reason for other');
    }

    await this.ccdFormPage.click('Continue');

    await this.ccdFormPage.headingContains('Check your answers');
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('Submit');

    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }
}
