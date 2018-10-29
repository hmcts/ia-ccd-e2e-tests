import { by, element } from 'protractor';
import { AnyCcdPage } from './any-ccd.page';
import { OrdinalToCardinal } from '../helpers/ordinal-to-cardinal';

export class CaseDetailsPage extends AnyCcdPage {

    async isCollectionItemFieldValueDisplayed(
        collectionLabel: string,
        collectionItemNumber: string,
        fieldValue: string,
        fieldLabel: string
    ) {
        try {

            const collectionItemContainer =
                await this.findCollectionItemContainer(collectionLabel, collectionItemNumber);

            const fieldContainer =
                await collectionItemContainer
                    .all(by.xpath('.//th/span[normalize-space()="' + fieldLabel + '"]/../..'))
                    .first();

            return await fieldContainer
                .element(by.xpath('.//td/span[normalize-space()="' + fieldValue + '"]'))
                .isDisplayed();

        } catch (error) {
            return false;
        }
    }

    async isFieldValueDisplayed(
        fieldLabel: string,
        fieldValue: string
    ) {
        try {

            return await element(by.xpath('//div[normalize-space()="' + fieldLabel + '"]/../../td[normalize-space()="' + fieldValue + '"]'))
                .isDisplayed();

        } catch (error) {
            return false;
        }
    }

    private async findCollectionContainer(collectionLabel: string) {

        return await element
            .all(by.xpath('//div[normalize-space()="' + collectionLabel + '"]/../..'))
            .filter(async (childElement) => {
                return await childElement
                    .isElementPresent(by.xpath('.//table[@class="collection-field-table"]'))
            })
            .first();
    }

    private async findCollectionItemContainer(collectionLabel: string, collectionItemNumber: string | number) {

        const cardinalNumber = typeof collectionItemNumber === 'number'
            ? collectionItemNumber
            : OrdinalToCardinal.convertWordToNumber(collectionItemNumber);

        let collectionItemLabel = collectionLabel + ' ' + cardinalNumber;

        const collectionContainer = await this.findCollectionContainer(collectionLabel);

        return await collectionContainer
            .all(by.xpath('.//dt/span[normalize-space()="' + collectionItemLabel + '"]/../../..'))
            .first();
    }
}
