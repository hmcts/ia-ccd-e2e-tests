import { $, $$, browser, by, element, ExpectedConditions } from 'protractor';
import { AnyPage } from './any.page';
import { OrdinalToCardinal } from '../helpers/ordinal-to-cardinal';

export class AnyCcdPage extends AnyPage {

    async alertContains(match: string) {

        await browser.wait(ExpectedConditions.visibilityOf($('div.alert-message')));
        return (await $('div.alert-message').getText()).includes(match);
    }

    async notificationContains(match: string) {

        await browser.wait(ExpectedConditions.visibilityOf($('div.notification')));
        return (await $('div.notification').getText()).includes(match);
    }

    async usernameContains(match: string) {

        try {

            return await element(by.xpath('//*[@id="user-name" and contains(normalize-space(), "' + match + '")]'))
                .isDisplayed();

        } catch (error) {
            return false;
        }
    }

    async isFieldDisplayed(fieldLabel: string) {

        try {

            if ($$('cut-tabs').isPresent()) {

                return await element.all(by.xpath('//div[normalize-space()="' + fieldLabel + '"]/../..//td'))
                    .first()
                    .isDisplayed();
            }

            return false;
        } catch (error) {
            return false;
        }
    }

    async isFieldValueDisplayed(
        fieldLabel: string,
        fieldValue: string
    ) {
        try {

            if (await $$('ccd-create-case-filters').isPresent()) {

                const fieldLabelElement = await element(by.xpath('//label[normalize-space()="' + fieldLabel + '"]'));
                const fieldElement = await element(by.css('#' + (await fieldLabelElement.getAttribute('for'))));
                const fieldElementTagName = await fieldElement.getTagName();

                if (fieldElementTagName === 'select') {

                    const fieldSelectedElement = await fieldElement.element(by.css('option:checked'));
                    return (await fieldSelectedElement.getText() === fieldValue);

                } else {
                    throw 'Unsupported field type';
                }

            } else if ($$('ccd-case-edit-submit').isPresent()) {

                return await element(by.xpath('//tr/th[normalize-space()="' + fieldLabel + '"]/..' +
                    '//td[normalize-space()="' + fieldValue + '"]'))
                    .isDisplayed();

            } else if ($$('cut-tabs').isPresent()) {

                return await element(by.xpath('//div[normalize-space()="' + fieldLabel + '"]/../..' +
                    '//td[normalize-space()="' + fieldValue + '"]'))
                    .isDisplayed();
            }

            return false;
        } catch (error) {
            return false;
        }
    }

    async isCollectionItemFieldValueDisplayed(
        collectionLabel: string,
        collectionItemNumber: string,
        fieldLabel: string,
        fieldValue: string
    ) {
        try {

            const collectionItemContainer =
                await this.findCollectionItemContainer(collectionLabel, collectionItemNumber);

            if ((await collectionItemContainer.getTagName()) === 'ccd-read-complex-field-raw') {

                return await
                    this.isRawComplexFieldDisplayed(
                        collectionItemContainer,
                        fieldLabel,
                        fieldValue
                    );

            } else if ((await collectionItemContainer.getTagName()) === 'ccd-read-complex-field-table') {

                return await
                    this.isTableComplexFieldDisplayed(
                        collectionItemContainer,
                        fieldLabel,
                        fieldValue
                    );

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

    async isFieldsetFieldValueDisplayed(
        fieldsetLabel: string,
        fieldLabel: string,
        fieldValue: string
    ) {
        try {

            const fieldsetContainer =
                await element
                    .all(by.xpath(
                        '//dl[@class="complex-panel-title"]' +
                        '//span[normalize-space()="' + fieldsetLabel + '"]' +
                        '/ancestor::ccd-read-complex-field'
                    ))
                    .first();

            const fieldContainer =
                await fieldsetContainer
                    .all(by.xpath('.//th/span[normalize-space()="' + fieldLabel + '"]/../..'))
                    .first();

            return await fieldContainer
                .element(by.xpath('.//td/span[normalize-space()="' + fieldValue + '"]'))
                .isDisplayed();

        } catch (error) {
            return false;
        }
    }

    protected async findCollectionContainer(collectionLabel: string) {

        return await element
            .all(by.xpath('//div[normalize-space()="' + collectionLabel + '"]/../..//table[@class="collection-field-table"]'))
            .first();
    }

    protected async findCollectionItemContainer(collectionLabel: string, collectionItemNumber: string | number) {

        const cardinalNumber = typeof collectionItemNumber === 'number'
            ? collectionItemNumber
            : OrdinalToCardinal.convertWordToNumber(collectionItemNumber);

        const collectionContainer = await this.findCollectionContainer(collectionLabel);

        if (await collectionContainer.$$('ccd-read-complex-field').isPresent()) {

            let collectionItemLabel = collectionLabel + ' ' + cardinalNumber;

            return await collectionContainer
                .all(by.xpath(
                    './/dt/span[normalize-space()="' + collectionItemLabel + '"]' +
                    '/ancestor::ccd-read-complex-field-table'
                ))
                .first();

        } else {

            return await collectionContainer
                .all(by.xpath('.//ccd-field-read'))
                .get(cardinalNumber - 1);
        }
    }

    protected async isRawComplexFieldDisplayed(rawComplexContainer, fieldLabel: string, fieldValue: string) {

        const fieldDisplayedByLabel =
            rawComplexContainer
                .all(by.xpath(
                    './/dt[normalize-space()="' + fieldLabel + '"]' +
                    '/following-sibling::dd[1][normalize-space()="' + fieldValue + '"]'
                ));

        if ((await fieldDisplayedByLabel.count()) > 0) {
            return await fieldDisplayedByLabel
                .first()
                .isDisplayed();
        }

        return await rawComplexContainer
            .all(by.xpath(
                './/dt[normalize-space()=""]' +
                '/following-sibling::dd[1][normalize-space()="' + fieldValue + '"]'
            ))
            .first()
            .isDisplayed();
    }

    protected async isTableComplexFieldDisplayed(tableComplexContainer, fieldLabel: string, fieldValue: string) {

        const fieldDisplayedByLabel =
            tableComplexContainer
                .all(by.xpath(
                    './/th/span[normalize-space()="' + fieldLabel + '"]/../..' +
                    '//td/span[normalize-space()="' + fieldValue + '"]'
                ));

        if ((await fieldDisplayedByLabel.count()) > 0) {
            return await fieldDisplayedByLabel
                .first()
                .isDisplayed();
        }

        return await tableComplexContainer
            .all(by.xpath(
                './/th/span[normalize-space()=""]/../..' +
                '//td/span[normalize-space()="' + fieldValue + '"]'
            ))
            .first()
            .isDisplayed();
    }

    async isLoaded() {
        return (await browser.driver.getCurrentUrl()).includes('ccd')
            && (await ExpectedConditions.visibilityOf($('#sign-out'))());
    }

    async waitUntilLoaded() {
        await browser.waitForAngularEnabled(true);
        await browser.waitForAngular();
    }
}
