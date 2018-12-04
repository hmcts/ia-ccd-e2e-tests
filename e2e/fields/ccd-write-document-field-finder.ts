import { CcdWriteDocumentField } from './ccd-write-document-field';
import { FieldFinder } from './field-finder';
import { by } from 'protractor';

export class CcdWriteDocumentFieldFinder implements FieldFinder {

    public async findByLabel(container, fieldLabel) {

        const fieldContainer =
            container
                .all(by.xpath(
                    './/span[contains(@class, "form-label") and normalize-space()="' + fieldLabel + '"]' +
                    '/ancestor::ccd-field-write[position()=1]'
                ))
                .first();

        if (await fieldContainer.isPresent()
            && await fieldContainer.$$('ccd-write-document-field').isPresent()) {

            return new CcdWriteDocumentField(
                fieldContainer,
                fieldLabel
            );
        }
    }

    public async findFirstHavingEmptyLabel(container) {

        const fieldContainer =
            container
                .all(by.xpath('.//ccd-field-write[.//ccd-write-document-field]'))
                .first();

        if (await fieldContainer.isPresent()
            && await fieldContainer.$$('ccd-write-document-field').isPresent()) {

            return new CcdWriteDocumentField(
                fieldContainer,
                ''
            );
        }
    }
}
