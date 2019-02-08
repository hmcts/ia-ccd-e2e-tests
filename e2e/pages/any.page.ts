import { browser, by, element } from 'protractor';
import { Wait } from '../enums/wait';
import { ValueExpander } from '../helpers/value-expander';

export class AnyPage {

    protected readonly valueExpander = new ValueExpander();

    async getCurrentUrl() {
        return await browser.driver.getCurrentUrl();
    }

    async get(uri: string) {
        await browser.get(uri);
    }

    async click(linkText: string) {

        const expandedLinkText = await this.valueExpander.expand(linkText);

        const buttonPath = '//button[normalize-space()="' + expandedLinkText + '"]';
        const anchorPath = '//a[normalize-space()="' + expandedLinkText + '"]';
        const linkPath =
            '//*[self::label or self::span]' +
            '[text()[normalize-space()="' + expandedLinkText + '"]]';

        try {
            await browser.wait(
                async () => {
                    return (await element
                        .all(by.xpath(buttonPath + ' | ' + anchorPath + ' | ' + linkPath))
                        .filter(e => e.isPresent() && e.isDisplayed() && e.isEnabled())
                        .count()) > 0;
                },
                linkText === 'Close and Return to case details' ? Wait.normal : Wait.minimal
            );
        } catch (e) {
            // do nothing and carry on ...
        }

        const button = await element
            .all(by.xpath(buttonPath))
            .filter(e => e.isPresent() && e.isDisplayed())
            .first();

        if (await button.isPresent()) {
            await button.click();
            return;
        }

        const anchor = await element
            .all(by.xpath(anchorPath))
            .filter(e => e.isPresent() && e.isDisplayed())
            .first();

        if (await anchor.isPresent()) {
            await anchor.click();
            return;
        }

        const link = await element
            .all(by.xpath(linkPath))
            .filter(e => e.isPresent() && e.isDisplayed())
            .first();

        await link.click();
    }

    async isButtonEnabled(match: string, shortWait = false) {

        const expandedMatch = await this.valueExpander.expand(match);

        try {

            await browser.wait(
                async () => {
                    return (await element
                        .all(by.xpath(
                            '//*[self::button or self::a]' +
                            '[contains(normalize-space(), "' + expandedMatch + '") and not(ancestor::*[@hidden])]'
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
    }

    async linkContains(match: string, shortWait = false) {

        const expandedMatch = await this.valueExpander.expand(match);

        try {

            await browser.wait(
                async () => {
                    return (await element
                        .all(by.xpath(
                            '//*[self::button or self::a]' +
                            '[contains(normalize-space(), "' + expandedMatch + '") and not(ancestor::*[@hidden])]'
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

    async headingContains(match: string, shortWait = false) {

        const expandedMatch = await this.valueExpander.expand(match);

        try {

            await browser.wait(
                async () => {
                    return (await element
                        .all(by.xpath(
                            '//*[self::h1 or self::h2 or self::h3 or self::caption]' +
                            '[contains(normalize-space(), "' + expandedMatch + '") and not(ancestor::*[@hidden])]'
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

    async contentContains(match: string, shortWait = false) {

        const expandedMatch = await this.valueExpander.expand(match);

        const contentPath =
            '//*[' +
            'self::h1 or ' +
            'self::h2 or ' +
            'self::h3 or ' +
            'self::h4 or ' +
            'self::caption or ' +
            'self::label or ' +
            'self::p or ' +
            'self::div                       [contains(text(), "' + expandedMatch + '")] or ' +  // avoid text in child nodes
            'self::ccd-read-date-field       [contains(text(), "' + expandedMatch + '")] or ' +  // for more generic containers
            'self::ccd-read-fixed-list-field [contains(text(), "' + expandedMatch + '")] or ' +  // ..
            'self::ng-component              [contains(text(), "' + expandedMatch + '")] or ' +  // ..
            'self::span                      [contains(text(), "' + expandedMatch + '")] or ' +  // ..
            'self::td                        [contains(text(), "' + expandedMatch + '")]' +      // ..
            ']' +
            '[contains(normalize-space(), "' + expandedMatch + '") and not(ancestor::*[@hidden])]';

        try {

            await browser.wait(
                async () => {
                    return (await element
                        .all(by.xpath(contentPath))
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

    async imgSrcContains(match: string, shortWait = false) {

        const expandedMatch = await this.valueExpander.expand(match);

        try {

            await browser.wait(
                async () => {
                    return (await element
                        .all(by.xpath('//img[contains(@src, "' + expandedMatch + '")]'))
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

    async urlContains(match: string, shortWait = false) {

        const expandedMatch = await this.valueExpander.expand(match);

        try {

            await browser.wait(
                async () => {
                    return (await browser.driver.getCurrentUrl()).includes(expandedMatch);
                },
                shortWait ? Wait.short : Wait.normal
            );

            return true;

        } catch (error) {
            return false;
        }
    }

    async waitUntilLoaded() {
        await browser.sleep(Wait.minimal);
    }
}
