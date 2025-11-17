import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';
import { by, element } from 'protractor';

export class ListCaseFlow {
  private ccdFormPage = new CcdFormPage();

  async listTheCase(clickContinue = false) {
    await this.ccdFormPage.selectNextStep('List the case');

    await this.ccdFormPage.setFieldValue('Listing reference', 'LP/12345/2024');
    await this.ccdFormPage.setFieldValue('Listing location', 'Atlantic Quay - Glasgow');
    await this.ccdFormPage.setFieldValue('Will the hearing be held remotely?', 'Yes');
    // await this.ccdFormPage.typeText('listingLength_hours', '2');
    await this.ccdFormPage.typeText('listingLength_minutes', '0');

    await this.ccdFormPage.setFieldValue('Date and time', '{$TODAY+14|DD-MM-YYYY} 10:30:00');

    await this.ccdFormPage.click('Continue');
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('List case');

    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }

  async listTheCaseAsRemoteHearing(clickContinue = false) {
    await this.ccdFormPage.selectNextStep('List the case');

    await this.ccdFormPage.setFieldValue('Listing reference', 'LP/12345/2019');
    await this.ccdFormPage.setFieldValue('Location', 'Remote hearing');

    await this.ccdFormPage.setFieldValue('Length', '6 hours');

    await this.ccdFormPage.setFieldValue('Date and time', '{$TODAY+14|DD-MM-YYYY} 10:30:00');

    await this.ccdFormPage.click('Continue');
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('List case');

    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }

  async reListTheCase(clickContinue = false, lengthOfHearingInHours = '6') {
    await this.ccdFormPage.selectNextStep('Edit case listing');

    await this.ccdFormPage.headingContains('Edit case listing');
    await this.ccdFormPage.setFieldValue('Location', 'Taylor House');

    await this.ccdFormPage.setFieldValue('Length', lengthOfHearingInHours.concat(' hours'));

    await this.ccdFormPage.setFieldValue('Date and time', '{$TODAY+14|DD-MM-YYYY} 10:30:00');

    await this.ccdFormPage.click('Continue');
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('List case');

    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }

  async reListTheCaseAsRemoteHearing(clickContinue = false, lengthOfHearingInHours = '3') {
    await this.ccdFormPage.selectNextStep('Edit case listing');

    await this.ccdFormPage.headingContains('Edit case listing');
    await this.ccdFormPage.setFieldValue('Location', 'Remote hearing');

    await this.ccdFormPage.setFieldValue('Length', lengthOfHearingInHours.concat(' hours'));

    await this.ccdFormPage.setFieldValue('Date and time', '{$TODAY+16|DD-MM-YYYY} 11:45:00');

    await this.ccdFormPage.click('Continue');
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('List case');

    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }

  async reListTheCaseAsRemoteHearingWithNoChanges(clickContinue = false, lengthOfHearingInHours = '6') {
    await this.ccdFormPage.selectNextStep('Edit case listing');

    await this.ccdFormPage.headingContains('Edit case listing');
    await this.ccdFormPage.setFieldValue('Location', 'Remote hearing');

    await this.ccdFormPage.setFieldValue('Length', lengthOfHearingInHours.concat(' hours'));

    await this.ccdFormPage.setFieldValue('Date and time', '{$TODAY+14|DD-MM-YYYY} 10:30:00');

    await this.ccdFormPage.click('Continue');
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('List case');

        if (clickContinue) {
            await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
        }
    }

    async listTheBailCase(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Case listing');
        await this.ccdFormPage.setFieldValue('Listing event', 'Initial listing');
        await this.ccdFormPage.setFieldValue('Listing location', 'Hatton Cross Tribunal Hearing Centre');
        await this.ccdFormPage.setFieldValue('Will the hearing be held remotely?', 'Yes');
        await this.ccdFormPage.typeText('listingHearingDuration', '60');
        await this.ccdFormPage.setFieldValue(
            'Date and time',
            '{$TODAY+14|DD-MM-YYYY} 10:30:00'
        );
        await this.ccdFormPage.click('Continue');
      const currentUrl = await this.ccdFormPage.getCurrentUrl();
        await this.ccdFormPage.click('List case');
        if (clickContinue) {
            await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
        }
    }

    async reListTheBailCase(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Case listing');
        await this.ccdFormPage.setFieldValue('Listing event', 'Relisting');
        await this.ccdFormPage.setFieldValue('Listing location', 'Hatton Cross Tribunal Hearing Centre');
        await this.ccdFormPage.setFieldValue('Will the hearing be held remotely?', 'Yes');
        await browser.sleep(3000);
      let listingHearingDuaration = element(by.xpath("//*[@id='listingHearingDuration']"));
       await listingHearingDuaration.clear();
       await this.ccdFormPage.typeText('listingHearingDuration', '30');
        await this.ccdFormPage.setFieldValue(
            'Date and time',
            '{$TODAY+14|DD-MM-YYYY} 11:30:00'
        );
        await this.ccdFormPage.click('Continue');
      const currentUrl = await this.ccdFormPage.getCurrentUrl();
        await this.ccdFormPage.click('List case');

        if (clickContinue) {
            await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
        }
    }
}