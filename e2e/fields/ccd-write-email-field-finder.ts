import { FieldFinder } from './field-finder';
import { by } from 'protractor';
import { CcdWriteEmailField } from './ccd-write-email-field';

export class CcdWriteEmailFieldFinder implements FieldFinder {

    public getFieldType() {
        return 'email';
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
            && await fieldContainer.$$('ccd-write-email-field').isPresent()) {

            return new CcdWriteEmailField(
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
                .all(by.xpath('.//ccd-field-write[.//ccd-write-email-field]'))
                .get(instanceNumber - 1);

        if (await fieldContainer.isPresent()) {

            return new CcdWriteEmailField(
                fieldContainer,
                ''
            );
        }
    }
}
