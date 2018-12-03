import { browser, by, element } from 'protractor';
import { Wait } from '../enums/wait';

export class AnyPage {

    async click(linkText: string) {

        const linkPath =
            '//*[self::button or self::a or self::label or self::span]' +
            '[normalize-space()="' + linkText + '"]';

        await browser.wait(
            async () => {
                return await element
                    .all(by.xpath(linkPath))
                    .isPresent();
            },
            Wait.normal,
            'Button or link did not show in time'
        );

        await element
            .all(by.xpath(linkPath))
            .last()
            .click();
    }

    async get(uri: string) {
        await browser.waitForAngularEnabled(true);
        await browser.get(uri);
    }

    async getWithoutWaitingForAngular(uri: string) {
        await browser.waitForAngularEnabled(false);
        await browser.get(uri);
    }

    async isButtonEnabled(buttonText: string) {

        const buttonPath = '//*[self::button or self::a][normalize-space()="' + buttonText + '"]';

        await browser.wait(
            async () => {
                return await element
                    .all(by.xpath(buttonPath))
                    .isPresent();
            },
            Wait.normal,
            'Button or link did not show in time'
        );

        const buttonElement =
            await element
                .all(by.xpath(buttonPath))
                .first();

        return await buttonElement.isEnabled();
    }

    async linkContains(match: string) {

        try {

            const linkPath = '//*[self::button or self::a][contains(normalize-space(), "' + match + '")]';

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
                        .all(by.xpath('//*[self::h1 or self::h2][contains(normalize-space(), "' + match + '")]'))
                        .isDisplayed();
                },
                Wait.normal,
                'Page heading did not show in time'
            );

            return true;

        } catch (error) {
            return false;
        }
    }

    async tagContains(text: string) {

        try {

            return await element
                .all(by.xpath('//*[contains(normalize-space(), "' + text + '")]'))
                .last()
                .isDisplayed();

        } catch (error) {
            return false;
        }
    }
}
