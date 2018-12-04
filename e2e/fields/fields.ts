import { CcdReadTableFieldFinder } from './ccd-read-table-field-finder';
import { CcdReadListFieldFinder } from './ccd-read-list-field-finder';
import { CcdWriteAddressFieldFinder } from './ccd-write-address-field-finder';
import { CcdWriteCollectionFinder } from './complex-field-finders/ccd-write-collection-finder';
import { CcdWriteCollectionItemFinder } from './collection-item-finders/ccd-write-collection-item-finder';
import { CcdWriteDateFieldFinder } from './ccd-write-date-field-finder';
import { CcdWriteFixedListFieldFinder } from './ccd-write-fixed-list-field-finder';
import { CcdWriteLabelFieldFinder } from './ccd-write-label-field-finder';
import { CcdWriteTextAreaFieldFinder } from './ccd-write-text-area-field-finder';
import { CcdWriteTextFieldFinder } from './ccd-write-text-field-finder';
import { CcdWriteYesNoFieldFinder } from './ccd-write-yes-no-field-finder';
import { TableCollectionFinder } from './complex-field-finders/table-collection-finder';
import { CollectionItemFinder } from './collection-item-finders/collection-item-finder';
import { ComplexFieldFinder } from './complex-field-finders/complex-field-finder';
import { Field } from './field';
import { FieldFinder } from './field-finder';
import { OrdinalToCardinal } from '../helpers/ordinal-to-cardinal';
import { TableCollectionItemFinder } from './collection-item-finders/table-collection-item-finder';
import { browser, by, ElementFinder, ExpectedConditions } from 'protractor';
import { CreateCaseFixedListFieldFinder } from './create-case-fixed-list-field-finder';
import { CcdWriteDocumentFieldFinder } from './ccd-write-document-field-finder';

export class Fields {

    private readonly collectionItemFinders: CollectionItemFinder[] = [
        new CcdWriteCollectionItemFinder(),
        new TableCollectionItemFinder()
    ];

    private readonly complexFieldFinders: ComplexFieldFinder[] = [
        new CcdWriteCollectionFinder(),
        new TableCollectionFinder(),
    ];

    private readonly fieldFinders: FieldFinder[] = [

        // TL;DR *order is important*

        // the following fields are searched in order of
        // specificity which affects the selection

        new CcdWriteAddressFieldFinder(),
        new CcdWriteDateFieldFinder(),

        new CcdWriteFixedListFieldFinder(),
        new CcdWriteTextFieldFinder(),
        new CcdWriteTextAreaFieldFinder(),
        new CcdWriteYesNoFieldFinder(),

        new CcdWriteDocumentFieldFinder(),
        new CcdWriteLabelFieldFinder(),

        // the following fields are not specific to one type
        // and so are searched last in order of specificity
        // which affects the selection for label-less fields

        new CcdReadTableFieldFinder(),
        new CcdReadListFieldFinder(),

        new CreateCaseFixedListFieldFinder(),
    ];

    private readonly container: ElementFinder;

    constructor(container: ElementFinder) {
        this.container = container;
    }

    public async addCollectionItem(
        complexFieldLabel: string
    ) {
        const complexFieldContainer = await this.findComplexFieldContainer(complexFieldLabel);

        if (!!complexFieldContainer) {

            await complexFieldContainer
                .all(by.xpath('.//button[normalize-space()="Add new"]'))
                .last()
                .click();
        }
    }

    public async find(
        fieldLabel: string,
        complexFieldLabel?: string,
        collectionItemNumber?: string | number
    ): Promise<Field> {

        let container = this.container;

        if (complexFieldLabel !== undefined) {

            const complexFieldContainer = await this.findComplexFieldContainer(complexFieldLabel);

            if (!!complexFieldContainer) {

                if (collectionItemNumber !== undefined) {

                    container = await this.findCollectionItemContainer(
                        complexFieldContainer,
                        collectionItemNumber
                    );

                } else {
                    container = complexFieldContainer;
                }
            }
        }

        return await this.findWithinContainer(container, fieldLabel);
    }

    public async removeCollectionItem(
        complexFieldLabel: string,
        collectionItemNumber: string | number
    ) {
        const complexFieldContainer = await this.findComplexFieldContainer(complexFieldLabel);

        if (!!complexFieldContainer) {

            const collectionItemContainer =
                await this.findCollectionItemContainer(
                    complexFieldContainer,
                    collectionItemNumber
                );

            await collectionItemContainer
                .all(by.xpath('.//button[normalize-space()="Remove"]'))
                .first()
                .click();

            await browser.wait(ExpectedConditions.visibilityOf(
                collectionItemContainer
                    .element(by.xpath('//ccd-remove-dialog//button[normalize-space()="Remove"]')))
            );

            await collectionItemContainer
                .all(by.xpath('//ccd-remove-dialog//button[normalize-space()="Remove"]'))
                .first()
                .click();

            await browser.wait(ExpectedConditions.invisibilityOf(
                collectionItemContainer
                    .element(by.xpath('//ccd-remove-dialog//button[normalize-space()="Remove"]')))
            );
        }
    }

    private async findComplexFieldContainer(
        complexFieldLabel: string
    ): Promise<ElementFinder> {

        for (let i = 0; i < this.complexFieldFinders.length; i++) {

            const complexField =
                await this.complexFieldFinders[i]
                    .findComplexField(
                        this.container,
                        complexFieldLabel
                    );

            if (!!complexField
                && await complexField.isPresent()) {
                return complexField;
            }
        }
    }

    private async findCollectionItemContainer(
        complexFieldContainer: string,
        collectionItemNumber: string | number
    ): Promise<ElementFinder> {

        const cardinalCollectionItemNumber = typeof collectionItemNumber === 'number'
            ? collectionItemNumber
            : OrdinalToCardinal.convertWordToNumber(collectionItemNumber);

        for (let i = 0; i < this.collectionItemFinders.length; i++) {

            const collectionItem =
                await this.collectionItemFinders[i]
                    .findCollectionItem(
                        complexFieldContainer,
                        cardinalCollectionItemNumber
                    );

            if (!!collectionItem
                && await collectionItem.isPresent()) {
                return collectionItem;
            }
        }
    }

    private async findWithinContainer(
        container: ElementFinder,
        fieldLabel: string
    ): Promise<Field> {

        for (let i = 0; i < this.fieldFinders.length; i++) {

            let field;

            if (!!fieldLabel) {
                field = await this.fieldFinders[i].findByLabel(container, fieldLabel);
            } else {
                field = await this.fieldFinders[i].findFirstHavingEmptyLabel(container);
            }

            if (field) {
                return field;
            }
        }
    }
}
