import { CcdFormPage } from '../pages/ccd-form.page';
import { browser, by, element } from 'protractor';

export class ListCaseThroughEvent {
  private ccdFormPage = new CcdFormPage();

  async completeCaseListingEvent(clickContinue = false) {
    await browser.sleep(5000);
    await this.ccdFormPage.runAccessbility();
    await this.ccdFormPage.setFieldValue('Listing event', 'Initial listing');
    await this.ccdFormPage.setFieldValue('Listing location', 'Hatton Cross Tribunal Hearing Centre');
    await this.ccdFormPage.setFieldValue(
        "Will the hearing be held remotely?",
        "No"
    );
    await element(by.css('#listingHearingDuration')).sendKeys('100');
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

  async fillOutParticipantAttendancePage(clickContinue = false) {
    await element(by.css('#INTER')).click();
    await this.ccdFormPage.setFieldValue('Harri Pugh', 'In Person');
    await this.ccdFormPage.setFieldValue('Legal Representative The Second', 'In Person');
    await this.ccdFormPage.setFieldValue('How many people will attend the hearing in person?', '10');
    if (clickContinue) {
      await this.ccdFormPage.click('Continue');
    }
  }

  async fillOutHearingVenueDetailsPage(clickContinue = false) {
    await element(by.css('#inputLocationSearch input')).sendKeys('Yarls Wood Immigration And Asylum Hearing Centre');
    await this.ccdFormPage.click('Add location');
    await browser.sleep(2000);

    if (clickContinue) {
      await this.ccdFormPage.click('Continue');
    }
  }
}
