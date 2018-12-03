import { CcdWriteDateField } from './ccd-write-date-field';
import { FieldFinder } from './field-finder';
import { by } from 'protractor';

export class CcdWriteDateFieldFinder implements FieldFinder {

    public async findByLabel(container, fieldLabel) {

        const fieldContainer =
            container
                .all(by.xpath(
                    './/span[contains(@class, "form-label") and normalize-space()="' + fieldLabel + '"]' +
                    '/ancestor::ccd-field-write[position()=1]'
                ))
                .first();

        if (await fieldContainer.isPresent()
            && await fieldContainer.$$('cut-date-input').isPresent()) {

            return new CcdWriteDateField(
                fieldContainer,
                fieldLabel
            );
        }
    }

    public async findFirstHavingEmptyLabel(container) {

        const fieldContainer =
            container
                .all(by.xpath(
                    './/ccd-field-write[.//cut-date-input]'
                ))
                .first();

        if (await fieldContainer.isPresent()
            && await fieldContainer.$$('cut-date-input').isPresent()) {

            return new CcdWriteDateField(
                fieldContainer,
                ''
            );
        }
    }
}
