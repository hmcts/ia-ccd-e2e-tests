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

    async setCollectionItemFieldValue(
        collectionLabel: string,
        collectionItemNumber: string,
        fieldValue: string,
        fieldLabel: string
    ) {
        const collectionItemContainer =
            await this.findCollectionItemContainer(collectionLabel, collectionItemNumber);

        const fieldContainer =
            await collectionItemContainer
                .all(by.xpath('.//span[@class="form-label" and normalize-space()="' + fieldLabel + '"]/../../..'))
                .first();

        await this.setFieldValueWithinContainer(fieldContainer, fieldValue);
    }

    async setFieldValue(
        fieldValue: string,
        fieldLabel: string
    ) {
        const fieldContainer =
            await element
                .all(by.xpath('.//span[@class="form-label" and normalize-space()="' + fieldLabel + '"]/../../../..'))
                .first();

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

    private async setFieldValueWithinContainer(fieldContainer, fieldValue) {

        const tagName = await fieldContainer.getTagName();

        if (tagName === 'ccd-write-fixed-list-field') {

            await fieldContainer
                .element(by.xpath('.//option[normalize-space()="' + fieldValue + '"]'))
                .click();

        } else if (tagName === 'ccd-write-yes-no-field') {

            await fieldContainer
                .element(by.xpath('.//label[normalize-space()="' + fieldValue + '"]/../input'))
                .click();
        }
    }
}
