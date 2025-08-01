import { CaseListFixedListFieldFinder } from './case-list-fixed-list-field-finder';
import { CcdReadTableFieldFinder } from './ccd-read-table-field-finder';
import { CcdReadListFieldFinder } from './ccd-read-list-field-finder';
import { CcdWriteAddressFieldFinder } from './ccd-write-address-field-finder';
import { CcdWriteCollectionFinder } from './complex-field-finders/ccd-write-collection-finder';
import { CcdWriteCollectionItemFinder } from './collection-item-finders/ccd-write-collection-item-finder';
import { CcdWriteDateFieldFinder } from './ccd-write-date-field-finder';
import { CcdWriteFixedListFieldFinder } from './ccd-write-fixed-list-field-finder';
import { CcdWriteDynamicListFieldFinder } from './ccd-write-dynamic-list-field-finder';
import { CcdWriteLabelFieldFinder } from './ccd-write-label-field-finder';
import { CcdWriteTextAreaFieldFinder } from './ccd-write-text-area-field-finder';
import { CcdWriteTextFieldFinder } from './ccd-write-text-field-finder';
import { CcdWriteYesNoFieldFinder } from './ccd-write-yes-no-field-finder';
import { CcdWriteMoneyGBPFieldFinder } from './CcdWriteMoneyGBPFieldFinder';
import { CcdWriteEmailFieldFinder } from './ccd-write-email-field-finder';
import { TableCollectionFinder } from './complex-field-finders/table-collection-finder';
import { CollectionItemFinder } from './collection-item-finders/collection-item-finder';
import { ComplexFieldFinder } from './complex-field-finders/complex-field-finder';
import { Field } from './field';
import { FieldFinder } from './field-finder';
import { OrdinalToCardinal } from '../helpers/ordinal-to-cardinal';
import { TableCollectionItemFinder } from './collection-item-finders/table-collection-item-finder';
import { browser, by, ElementFinder, ExpectedConditions } from 'protractor';
import { CreateCaseFixedListFieldFinder } from './create-case-fixed-list-field-finder';
import { CcdWriteDocumentFieldFinder } from './ccd-write-document-field-finder';
import { CcdWriteFixedRadioListFieldFinder } from './ccd-write-fixed-radio-list-field-finder';
import { AnyPage } from '../pages/any.page';
import { CcdWriteTelFieldFinder } from './ccd-write-tel-field-finder';
import { CcdWriteMultiSelectListFieldFinder } from './ccd-write-multi-select-list-field-finder';
import { CcdCaseFlagTableFieldFinder } from './ccd-case-flag-table-field-finder';

export class Fields {
  private readonly collectionItemFinders: CollectionItemFinder[] = [new CcdWriteCollectionItemFinder(), new TableCollectionItemFinder()];

  private readonly complexFieldFinders: ComplexFieldFinder[] = [new CcdWriteCollectionFinder(), new TableCollectionFinder()];

  private readonly fieldFinders: FieldFinder[] = [
    // TL;DR *order is important*

    // the following fields are searched in order of
    // specificity which affects the selection

    new CcdWriteAddressFieldFinder(),
    new CcdWriteDateFieldFinder(),

    new CcdWriteFixedListFieldFinder(),
    new CcdWriteFixedRadioListFieldFinder(),
    new CcdWriteTextFieldFinder(),
    new CcdWriteMultiSelectListFieldFinder(),
    new CcdWriteTextAreaFieldFinder(),
    new CcdWriteYesNoFieldFinder(),

    new CcdWriteDocumentFieldFinder(),
    new CcdWriteLabelFieldFinder(),
    new CcdWriteMoneyGBPFieldFinder(),
    new CcdWriteEmailFieldFinder(),
    new CcdWriteDynamicListFieldFinder(),
    new CcdWriteTelFieldFinder(),
    // the following fields are not specific to one type
    // and so are searched last in order of specificity
    // which affects the selection for label-less fields

    new CcdReadTableFieldFinder(),
    new CcdReadListFieldFinder(),

    new CaseListFixedListFieldFinder(),
    new CreateCaseFixedListFieldFinder(),
    new CcdCaseFlagTableFieldFinder()
  ];

  private readonly container: ElementFinder;
  private readonly anyPage = new AnyPage();

  constructor(container: ElementFinder) {
    this.container = container;
  }

  public async addCollectionItem(complexFieldLabel: string, instanceNumber?: string | number) {
    const complexFieldContainer = await this.findComplexFieldContainer(complexFieldLabel, instanceNumber);

    const addNewBtn = complexFieldContainer.element(by.xpath('.//button[normalize-space()="Add new"]'));
    await browser.wait(ExpectedConditions.visibilityOf(addNewBtn));
    if (!!complexFieldContainer) {
      await browser.executeScript('arguments[0].scrollIntoView()', addNewBtn.getWebElement());

      await complexFieldContainer.all(by.xpath('.//button[normalize-space()="Add new"]')).last().click();
    }
  }

  public async find(fieldType: string, fieldLabel: string, instanceNumber?: string | number, complexFieldLabel?: string, collectionItemNumber?: string | number): Promise<Field> {
    let container = this.container;

    if (fieldLabel) {
      await this.anyPage.contentContains(fieldLabel);
    }

    if (complexFieldLabel) {
      await this.anyPage.contentContains(complexFieldLabel);
    }

    if (complexFieldLabel !== undefined) {
      const complexFieldContainer = await this.findComplexFieldContainer(complexFieldLabel, instanceNumber);

      if (!!complexFieldContainer) {
        if (collectionItemNumber !== undefined) {
          container = await this.findCollectionItemContainer(complexFieldContainer, collectionItemNumber);
        } else {
          container = complexFieldContainer;
        }
      }

      if (container === undefined) {
        throw 'Cannot find field: ' + fieldLabel + '@' + instanceNumber + ' (' + complexFieldLabel + '@' + collectionItemNumber + ')';
      }

      return await this.findWithinContainer(container, fieldType, fieldLabel);
    } else {
      if (container === undefined) {
        throw 'Cannot find field: ' + fieldLabel + '@' + instanceNumber + ')';
      }

      return await this.findWithinContainer(container, fieldType, fieldLabel, instanceNumber);
    }
  }

  public async removeCollectionItem(complexFieldLabel: string, collectionItemNumber: string | number, instanceNumber?: string | number) {
    const complexFieldContainer = await this.findComplexFieldContainer(complexFieldLabel, instanceNumber);

    if (!!complexFieldContainer) {
      const collectionItemContainer = await this.findCollectionItemContainer(complexFieldContainer, collectionItemNumber);

      await collectionItemContainer.all(by.xpath('.//button[normalize-space()="Remove"]')).first().click();

      await browser.wait(ExpectedConditions.visibilityOf(collectionItemContainer.element(by.xpath('//ccd-remove-dialog//button[normalize-space()="Remove"]'))));

      await collectionItemContainer.all(by.xpath('//ccd-remove-dialog//button[normalize-space()="Remove"]')).first().click();

      await browser.wait(ExpectedConditions.invisibilityOf(collectionItemContainer.element(by.xpath('//ccd-remove-dialog//button[normalize-space()="Remove"]'))));
    }
  }

  private async findComplexFieldContainer(complexFieldLabel: string, instanceNumber?: string | number): Promise<ElementFinder> {
    const cardinalInstanceNumber = typeof instanceNumber === 'number' ? instanceNumber : OrdinalToCardinal.convertWordToNumber(instanceNumber);

    if (complexFieldLabel) {
      await this.anyPage.contentContains(complexFieldLabel);
    }

    for (let i = 0; i < this.complexFieldFinders.length; i++) {
      const complexField = await this.complexFieldFinders[i].findComplexField(this.container, cardinalInstanceNumber, complexFieldLabel);

      if (!!complexField && (await complexField.isPresent())) {
        return complexField;
      }
    }
  }

  private async findCollectionItemContainer(complexFieldContainer, collectionItemNumber: string | number): Promise<ElementFinder> {
    const cardinalCollectionItemNumber = typeof collectionItemNumber === 'number' ? collectionItemNumber : OrdinalToCardinal.convertWordToNumber(collectionItemNumber);

    for (let i = 0; i < this.collectionItemFinders.length; i++) {
      const collectionItem = await this.collectionItemFinders[i].findCollectionItem(complexFieldContainer, cardinalCollectionItemNumber);

      if (!!collectionItem && (await collectionItem.isPresent())) {
        return collectionItem;
      }
    }
  }

  private async findWithinContainer(container: ElementFinder, fieldType: string, fieldLabel: string, instanceNumber?: string | number): Promise<Field> {
    const cardinalInstanceNumber = typeof instanceNumber === 'number' ? instanceNumber : OrdinalToCardinal.convertWordToNumber(instanceNumber);

    for (let i = 0; i < this.fieldFinders.length; i++) {
      if (fieldType === '' || !!fieldType) {
        if ((await this.fieldFinders[i].getFieldType()) !== fieldType) {
          continue;
        }
      }

      let field;

      if (!!fieldLabel) {
        field = await this.fieldFinders[i].findByLabel(container, cardinalInstanceNumber, fieldLabel);
      } else {
        field = await this.fieldFinders[i].findHavingEmptyLabel(container, cardinalInstanceNumber);
      }

      if (field) {
        return field;
      }
    }
  }
}
