import { CcdWriteTextField } from './ccd-write-text-field';
import { FieldFinder } from './field-finder';
import { by } from 'protractor';

export class CcdWriteTextFieldFinder implements FieldFinder {
  public getFieldType() {
    return 'text';
  }

  public async findByLabel(container, instanceNumber: number, fieldLabel: string) {
    const fieldContainer = container.all(by.xpath('.//span[contains(@class, "form-label") and normalize-space()="' + fieldLabel + '"]' + '/ancestor::ccd-field-write[position()=1]')).get(instanceNumber - 1);

    if ((await fieldContainer.isPresent()) && (await fieldContainer.$$('ccd-write-text-field').isPresent())) {
      return new CcdWriteTextField(fieldContainer, fieldLabel);
    }
  }

  public async findHavingEmptyLabel(container, instanceNumber: number) {
    const fieldContainer = container.all(by.xpath('.//ccd-field-write[.//ccd-write-text-field]')).get(instanceNumber - 1);

    if (await fieldContainer.isPresent()) {
      return new CcdWriteTextField(fieldContainer, '');
    }
  }
}
