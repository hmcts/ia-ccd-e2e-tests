import { by, element } from 'protractor';
import { AnyCcdPage } from './any-ccd.page';
// import { OrdinalToCardinal } from '../helpers/ordinal-to-cardinal';

export class CaseDetailsPage extends AnyCcdPage {

    // async isCollectionItemFieldValueDisplayed(
    //     collectionLabel: string,
    //     collectionItemNumber: string,
    //     fieldValue: string,
    //     fieldLabel: string
    // ) {
    //     const collectionItemContainer =
    //         await this.findCollectionItemContainer(collectionLabel, collectionItemNumber);
    //
    //     // table/tbody/td/[normalize-space()="' + fieldValue + '"]
    //
    //     const fieldContainer =
    //         await collectionItemContainer
    //             .all(by.xpath('.//span[@class="form-label" and normalize-space()="' + fieldLabel + '"]/../../..'))
    //             .first();
    //
    //     await this.setFieldValueWithinContainer(fieldContainer, fieldValue);
    // }

    async isFieldValueDisplayed(
        fieldLabel: string,
        fieldValue: string
    ) {
        return await element(by.xpath('//div[normalize-space()="' + fieldLabel + '"]/../../td[normalize-space()="' + fieldValue + '"]'))
            .isDisplayed();
    }

    // private async findCollectionContainer(collectionLabel: string) {
    //
    //     return await element
    //         .all(by.xpath('//div[normalize-space()="' + collectionLabel + '"]/../..[.//table[@class="collection-field-table"]]'))
    //         .first();
    // }
    //
    // private async findCollectionItemContainer(collectionLabel: string, collectionItemNumber: string | number) {
    //
    //     const cardinalNumber = typeof collectionItemNumber === 'number'
    //         ? collectionItemNumber
    //         : OrdinalToCardinal.convertWordToNumber(collectionItemNumber);
    //
    //     let collectionItemLabel = collectionLabel + ' ' + cardinalNumber;
    //
    //     const collectionContainer = await this.findCollectionContainer(collectionLabel);
    //
    //     return await collectionContainer
    //         .all(by.xpath('.//dt/span[normalize-space()="' + collectionItemLabel + '"]/../../..'))
    //         .first();
    // }
}
