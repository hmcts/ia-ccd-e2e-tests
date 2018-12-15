import { CcdWriteFixedListField } from './ccd-write-fixed-list-field';
import { FieldFinder } from './field-finder';
import { by } from 'protractor';

export class CcdWriteFixedListFieldFinder implements FieldFinder {

    public async findByLabel(container, fieldLabel) {

        const fieldContainer =
            container
                .all(by.xpath(
                    './/span[contains(@class, "form-label") and normalize-space()="' + fieldLabel + '"]' +
                    '/ancestor::ccd-field-write[position()=1]'
                ))
                .first();

        if (await fieldContainer.isPresent()
            && await fieldContainer.$$('ccd-write-fixed-list-field').isPresent()) {

            return new CcdWriteFixedListField(
                fieldContainer,
                fieldLabel
            );
        }
    }

    public async findFirstHavingEmptyLabel(container) {

        const fieldContainer =
            container
                .all(by.xpath(
                    './/ccd-field-write[.//ccd-write-fixed-list-field]'
                ))
                .first();

        if (await fieldContainer.isPresent()) {

            return new CcdWriteFixedListField(
                fieldContainer,
                ''
            );
        }
    }
}
