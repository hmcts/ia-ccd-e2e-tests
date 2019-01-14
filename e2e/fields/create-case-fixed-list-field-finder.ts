import { CcdWriteFixedListField } from './ccd-write-fixed-list-field';
import { FieldFinder } from './field-finder';
import { $$, by } from 'protractor';

export class CreateCaseFixedListFieldFinder implements FieldFinder {

    public async findByLabel(
        container,
        instanceNumber: number,
        fieldLabel: string
    ) {
        if (await $$('ccd-create-case-filters').isPresent()) {

            // special case for Create Case form, which has a different structure
            // to the CCD event forms

            const fieldContainer =
                container
                    .all(by.xpath(
                        './/label[normalize-space()="' + fieldLabel + '"]' +
                        '/ancestor::div[position()=1]'
                    ))
                    .get(instanceNumber - 1);

            if (await fieldContainer.isPresent()
                && await fieldContainer.$$('select').isPresent()) {

                return new CcdWriteFixedListField(
                    fieldContainer,
                    fieldLabel
                );
            }
        }
    }

    public async findHavingEmptyLabel(
        container,
        instanceNumber: number
    ) {
        throw 'Unsupported -- Create Case form has no fields without a label';
    }
}
