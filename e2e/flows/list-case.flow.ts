import { CcdFormPage } from "../pages/ccd-form.page";
import { browser } from "protractor";
import { by, element } from "protractor";

export class ListCaseFlow {
  private ccdFormPage = new CcdFormPage();

  async listTheCase(clickContinue = false) {
    await this.ccdFormPage.selectNextStep("List the case");
    let overviewUrl = await browser.getCurrentUrl();
    await this.ccdFormPage.flakeyClick("Go", overviewUrl);
    await this.ccdFormPage.waitForSpinner();

    await this.ccdFormPage.setFieldValue("Listing reference", "LP/12345/2019");
    await this.ccdFormPage.setFieldValue("Location", "Taylor House");

    await this.ccdFormPage.setFieldValue("Length", "6 hours");

    await this.ccdFormPage.setFieldValue(
      "Date and time",
      "{$TODAY+14|DD-MM-YYYY} 10:30:00"
    );

    await this.ccdFormPage.click("Continue");
    await this.ccdFormPage.click("List case");

    if (clickContinue) {
      await this.ccdFormPage.click("Close and Return to case details");
    }
  }

  async listTheCaseAsRemoteHearing(clickContinue = false) {
    await this.ccdFormPage.selectNextStep("List the case");
    let overviewUrl = await browser.getCurrentUrl();
    await this.ccdFormPage.flakeyClick("Go", overviewUrl);
    await this.ccdFormPage.waitForSpinner();

    await this.ccdFormPage.setFieldValue("Listing reference", "LP/12345/2019");
    await this.ccdFormPage.setFieldValue("Location", "Remote hearing");

    await this.ccdFormPage.setFieldValue("Length", "6 hours");

    await this.ccdFormPage.setFieldValue(
      "Date and time",
      "{$TODAY+14|DD-MM-YYYY} 10:30:00"
    );

    await this.ccdFormPage.click("Continue");
    await this.ccdFormPage.click("List case");

    if (clickContinue) {
      await this.ccdFormPage.click("Close and Return to case details");
    }
  }

  async reListTheCase(clickContinue = false, lengthOfHearingInHours = "6") {
    await this.ccdFormPage.selectNextStep("Edit case listing");
    let overviewUrl = await browser.getCurrentUrl();
    await this.ccdFormPage.flakeyClick("Go", overviewUrl);
    await this.ccdFormPage.waitForSpinner();

    await this.ccdFormPage.headingContains("Edit case listing");
    await this.ccdFormPage.setFieldValue("Location", "Taylor House");

    await this.ccdFormPage.setFieldValue(
      "Length",
      lengthOfHearingInHours.concat(" hours")
    );

    await this.ccdFormPage.setFieldValue(
      "Date and time",
      "{$TODAY+14|DD-MM-YYYY} 10:30:00"
    );

    await this.ccdFormPage.click("Continue");
    await this.ccdFormPage.click("List case");

    if (clickContinue) {
      await this.ccdFormPage.click("Close and Return to case details");
      await this.ccdFormPage.contentContains("You have listed the case");
    }
  }

  async reListTheCaseAsRemoteHearing(
    clickContinue = false,
    lengthOfHearingInHours = "3"
  ) {
    await this.ccdFormPage.selectNextStep("Edit case listing");
    let overviewUrl = await browser.getCurrentUrl();
    await this.ccdFormPage.flakeyClick("Go", overviewUrl);
    await this.ccdFormPage.waitForSpinner();

    await this.ccdFormPage.headingContains("Edit case listing");
    await this.ccdFormPage.setFieldValue("Location", "Remote hearing");

    await this.ccdFormPage.setFieldValue(
      "Length",
      lengthOfHearingInHours.concat(" hours")
    );

    await this.ccdFormPage.setFieldValue(
      "Date and time",
      "{$TODAY+16|DD-MM-YYYY} 11:45:00"
    );

    await this.ccdFormPage.click("Continue");
    await this.ccdFormPage.click("List case");

    if (clickContinue) {
      await this.ccdFormPage.click("Close and Return to case details");
      await this.ccdFormPage.contentContains("You have listed the case");
    }
  }

  async reListTheCaseAsRemoteHearingWithNoChanges(
    clickContinue = false,
    lengthOfHearingInHours = "6"
  ) {
    await this.ccdFormPage.selectNextStep("Edit case listing");
    let overviewUrl = await browser.getCurrentUrl();
    await this.ccdFormPage.flakeyClick("Go", overviewUrl);
    await this.ccdFormPage.waitForSpinner();

    await this.ccdFormPage.headingContains("Edit case listing");
    await this.ccdFormPage.setFieldValue("Location", "Remote hearing");

    await this.ccdFormPage.setFieldValue(
      "Length",
      lengthOfHearingInHours.concat(" hours")
    );

    await this.ccdFormPage.setFieldValue(
      "Date and time",
      "{$TODAY+14|DD-MM-YYYY} 10:30:00"
    );

    await this.ccdFormPage.click("Continue");
    await this.ccdFormPage.click("List case");

    if (clickContinue) {
      await this.ccdFormPage.click('Close and Return to case details');
      await this.ccdFormPage.contentContains('You have listed the case');
    }
  }

  async listTheBailCase(clickContinue = false) {
    await this.ccdFormPage.selectNextStep('Case listing');
    await this.ccdFormPage.click('Go');

    await this.ccdFormPage.setFieldValue('Listing event', 'Initial listing');
    await this.ccdFormPage.setFieldValue('Location', 'Hatton Cross');

    await this.ccdFormPage.setFieldValue('Length', '1 hour');
    await this.ccdFormPage.setFieldValue('Date and time', '{$TODAY+14|DD-MM-YYYY} 10:30:00');

    await this.ccdFormPage.click('Continue');
    await this.ccdFormPage.click('List case');

    if (clickContinue) {
      await this.ccdFormPage.click('Close and Return to case details');
    }
  }

  // reListTheBailCase
  async reListTheBailCase(clickContinue = false) {
    await this.ccdFormPage.selectNextStep('Case listing');
    await this.ccdFormPage.click('Go');

    await this.ccdFormPage.setFieldValue('Listing event', 'Relisting');
    await this.ccdFormPage.setFieldValue('Location', 'Hatton Cross');

    await this.ccdFormPage.setFieldValue('Length', '30 minutes');

    await this.ccdFormPage.setFieldValue('Date and time', '{$TODAY+14|DD-MM-YYYY} 11:30:00');

    await this.ccdFormPage.click('Continue');
    await this.ccdFormPage.click('List case');

    if (clickContinue) {
      await this.ccdFormPage.click('Close and Return to case details');
    }
  }
}
