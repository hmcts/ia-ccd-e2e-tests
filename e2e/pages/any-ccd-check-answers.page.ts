import { $$, by, element } from 'protractor';
import { AnyCcdPage } from './any-ccd.page';
import { OrdinalToCardinal } from '../helpers/ordinal-to-cardinal';

export class AnyCcdCheckAnswersPage extends AnyCcdPage {

    async isFieldValueDisplayed(
        fieldLabel: string,
        fieldValue: string
    ) {
        try {

            if ($$('ccd-case-edit-submit').isPresent()) {

                return await element(by.xpath(
                    '//tr/th[normalize-space()="' + fieldLabel + '"]/..' +
                    '//td[normalize-space()="' + fieldValue + '"]'
                )).isDisplayed();
            }

            return false;
        } catch (error) {
            return false;
        }
    }

    async isFieldsetAnswerDisplayed(
        fieldsetLabel: string,
        fieldLabel: string,
        fieldValue: string
    ) {
        try {

            if ($$('ccd-case-edit-submit').isPresent()) {

                const fieldsetContainer =
                    await this.findFieldsetContainer(fieldsetLabel);

                return await
                    this.isRawComplexFieldDisplayed(
                        fieldsetContainer,
                        fieldLabel,
                        fieldValue
                    );
            }

            return false;
        } catch (error) {
            return false;
        }
    }

    protected async findCollectionContainer(collectionLabel: string) {

        return await element
            .all(by.xpath(
                '//tr/th[normalize-space()="' + collectionLabel + '"]/..' +
                '//td//table[@class="collection-field-table"]'
            ))
            .first();
    }

    protected async findCollectionItemContainer(collectionLabel: string, collectionItemNumber: string | number) {

        const cardinalNumber = typeof collectionItemNumber === 'number'
            ? collectionItemNumber
            : OrdinalToCardinal.convertWordToNumber(collectionItemNumber);

        const collectionContainer = await this.findCollectionContainer(collectionLabel);

        if (await collectionContainer.$$('ccd-read-complex-field').isPresent()) {

            const collectionItemContainersByLabel =
                collectionContainer
                    .all(by.xpath('.//dt[normalize-space()="' + collectionLabel + '"]/ancestor::ccd-read-complex-field-raw'));

            if ((await collectionItemContainersByLabel.count()) >= cardinalNumber) {

                return await collectionItemContainersByLabel
                    .get(cardinalNumber - 1);
            }

            const collectionItemContainersByBlankLabel =
                await collectionContainer
                    .all(by.xpath('.//dt[normalize-space()=""]/ancestor::ccd-read-complex-field-raw'))
                    .get(cardinalNumber - 1);

            return await collectionItemContainersByBlankLabel;

        } else {

            return await collectionContainer
                .all(by.xpath('.//ccd-field-read'))
                .get(cardinalNumber - 1);
        }
    }

    protected async findFieldsetContainer(fieldsetLabel: string) {

        return await element
            .all(by.xpath(
                '//tr/th[normalize-space()="' + fieldsetLabel + '"]/..' +
                '//td//ccd-read-complex-field'
            ))
            .first();
    }
}
