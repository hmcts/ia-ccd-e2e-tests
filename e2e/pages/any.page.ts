import { browser, by, element } from 'protractor';
import { Wait } from '../enums/wait';

export class AnyPage {

    async getCurrentUrl() {
        return await browser.driver.getCurrentUrl();
    }

    async get(uri: string) {
        await browser.waitForAngularEnabled(true);
        await browser.get(uri);
    }

    async getWithoutWaitingForAngular(uri: string) {
        await browser.waitForAngularEnabled(false);
        await browser.get(uri);
    }

    async click(linkText: string) {

        const buttonPath = '//button[normalize-space()="' + linkText + '"]';

        const button = await element
            .all(by.xpath(buttonPath))
            .filter(e => e.isPresent() && e.isDisplayed())
            .first();

        if (await button.isPresent()) {
            await button.click();
            return;
        }

        const anchorPath = '//a[normalize-space()="' + linkText + '"]';

        const anchor = await element
            .all(by.xpath(anchorPath))
            .filter(e => e.isPresent() && e.isDisplayed())
            .first();

        if (await anchor.isPresent()) {
            await anchor.click();
            return;
        }

        const linkPath =
            '//*[self::label or self::span]' +
            '[text()[normalize-space()="' + linkText + '"]]';

        const link = await element
            .all(by.xpath(linkPath))
            .filter(e => e.isPresent() && e.isDisplayed())
            .first();

        await link.click();
    }

    async isButtonEnabled(match: string, shortWait: boolean = false) {

        try {

            await browser.wait(
                async () => {
                    return (await element
                        .all(by.xpath(
                            '//*[self::button or self::a]' +
                            '[contains(normalize-space(), "' + match + '") and not(ancestor::*[@hidden])]'
                        ))
                        .filter(e => e.isPresent() && e.isDisplayed() && e.isEnabled())
                        .count()) > 0;
                },
                shortWait ? Wait.short : Wait.normal
            );

            return true;

        } catch (error) {
            return false;
        }

        // const buttonPath = '//*[self::button or self::a][normalize-space()="' + buttonText + '"]';
        //
        // await browser.wait(
        //     async () => {
        //         return await element
        //             .all(by.xpath(buttonPath))
        //             .isPresent();
        //     },
        //     Wait.normal,
        //     'Button or link did not show in time'
        // );
        //
        // const buttonElement =
        //     await element
        //         .all(by.xpath(buttonPath))
        //         .first();
        //
        // return await buttonElement.isEnabled();
    }

    async linkContains(match: string, shortWait: boolean = false) {

        // try {
        //
        //     const linkPath = '//*[self::button or self::a][contains(normalize-space(), "' + match + '")]';
        //
        //     return await element(by.xpath(linkPath)).isDisplayed()
        //         && await element(by.xpath(linkPath)).isEnabled();
        //
        // } catch (error) {
        //     return false;
        // }

        try {

            await browser.wait(
                async () => {
                    return (await element
                        .all(by.xpath(
                            '//*[self::button or self::a]' +
                            '[contains(normalize-space(), "' + match + '") and not(ancestor::*[@hidden])]'
                        ))
                        .filter(e => e.isPresent() && e.isDisplayed())
                        .count()) > 0;
                },
                shortWait ? Wait.short : Wait.normal
            );

            return true;

        } catch (error) {
            return false;
        }
    }

    async headingContains(match: string, shortWait: boolean = false) {

        try {

            await browser.wait(
                async () => {
                    return (await element
                        .all(by.xpath(
                            '//*[self::h1 or self::h2 or self::caption]' +
                            '[contains(normalize-space(), "' + match + '") and not(ancestor::*[@hidden])]'
                        ))
                        .filter(e => e.isPresent() && e.isDisplayed())
                        .count()) > 0;
                },
                shortWait ? Wait.short : Wait.normal
            );

            return true;

        } catch (error) {
            return false;
        }
    }

    async contentContains(match: string, shortWait: boolean = false) {

        try {

            await browser.wait(
                async () => {
                    return (await element
                        .all(by.xpath(
                            '//*[self::p or self::h1 or self::h2 or self::h3 or self::h4 or self::caption or self::label or self::td/text()]' +
                            '[contains(normalize-space(), "' + match + '") and not(ancestor::*[@hidden])]'
                        ))
                        .filter(e => e.isPresent() && e.isDisplayed())
                        .count()) > 0;
                },
                shortWait ? Wait.short : Wait.normal
            );

            return true;

        } catch (error) {
            return false;
        }
    }

    async imgSrcContains(match: string, shortWait: boolean = false) {

        try {

            await browser.wait(
                async () => {
                    return (await element
                        .all(by.xpath('//img[contains(@src, "' + match + '")]'))
                        .filter(e => e.isPresent() && e.isDisplayed())
                        .count()) > 0;
                },
                shortWait ? Wait.short : Wait.normal
            );

            return true;

        } catch (error) {
            return false;
        }
    }

    async urlContains(match: string, shortWait: boolean = false) {

        try {

            await browser.wait(
                async () => {
                    return (await browser.driver.getCurrentUrl()).includes(match);
                },
                shortWait ? Wait.short : Wait.normal
            );

            return true;

        } catch (error) {
            return false;
        }
    }
}
