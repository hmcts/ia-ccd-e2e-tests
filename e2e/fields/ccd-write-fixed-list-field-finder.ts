import { CcdWriteFixedListField } from './ccd-write-fixed-list-field';
import { FieldFinder } from './field-finder';
import { by } from 'protractor';

export class CcdWriteFixedListFieldFinder implements FieldFinder {
  public getFieldType() {
    return 'select list';
  }

  public async findByLabel(container, instanceNumber: number, fieldLabel: string) {
    const fieldContainer = container.all(by.xpath('.//span[contains(@class, "form-label") and normalize-space()="' + fieldLabel + '"]' + '/ancestor::ccd-field-write[position()=1]')).get(instanceNumber - 1);

    if ((await fieldContainer.isPresent()) && (await fieldContainer.$$('ccd-write-fixed-list-field').isPresent())) {
      return new CcdWriteFixedListField(fieldContainer, fieldLabel);
    }
  }

  public async findHavingEmptyLabel(container, instanceNumber: number) {
    const fieldContainer = container.all(by.xpath('.//ccd-field-write[.//ccd-write-fixed-list-field]')).get(instanceNumber - 1);

    if (await fieldContainer.isPresent()) {
      return new CcdWriteFixedListField(fieldContainer, '');
    }
  }
}
