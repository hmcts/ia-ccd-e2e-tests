import { CcdWriteDocumentField } from './ccd-write-document-field';
import { FieldFinder } from './field-finder';
import { by } from 'protractor';

export class CcdWriteDocumentFieldFinder implements FieldFinder {
  public getFieldType() {
    return 'document';
  }

  public async findByLabel(container, instanceNumber: number, fieldLabel: string) {
    const forId = await container.all(by.cssContainingText('label', fieldLabel))
      .get(instanceNumber - 1)
      .getAttribute('for');
    const input = await container.all(by.css(`input[type=file]#${forId}`)).get(0);
    const fieldContainer = input.element(by.xpath('..'));
    if ((await fieldContainer.isPresent())) {
      return new CcdWriteDocumentField(fieldContainer, fieldLabel);
    }
  }

  public async findHavingEmptyLabel(container, instanceNumber: number) {
    const input = container.all(by.css("input[type=file]")).get(instanceNumber - 1);
    const fieldContainer = input.element(by.xpath('..'));
    if (await fieldContainer.isPresent()) {
      return new CcdWriteDocumentField(fieldContainer, '');
    }
  }
}
