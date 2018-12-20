import { CcdWriteAddressField } from './ccd-write-address-field';
import { FieldFinder } from './field-finder';
import { by } from 'protractor';

export class CcdWriteAddressFieldFinder implements FieldFinder {

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
            && await fieldContainer.$$('ccd-write-address-field').isPresent()) {

            return new CcdWriteAddressField(
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
                    './/ccd-field-write[.//ccd-write-address-field]'
                ))
                .get(instanceNumber - 1);

        if (await fieldContainer.isPresent()) {

            return new CcdWriteAddressField(
                fieldContainer,
                ''
            );
        }
    }
}
