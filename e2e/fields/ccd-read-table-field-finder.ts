import { CcdReadField } from './ccd-read-field';
import { FieldFinder } from './field-finder';
import { by } from 'protractor';

export class CcdReadTableFieldFinder implements FieldFinder {

    public async findByLabel(container, fieldLabel) {

        const fieldContainer =
            container
                .all(by.xpath(
                    './/tr/th[normalize-space()="' + fieldLabel + '"]' +
                    '/ancestor::tr[position()=1]'
                ))
                .filter(e => e.isDisplayed())
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
                    './/tr/th[normalize-space()=""]' +
                    '/ancestor::tr[position()=1]'
                ))
                .filter(e => e.isDisplayed())
                .first();

        if (await fieldContainer.isPresent()) {

            return new CcdReadField(
                fieldContainer,
                ''
            );
        }
    }
}
