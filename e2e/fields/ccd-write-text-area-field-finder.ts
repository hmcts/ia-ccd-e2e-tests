import { CcdWriteTextAreaField } from './ccd-write-text-area-field';
import { FieldFinder } from './field-finder';
import { by } from 'protractor';

export class CcdWriteTextAreaFieldFinder implements FieldFinder {

    public async findByLabel(container, fieldLabel) {

        const fieldContainer =
            container
                .all(by.xpath(
                    './/span[contains(@class, "form-label") and normalize-space()="' + fieldLabel + '"]' +
                    '/ancestor::ccd-field-write[position()=1]'
                ))
                .first();

        if (await fieldContainer.isPresent()
            && await fieldContainer.$$('ccd-write-text-area-field').isPresent()) {

            return new CcdWriteTextAreaField(
                fieldContainer,
                fieldLabel
            );
        }
    }

    public async findFirstHavingEmptyLabel(container) {

        const fieldContainer =
            container
                .all(by.xpath(
                    './/ccd-field-write[.//ccd-write-text-area-field]'
                ))
                .first();

        if (await fieldContainer.isPresent()
            && await fieldContainer.$$('ccd-write-text-area-field').isPresent()) {

            return new CcdWriteTextAreaField(
                fieldContainer,
                ''
            );
        }
    }
}
