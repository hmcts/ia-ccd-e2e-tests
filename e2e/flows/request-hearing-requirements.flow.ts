import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class RequestHearingRequirementsFlow {
  private ccdFormPage = new CcdFormPage();

  async requestHearingRequirements() {
    await this.ccdFormPage.selectNextStep('Request hearing requirements');
    let overviewUrl = await browser.getCurrentUrl();
    await this.ccdFormPage.flakeyClick('Go', overviewUrl);
    await this.ccdFormPage.waitForSpinner();

    await this.ccdFormPage.headingContains('Request hearing requirements');
    await this.ccdFormPage.click('Submit');
    await this.ccdFormPage.headingContains('Case details');
  }
}
