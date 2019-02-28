import { CcdWriteYesNoField } from './ccd-write-yes-no-field';
import { FieldFinder } from './field-finder';
import { by } from 'protractor';

export class CcdWriteYesNoFieldFinder implements FieldFinder {

    public getFieldType() {
        return 'yes or no';
    }

    public async findByLabel(
        container,
        instanceNumber: number,
        fieldLabel: string
    ) {
        const fieldContainer =
            container
                .all(by.xpath(
                    './/span[contains(@class, "form-label") and normalize-space()="' + fieldLabel + '"]' +
                    '/ancestor::ccd-field-write[position()=1]'
                ))
                .get(instanceNumber - 1);

        if (await fieldContainer.isPresent()
            && await fieldContainer.$$('ccd-write-yes-no-field').isPresent()) {

            return new CcdWriteYesNoField(
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
                    './/ccd-field-write[.//ccd-write-yes-no-field]'
                ))
                .get(instanceNumber - 1);

        if (await fieldContainer.isPresent()) {

            return new CcdWriteYesNoField(
                fieldContainer,
                ''
            );
        }
    }
}
