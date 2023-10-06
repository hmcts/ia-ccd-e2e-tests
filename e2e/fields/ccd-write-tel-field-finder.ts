import { CcdWriteTelField } from './ccd-write-tel-field';
import { FieldFinder } from './field-finder';
import { by } from 'protractor';

export class CcdWriteTelFieldFinder implements FieldFinder {

    public getFieldType() {
        return 'text';
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
            && await fieldContainer.$$('ccd-write-phone-uk-field').isPresent()) {

            return new CcdWriteTelField(
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
                .all(by.xpath('.//ccd-field-write[.//ccd-write-text-field]'))
                .get(instanceNumber - 1);

        if (await fieldContainer.isPresent()) {

            return new CcdWriteTelField(
                fieldContainer,
                ''
            );
        }
    }
}
