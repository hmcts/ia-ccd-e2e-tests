import { CcdReadField } from './ccd-read-field';
import { FieldFinder } from './field-finder';
import { by } from 'protractor';

export class CcdReadListFieldFinder implements FieldFinder {

    public async findByLabel(container, fieldLabel) {

        const fieldContainer =
            container
                .all(by.xpath(
                    './/dt[normalize-space()="' + fieldLabel + '"]' +
                    '/following-sibling::dd[1]'
                ))
                .first();

        if (await fieldContainer.isPresent()) {

            return new CcdReadField(
                fieldContainer,
                fieldLabel
            );
        }
    }

    public async findFirstHavingEmptyLabel(container) {

        const fieldContainer =
            container
                .all(by.xpath(
                    './/dt[normalize-space()=""]' +
                    '/following-sibling::dd[1]'
                ))
                .first();

        if (await fieldContainer.isPresent()) {

            return new CcdReadField(
                fieldContainer,
                ''
            );
        }
    }
}
