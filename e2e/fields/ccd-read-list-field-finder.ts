import { CcdReadField } from './ccd-read-field';
import { FieldFinder } from './field-finder';
import { by } from 'protractor';

export class CcdReadListFieldFinder implements FieldFinder {

    public async findByLabel(
        container,
        instanceNumber: number,
        fieldLabel: string
    ) {
        const fieldContainer =
            container
                .all(by.xpath(
                    './/dt[normalize-space()="' + fieldLabel + '"]' +
                    '/following-sibling::dd[1]'
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
                    './/dt[normalize-space()=""]' +
                    '/following-sibling::dd[1]'
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
