import { CcdFormPage } from '../pages/ccd-form.page';
import { by, element } from 'protractor';

export class ListCaseThroughEvent {
  private ccdFormPage = new CcdFormPage();

  async completeCaseListingEvent(clickContinue = false) {
    await this.ccdFormPage.runAccessbility();
    await this.ccdFormPage.setFieldValue('Listing event', 'Initial listing');
    await this.ccdFormPage.setFieldValue('Listing location', 'Hatton Cross Tribunal Hearing Centre');
    await this.ccdFormPage.setFieldValue(
        "Will the hearing be held remotely?",
        "No"
    );
    await element(by.css('#listingHearingDuration')).sendKeys('100');
    await this.ccdFormPage.setFieldValue('Date and time', '{$TODAY+14|DD-MM-YYYY} 10:30:00');

    if (clickContinue) {
      await this.ccdFormPage.click('Continue');
    }
  }

  async listCase(clickContinue = false) {
    await this.ccdFormPage.runAccessbility();
    await this.ccdFormPage.selectNextStep('Case listing');
    await this.completeCaseListingEvent(true);
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('List case');
    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
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

    if (clickContinue) {
      await this.ccdFormPage.click('Continue');
    }
  }
}
