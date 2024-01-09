import { CcdWriteMultiSelectListField } from './ccd-write-multi-select-list-field';
import { FieldFinder } from './field-finder';
import { by } from 'protractor';

export class CcdWriteMultiSelectListFieldFinder implements FieldFinder {

    public getFieldType() {
        return 'multipl choice';
    }

    public async findByLabel(
        container,
        instanceNumber: number,
        fieldLabel: string
    ) {
        const fieldContainer =
            container
                .all(by.xpath(
                    './/span[contains(@class, "form-label") and normalize-space()="' + fieldLabel + '"]' + '/ancestor::ccd-field-write[position()=1]'
                ))
                .get(instanceNumber - 1);

        if (await fieldContainer.isPresent()
            && await fieldContainer.$$('ccd-write-multi-select-list-field').isPresent()) {
            return new CcdWriteMultiSelectListField(
                fieldContainer,
                fieldLabel
            );
        }
    }

    public async findHavingEmptyLabel(
        container,
        instanceNumber: number
    ) {
        const fieldContainer =
            container
                .all(by.xpath(
                    './/ccd-field-write[.//ccd-write-multi-select-list-field]'
                ))
                .get(instanceNumber - 1);

        if (await fieldContainer.isPresent()) {

            return new CcdWriteMultiSelectListField(
                fieldContainer,
                ''
            );
        }
    }
}