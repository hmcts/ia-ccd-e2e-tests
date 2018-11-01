import { $, browser, by, element, ExpectedConditions } from 'protractor';
import { AnyCcdPage } from './any-ccd.page';
import { OrdinalToCardinal } from '../helpers/ordinal-to-cardinal';

export class AnyCcdFormPage extends AnyCcdPage {

    private cancelLink = 'p.cancel';

    async addNewCollectionItem(collectionLabel: string) {

        const collectionContainer = await this.findCollectionContainer(collectionLabel);

        await collectionContainer
            .all(by.xpath('button[normalize-space()="Add new"]'))
            .first()
            .click();
    }

    async getCollectionItemFieldValues(
        collectionLabel: string,
        collectionItemNumber: string,
        fieldLabel: string
    ) {
        const collectionItemContainer =
            await this.findCollectionItemContainer(collectionLabel, collectionItemNumber);

        const fieldContainer =
            await this.findFieldContainer(collectionItemContainer, fieldLabel);

        if (await fieldContainer.$$('ccd-write-fixed-list-field').isPresent()) {

            return await fieldContainer
                .all(by.xpath('.//option'))
                .map(async (option) => (await option.getText()).trim());
        }
    }

    async setCollectionItemFieldValue(
        collectionLabel: string,
        collectionItemNumber: string,
        fieldValue: string,
        fieldLabel: string
    ) {
        const collectionItemContainer =
            await this.findCollectionItemContainer(collectionLabel, collectionItemNumber);

        const fieldContainer =
            await this.findFieldContainer(collectionItemContainer, fieldLabel);

        await this.setFieldValueWithinContainer(fieldContainer, fieldValue);
    }

    async setFieldValue(
        fieldValue: string,
        fieldLabel: string
    ) {
        const fieldContainer =
            await this.findFieldContainer(element, fieldLabel);

        await this.setFieldValueWithinContainer(fieldContainer, fieldValue);
    }

    async isLoaded() {
        return (await browser.driver.getCurrentUrl()).includes('ccd')
            && (await ExpectedConditions.visibilityOf($(this.cancelLink))());
    }

    private async findCollectionContainer(collectionLabel: string) {

        return await element
            .all(by.xpath('//ccd-write-collection-field//h3[normalize-space()="' + collectionLabel + '"]/..'))
            .first();
    }

    private async findCollectionItemContainer(collectionLabel: string, collectionItemNumber: string | number) {

        const cardinalNumber = typeof collectionItemNumber === 'number'
            ? collectionItemNumber
            : OrdinalToCardinal.convertWordToNumber(collectionItemNumber);

        let collectionItemLabel = collectionLabel;
        if (cardinalNumber > 1) {
            collectionItemLabel += ' ' + cardinalNumber;
        }

        const collectionContainer = await this.findCollectionContainer(collectionLabel);

        return await collectionContainer
            .all(by.xpath('.//div[@class="collection-title"]//label[normalize-space()="' + collectionItemLabel + '"]/../../..'))
            .first();
    }

    private async findFieldContainer(container, fieldLabel) {

        return await container
            .all(by.xpath('.//span[@class="form-label" and normalize-space()="' + fieldLabel + '"]/ancestor::ccd-field-write'))
            .last();
    }

    private async setFieldValueWithinContainer(fieldContainer, fieldValue) {

        if (await fieldContainer.$$('ccd-write-fixed-list-field').isPresent()) {

            await fieldContainer
                .element(by.xpath('.//option[normalize-space()="' + fieldValue + '"]'))
                .click();

        } else if (await fieldContainer.$$('ccd-write-yes-no-field').isPresent()) {

            await fieldContainer
                .element(by.xpath('.//label[normalize-space()="' + fieldValue + '"]/../input'))
                .click();

        } else {
            throw 'Unsupported field type';
        }
    }
}
