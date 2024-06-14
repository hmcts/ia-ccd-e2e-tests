import { FieldFinder } from './field-finder';
import { by } from 'protractor';
import { CcdWriteMoneyGBPField } from './CcdWriteMoneyGBPField';

export class CcdWriteMoneyGBPFieldFinder implements FieldFinder {
  public getFieldType() {
    return 'moneyGBP';
  }

  public async findByLabel(container, instanceNumber: number, fieldLabel: string) {
    const fieldContainer = container.all(by.xpath('.//span[contains(@class, "form-label") and normalize-space()="' + fieldLabel + '"]' + '/ancestor::ccd-field-write[position()=1]')).get(instanceNumber - 1);

    if ((await fieldContainer.isPresent()) && (await fieldContainer.$$('ccd-write-money-gbp-field').isPresent())) {
      return new CcdWriteMoneyGBPField(fieldContainer, fieldLabel);
    }
  }

  public async findHavingEmptyLabel(container, instanceNumber: number) {
    const fieldContainer = container.all(by.xpath('.//ccd-field-write[.//ccd-write-money-gbp-field]')).get(instanceNumber - 1);

    if (await fieldContainer.isPresent()) {
      return new CcdWriteMoneyGBPField(fieldContainer, '');
    }
  }
}
