import { CcdWriteLabelField } from './ccd-write-label-field';
import { FieldFinder } from './field-finder';
import { $$, by } from 'protractor';

export class CcdWriteLabelFieldFinder implements FieldFinder {

    public async findByLabel(container, fieldLabel) {

        if (!(await $$('ccd-case-edit-page').isPresent())) {
            return;
        }

        const fieldContainer =
            container
                .all(by.xpath(
                    './/dt[normalize-space()="' + fieldLabel + '"]' +
                    '/ancestor::ccd-field-read-label[position()=1]'
                ))
                .first();

        if (await fieldContainer.isPresent()) {

            return new CcdWriteLabelField(
                fieldContainer,
                fieldLabel
            );
        }
    }

    public async findFirstHavingEmptyLabel(container) {

        if (!(await $$('ccd-case-edit-page').isPresent())) {
            return;
        }

        const fieldContainer =
            container
                .all(by.xpath(
                    './/ccd-field-read-label'
                ))
                .first();

        if (await fieldContainer.isPresent()) {

            return new CcdWriteLabelField(
                fieldContainer,
                ''
            );
        }
    }
}
