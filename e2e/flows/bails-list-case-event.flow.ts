import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class ListCaseThroughEvent {
  private ccdFormPage = new CcdFormPage();

  async completeCaseListingEvent(clickContinue = false) {
    await browser.sleep(5000);
    await this.ccdFormPage.runAccessbility();
    await this.ccdFormPage.setFieldValue('listingEvent', 'Initial listing');
    await this.ccdFormPage.setFieldValue('Location', 'Manchester');
    await this.ccdFormPage.setFieldValue('Length in minutes', '100');
    await this.ccdFormPage.setFieldValue('Date and time', '{$TODAY+14|DD-MM-YYYY} 10:30:00');
    await browser.sleep(1000);

    if (clickContinue) {
      await this.ccdFormPage.click('Continue');
    }
  }

  async listCase(clickContinue = false) {
    await browser.sleep(5000);
    await this.ccdFormPage.runAccessbility();
    await this.ccdFormPage.selectNextStep('Case listing');
    let overviewUrl = await browser.getCurrentUrl();
    await this.ccdFormPage.flakeyClick('Go', overviewUrl);
    await this.ccdFormPage.waitForSpinner();
    await this.completeCaseListingEvent(true);
    await this.ccdFormPage.click('List case');
    await browser.sleep(5000);
    if (clickContinue) {
      await this.ccdFormPage.click('Close and Return to case details');
    }
  }
}
