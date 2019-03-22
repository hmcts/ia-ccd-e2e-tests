import { CcdWriteFixedListField } from './ccd-write-fixed-list-field';
import { FieldFinder } from './field-finder';
import { by } from 'protractor';

export class CaseListFixedListFieldFinder implements FieldFinder {

    public getFieldType() {
        return 'select list';
    }

    public async findByLabel(
        container,
        instanceNumber: number,
        fieldLabel: string
    ) {
        const fieldContainer =
            container
                .all(by.xpath(
                    './/label[contains(@class, "form-label") and normalize-space()="' + fieldLabel + '"]' +
                    '/ancestor::div[contains(@class, "form-group") and position()=1]'
                ))
                .get(instanceNumber - 1);

        if (await fieldContainer.isPresent()
            && await fieldContainer.$$('select').isPresent()) {

            return new CcdWriteFixedListField(
                fieldContainer,
                fieldLabel
            );
        }
    }

    public async findHavingEmptyLabel(
        container,
        instanceNumber: number
    ) {
        // not used
    }
}
