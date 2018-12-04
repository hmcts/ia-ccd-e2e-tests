import { FieldFinder } from './field-finder';
import { by } from 'protractor';
import { CcdWriteFixedRadioListField } from './ccd-write-fixed-radio-list-field';

export class CcdWriteFixedRadioListFieldFinder implements FieldFinder {

    public async findByLabel(container, fieldLabel) {
        const fieldContainer =
            container
                .all(by.xpath(
                    '//label[normalize-space()="' + fieldLabel + '"]' +
                    '/ancestor::ccd-field-write[position()=1]'
                ))
                .first();

        if (await fieldContainer.isPresent()
            && await fieldContainer.$$('ccd-write-fixed-radio-list-field').isPresent()) {

            return new CcdWriteFixedRadioListField(
                fieldContainer,
                fieldLabel
            );
        }
    }

    public async findFirstHavingEmptyLabel(container) {

        const fieldContainer =
            container
                .all(by.xpath(
                    './/ccd-field-write[.//ccd-write-fixed-radio-list-field]'))
                .first();

        if (await fieldContainer.isPresent()) {

            return new CcdWriteFixedRadioListField(
                fieldContainer,
                ''
            );
        }
    }
}
