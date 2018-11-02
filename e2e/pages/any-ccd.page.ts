import { $, $$, browser, by, element, ExpectedConditions } from 'protractor';
import { AnyPage } from './any.page';
import { Wait } from '../enums/wait';

export class AnyCcdPage extends AnyPage {

    private signOutLink = '#sign-out';

    async click(linkText: string) {

        const linkPath = '//*[self::button or self::a][normalize-space()="' + linkText + '"]';

        await browser.wait(
            async () => {
                return await element
                    .all(by.xpath(linkPath))
                    .isPresent();
            },
            Wait.normal,
            'Button did not show in time'
        );

        await element
            .all(by.xpath(linkPath))
            .first()
            .click();
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

    async isFieldsetFieldValueDisplayed(
        fieldsetLabel: string,
        fieldLabel: string,
        fieldValue: string
    ) {
        try {

            const fieldsetContainer =
                await element
                    .all(by.xpath('//dl[@class="complex-panel-title"]//span[normalize-space()="' + fieldsetLabel
                        + '"]/ancestor::ccd-read-complex-field'))
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

    async linkContains(match: string) {

        try {

            const linkPath = '//*[self::button or self::a][contains(text(), "' + match + '")]';

            return await element(by.xpath(linkPath)).isDisplayed()
                && await element(by.xpath(linkPath)).isEnabled();

        } catch (error) {
            return false;
        }
    }

    async pageHeadingContains(match: string) {

        try {

            await browser.wait(
                async () => {
                    return await element
                        .all(by.xpath('//*[self::h1 or self::h2][contains(text(), "' + match + '")]'))
                        .isPresent();
                },
                Wait.normal,
                'Page heading did not show in time'
            );

            return true;

        } catch (error) {
            return false;
        }
    }

    async usernameContains(match: string) {

        try {

            return await element(by.xpath('//*[@id="user-name" and contains(text(), "' + match + '")]'))
                .isDisplayed();

        } catch (error) {
            return false;
        }
    }

    async alertContains(match: string) {

        await browser.wait(ExpectedConditions.visibilityOf($('div.alert-message')));
        return (await $('div.alert-message').getText()).includes(match);
    }

    async notificationContains(match: string) {

        await browser.wait(ExpectedConditions.visibilityOf($('div.notification')));
        return (await $('div.notification').getText()).includes(match);
    }

    async isLoaded() {
        return (await browser.driver.getCurrentUrl()).includes('ccd')
            && (await ExpectedConditions.visibilityOf($(this.signOutLink))());
    }

    async waitUntilLoaded() {
        await browser.waitForAngularEnabled(true);
        await browser.waitForAngular();
    }
}
