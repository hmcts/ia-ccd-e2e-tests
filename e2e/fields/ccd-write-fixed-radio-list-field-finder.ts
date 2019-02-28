import { FieldFinder } from './field-finder';
import { by } from 'protractor';
import { CcdWriteFixedRadioListField } from './ccd-write-fixed-radio-list-field';

export class CcdWriteFixedRadioListFieldFinder implements FieldFinder {

    public getFieldType() {
        return 'radio list';
    }

    public async findByLabel(
        container,
        instanceNumber: number,
        fieldLabel: string
    ) {
        const fieldContainer =
            container
                .all(by.xpath(
                    '//label[normalize-space()="' + fieldLabel + '"]' +
                    '/ancestor::ccd-field-write[position()=1]'
                ))
                .get(instanceNumber - 1);

        if (await fieldContainer.isPresent()
            && await fieldContainer.$$('ccd-write-fixed-radio-list-field').isPresent()) {

            return new CcdWriteFixedRadioListField(
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
                    './/ccd-field-write[.//ccd-write-fixed-radio-list-field]'))
                .get(instanceNumber - 1);

        if (await fieldContainer.isPresent()) {

            return new CcdWriteFixedRadioListField(
                fieldContainer,
                ''
            );
        }
    }
}
