import { CcdPage } from './ccd.page';
import { $, browser, ExpectedConditions, By, protractor, element } from 'protractor';
// import { Wait } from '../enums/wait';

export class CcdFormPage extends CcdPage {
  async fieldErrorContains(match: string) {
    await browser.wait(ExpectedConditions.visibilityOf($('.error-message')));
    return (await $('.error-message').getText()).includes(match);
  }

  async summaryErrorContains(match: string) {
    await browser.wait(ExpectedConditions.visibilityOf($('.error-summary-list')));
    return (await $('.error-summary-list').getText()).includes(match);
  }

  async addCollectionItem(complexFieldLabel: string, instanceNumber?: string | number) {
    await this.fields.addCollectionItem(complexFieldLabel, instanceNumber);
  }

  async removeCollectionItem(complexFieldLabel: string, collectionItemNumber: string | number, instanceNumber?: string | number) {
    await this.fields.removeCollectionItem(complexFieldLabel, instanceNumber, collectionItemNumber);
  }

  async getFieldOptions(fieldLabel: string, instanceNumber?: string | number, complexFieldLabel?: string, collectionItemNumber?: string | number) {
    const field = await this.fields.find('', fieldLabel, instanceNumber, complexFieldLabel, collectionItemNumber);

    if (!!field && (await field.isDisplayed())) {
      return await field.getOptions();
    } else {
      throw 'Cannot find field with label: ' + fieldLabel;
    }
  }

  async setFieldValue(fieldLabel: string, fieldValue: string, fieldType?: string, instanceNumber?: string | number, complexFieldLabel?: string, collectionItemNumber?: string | number) {
    const field = await this.fields.find(fieldType, fieldLabel, instanceNumber, complexFieldLabel, collectionItemNumber);

    if (!!field && (await field.isDisplayed())) {
      const expandedFieldValue = await this.valueExpander.expand(fieldValue);
      await field.setValue(expandedFieldValue);
    } else {
      throw 'Cannot find field with label: ' + fieldLabel;
    }
    if (fieldType === 'document') {
      // await browser.sleep(Wait.short);
      await browser.sleep(15000);
    }
  }
  async typeText(ID: string, text: string) {
    await element(By.css(`#${ID}`)).sendKeys(text);
  }

  async typeEnter(ID: string) {
    browser.driver.findElement(By.xpath(`//*[@id='${ID}']`));
    browser.actions().sendKeys(protractor.Key.ENTER).perform();
  }
}
