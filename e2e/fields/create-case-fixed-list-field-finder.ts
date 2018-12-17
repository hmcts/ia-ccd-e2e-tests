import { CcdWriteFixedListField } from './ccd-write-fixed-list-field';
import { FieldFinder } from './field-finder';
import { $$, by } from 'protractor';

export class CreateCaseFixedListFieldFinder implements FieldFinder {

    public async findByLabel(container, fieldLabel) {

        if (await $$('ccd-create-case-filters').isPresent()) {

            // special case for Create Case form, which has a different structure
            // to the CCD event forms

            const fieldContainer =
                container
                    .all(by.xpath(
                        './/label[normalize-space()="' + fieldLabel + '"]' +
                        '/ancestor::div[position()=1]'
                    ))
                    .first();

            if (await fieldContainer.isPresent()
                && await fieldContainer.$$('select').isPresent()) {

                return new CcdWriteFixedListField(
                    fieldContainer,
                    fieldLabel
                );
            }
        }
    }

    public async findFirstHavingEmptyLabel(container) {
        throw 'Unsupported -- Create Case form has no fields without a label';
    }
}
