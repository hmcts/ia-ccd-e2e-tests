import { browser, by, element, protractor } from 'protractor';
import { Wait } from '../enums/wait';
import { ValueExpander } from '../helpers/value-expander';
const AxeRunner = require('../helpers/accessibility/axe-runner');
const iaConfig = require('../ia.conf');
const BrowserWaits = require('../support/customWaits');

export class AnyPage {

    protected readonly valueExpander = new ValueExpander();

    async getCurrentUrl() {
        return await browser.driver.getCurrentUrl();
    }

    async get(uri: string) {
        await browser.get(uri);
    }

    async runAccessbility() {
        if (iaConfig.TestForAccessibility) {
            await AxeRunner.runAndReportAccessibility();
        }
    }

    async getDisplayedImageSources(wait = Wait.normal) {
        try {
            await browser.wait(
                async () => {
                    return (await element
                            .all(by.xpath('//img'))
                            .filter(e => e.isPresent() && e.isDisplayed())
                            .count()) > 0;
                },
                wait
            );

            return await element
                .all(by.xpath('//img'))
                .filter(e => e.isPresent() && e.isDisplayed())
                .map(async (img) => (await img.getAttribute('src')).trim());

        } catch (error) {
            return []
        }
    }

    async click(linkText: string, xpathIndex = 0) {

        const expandedLinkText = await this.valueExpander.expand(linkText);

        const buttonPath = '//button[normalize-space()="' + expandedLinkText + '"]';
        const anchorPath = '//a[normalize-space()="' + expandedLinkText + '"]';
        const linkPath =
            '//*' +
            '[text()[normalize-space()="' + expandedLinkText + '"]]';

        try {
            await browser.wait(
                async () => {
                    return (await element
                        .all(by.xpath(buttonPath + ' | ' + anchorPath + ' | ' + linkPath))
                        .filter(e => e.isPresent() && e.isDisplayed() && e.isEnabled())
                        .count()) > 0;
                },
                linkText === 'Close and Return to case details' ? Wait.long : Wait.short
            );
        } catch (e) {
            // do nothing and carry on ...
        }

        const button = await element
            .all(by.xpath(buttonPath))
            .filter(e => e.isPresent() && e.isDisplayed())
            .get(xpathIndex);

        if (await button.isPresent()) {
            await BrowserWaits.waitForelementToBeClickable(button)
            let thisPageUrl = await browser.getCurrentUrl();
            await button.click();
            if (linkText === 'Continue') {
                await this.waitForPageNavigation(thisPageUrl);
            }
            return;
        }

        const anchor = await element
            .all(by.xpath(anchorPath))
            .filter(e => e.isPresent() && e.isDisplayed())
            .get(xpathIndex);

        if (await anchor.isPresent()) {
            await BrowserWaits.waitForelementToBeClickable(anchor)
            await anchor.click();
            await browser.sleep(5000);
            return;
        }

        const link = await element
            .all(by.xpath(linkPath))
            .filter(e => e.isPresent() && e.isDisplayed())
            .get(xpathIndex);

            await BrowserWaits.waitForelementToBeClickable(link)
             await link.click();
    }

    async waitForPageNavigation(currentPageUrl) {
        let nextPage = '';
        let pageErrors = '';
        await browser.wait(async () => {
            nextPage = await browser.getCurrentUrl();

            if (nextPage.includes('/noc')) {
                return true;
            }

            return currentPageUrl !== nextPage;
        }, 25000, 'Navigation to next page taking too long ' + 15000 + '. Current page ' + currentPageUrl + '. Errors => ' + pageErrors);
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
                shortWait ? Wait.minimal : Wait.normal
            );
            return true;
        } catch (error) {
            return false;
        }
    }

    async doesDropdownHaveValues(match: string, shortWait = false) {

        const expandedMatch = await this.valueExpander.expand(match);

        try {

            await browser.wait(
                async () => {
                    return (await element
                        .all(by.xpath(
                            '//label[contains(normalize-space(),"' + expandedMatch + '")]' +
                            '/../select/option[string-length(@value) > 0]'
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

    async contentContains(match: string, wait: Wait = Wait.normal) {

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
            'self::li                        [contains(text(), "' + expandedMatch + '")] or ' +  // for bulleted text
            'self::div                       [contains(text(), "' + expandedMatch + '")] or ' +  // avoid text in child nodes
            'self::ccd-read-date-field       [contains(text(), "' + expandedMatch + '")] or ' +  // for more generic containers
            'self::dt                        [contains(text(), "' + expandedMatch + '")] or ' +  // added recently
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
                wait
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
                Wait.normal
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
        if (iaConfig.WaitForAngular) {
            await browser.waitForAngularEnabled(true);
            await browser.waitForAngular();
        } else {
            await browser.sleep(Wait.minimal);
        }
    }

    async hideSpinner() {
        const el = await element(by.css('loading-spinner-in-action'));
        let EC = protractor.ExpectedConditions;
        await browser.wait(EC.not(EC.presenceOf(el)), 10000);
    }

    async refresh() {
        browser.refresh();
    }

    async goToUrl(URL) {
        browser.driver.get(URL);
    }
}
