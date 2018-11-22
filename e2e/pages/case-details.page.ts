import { by, element } from 'protractor';
import { AnyCcdPage } from './any-ccd.page';
import { OrdinalToCardinal } from '../helpers/ordinal-to-cardinal';

export class CaseDetailsPage extends AnyCcdPage {

    async isCollectionItemFieldValueDisplayed(
        collectionLabel: string,
        collectionItemNumber: string,
        fieldLabel: string,
        fieldValue: string
    ) {
        try {

            const collectionItemContainer =
                await this.findCollectionItemContainer(collectionLabel, collectionItemNumber);

            if ((await collectionItemContainer.getTagName()) === 'ccd-read-complex-field-table') {

                let fieldContainer =
                    await collectionItemContainer
                        .all(by.xpath('.//th/span[normalize-space()="' + fieldLabel + '"]/../..'))
                        .first();

                if (!(await fieldContainer.isPresent())) {

                    fieldContainer =
                        await collectionItemContainer
                            .all(by.xpath('.//th/span[normalize-space()=""]/../..'))
                            .first();
                }

                return await fieldContainer
                    .element(by.xpath('.//td/span[normalize-space()="' + fieldValue + '"]'))
                    .isDisplayed();

            } else {

                return await collectionItemContainer
                    .all(by.xpath('.//*[normalize-space()="' + fieldValue + '"]'))
                    .last()
                    .isDisplayed();
            }

        } catch (error) {
            return false;
        }
    }

    private async findCollectionContainer(collectionLabel: string) {

        return await element
            .all(by.xpath('//div[normalize-space()="' + collectionLabel + '"]/../..//table[@class="collection-field-table"]'))
            .first();
    }

    private async findCollectionItemContainer(collectionLabel: string, collectionItemNumber: string | number) {

        const cardinalNumber = typeof collectionItemNumber === 'number'
            ? collectionItemNumber
            : OrdinalToCardinal.convertWordToNumber(collectionItemNumber);

        const collectionContainer = await this.findCollectionContainer(collectionLabel);

        if (await collectionContainer.$$('ccd-read-complex-field').isPresent()) {

            let collectionItemLabel = collectionLabel + ' ' + cardinalNumber;

            return await collectionContainer
                .all(by.xpath('.//dt/span[normalize-space()="' + collectionItemLabel + '"]/ancestor::ccd-read-complex-field-table'))
                .first();

        } else {

            return await collectionContainer
                .all(by.xpath('.//ccd-field-read')).get(cardinalNumber - 1);
        }
    }
}
