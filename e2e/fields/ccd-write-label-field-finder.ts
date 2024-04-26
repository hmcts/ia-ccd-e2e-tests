import { CcdWriteLabelField } from './ccd-write-label-field';
import { FieldFinder } from './field-finder';
import { $$, by } from 'protractor';

export class CcdWriteLabelFieldFinder implements FieldFinder {
  public getFieldType() {
    return 'label';
  }

  public async findByLabel(container, instanceNumber: number, fieldLabel: string) {
    if (!(await $$('ccd-case-edit-page').isPresent())) {
      return;
    }

    const fieldContainer = container.all(by.xpath('.//dt[normalize-space()="' + fieldLabel + '"]' + '/ancestor::ccd-field-read-label[position()=1]')).get(instanceNumber - 1);

    if (await fieldContainer.isPresent()) {
      return new CcdWriteLabelField(fieldContainer, fieldLabel);
    }
  }

  public async findHavingEmptyLabel(container, instanceNumber: number) {
    if (!(await $$('ccd-case-edit-page').isPresent())) {
      return;
    }

    const fieldContainer = container.all(by.xpath('.//ccd-field-read-label')).get(instanceNumber - 1);

    if (await fieldContainer.isPresent()) {
      return new CcdWriteLabelField(fieldContainer, '');
    }
  }
}
