import { CcdWriteYesNoField } from './ccd-write-yes-no-field';
import { FieldFinder } from './field-finder';
import { by } from 'protractor';

export class CcdWriteYesNoFieldFinder implements FieldFinder {

    public async findByLabel(container, fieldLabel) {

        const fieldContainer =
            container
                .all(by.xpath(
                    './/span[contains(@class, "form-label") and normalize-space()="' + fieldLabel + '"]' +
                    '/ancestor::ccd-field-write[position()=1]'
                ))
                .first();

        if (await fieldContainer.isPresent()
            && await fieldContainer.$$('ccd-write-yes-no-field').isPresent()) {

            return new CcdWriteYesNoField(
                fieldContainer,
                fieldLabel
            );
        }
    }

    public async findFirstHavingEmptyLabel(container) {

        const fieldContainer =
            container
                .all(by.xpath(
                    './/ccd-field-write[.//ccd-write-yes-no-field]'
                ))
                .first();

        if (await fieldContainer.isPresent()
            && await fieldContainer.$$('ccd-write-yes-no-field').isPresent()) {

            return new CcdWriteYesNoField(
                fieldContainer,
                ''
            );
        }
    }
}
