import { CcdReadField } from './ccd-read-field';
import { FieldFinder } from './field-finder';
import { by } from 'protractor';

export class CcdCaseFlagTableFieldFinder implements FieldFinder {

    public getFieldType() {
        return '';
    }

    public async findByLabel(
        container,
        instanceNumber: number,
        fieldLabel: string
    ) {
        const fieldContainer =
            container
                .all(by.xpath(
                    './/caption[normalize-space()="' + fieldLabel + '"]' +
                    '/ancestor::ccd-case-flag-table[position()=1]'
                ))
                .filter(e => e.isDisplayed())
                .get(instanceNumber - 1);

        if (await fieldContainer.isPresent()) {

            return new CcdReadField(
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
                    './/caption[normalize-space()=""]' +
                    '/ancestor::ccd-case-flag-table[position()=1]'
                ))
                .filter(e => e.isDisplayed())
                .get(instanceNumber - 1);

        if (await fieldContainer.isPresent()) {

            return new CcdReadField(
                fieldContainer,
                ''
            );
        }
    }
}