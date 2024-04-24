import { AnyPage } from './any.page';
import { Fields } from '../fields/fields';
import { Wait } from '../enums/wait';
import { $, browser, by, element, ExpectedConditions } from 'protractor';
import { expect } from 'chai';

export class CcdPage extends AnyPage {

    protected readonly fields = new Fields($('body'));

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

    async clickLinkText(linkText: string) {
        const expandedLinkText = await this.valueExpander.expand(linkText);
        element(by.xpath('//a[normalize-space()="' + expandedLinkText + '"]'))
            .click();
    }

    async selectNextStep(nextStep: string) {

        const nextStepPath =
            '//select[@id="next-step"]' +
            '/option[normalize-space()="' + nextStep + '"]';

        await browser.wait(
            async () => {
                return await element
                    .all(by.xpath(nextStepPath))
                    .isPresent();
            },
            Wait.long,
            'Next steps did not show in time'
        );

        await element(by.xpath(nextStepPath)).click();
    }

    async isFieldDisplayed(
        fieldLabel: string,
        instanceNumber?: string | number,
        collectionLabel?: string,
        collectionItemNumber?: string | number
    ) {
        const field = await this.fields.find(
            '',
            fieldLabel,
            instanceNumber,
            collectionLabel,
            collectionItemNumber
        );

        return (!!field && await field.isDisplayed());
    }

    async isFieldValueDisplayed(
        fieldLabel: string,
        fieldMatch: string,
        isExactMatch = true,
        instanceNumber?: string | number,
        collectionLabel?: string,
        collectionItemNumber?: string | number
    ) {
        const field = await this.fields.find(
            '',
            fieldLabel,
            instanceNumber,
            collectionLabel,
            collectionItemNumber
        );

        if (!!field && await field.isDisplayed()) {

            const expandedFieldMatch = await this.valueExpander.expand(fieldMatch);
            const fieldValue = await field.getValue();

            if (isExactMatch) {
                return fieldValue === expandedFieldMatch;
            } else {
                return fieldValue.includes(expandedFieldMatch);
            }
        }

        return false;
    }

    async isFieldValueCorrectLength(
        fieldLabel: string,
        fieldValueLength: number,
        instanceNumber?: string | number,
        collectionLabel?: string,
        collectionItemNumber?: string | number
    ) {
        const field = await this.fields.find(
            '',
            fieldLabel,
            instanceNumber,
            collectionLabel,
            collectionItemNumber
        );

        if (!!field && await field.isDisplayed()) {

            const fieldValue = await field.getValue();
            return fieldValue.length === fieldValueLength;
        }

        return false;
    }

    async isLoaded() {
        return (await browser.driver.getCurrentUrl()).includes('ccd')
            && (await ExpectedConditions.visibilityOf($('#sign-out'))());
    }

    async overViewContains(match: string) {
        try {
            return await element(by.xpath('//*' + '[text()[normalize-space()="' + match + '"]]'))
                .isDisplayed();

        } catch (error) {
            return false;
        }
    }

    async acceptCookies() {
      try {
        await element(by.css('button[value=\'accept\']')).click();
      } catch { }
    }

    async hideErrorMessages() {
      while (true) {
        try {
          await element(by.xpath('//a[text()=\'Hide message\']')).click();
        } catch {
          break;
        }
      }
    }

    async waitForConfirmationScreen(previousUrl: string) {
        await this.waitForPageNavigation(previousUrl);
        expect(await browser.getCurrentUrl()).to.contain('confirm');
        await this.waitForCssElementVisible('#confirmation-header');
    }

    async waitForCssElementVisible(locator: string) {
        await browser.wait(async () => {
            return expect(await element(by.css(locator)).isPresent());
        }, 30000, `Expected element ${locator} to be present within 30 seconds`);
        expect(await element(by.css(locator)).isPresent()).to.equal(true);
    }

    async waitForOverviewPage() {
        await this.waitForCssElementVisible('#next-step');
        await browser.wait(async () => {
            return expect(await element(by.css('#next-step')).isEnabled());
        }, 15000, 'Expected element #next-step to be enabled within 15 seconds');
        expect(await element(by.css('#next-step')).isEnabled()).to.equal(true);
        await this.waitForCssElementVisible('#case-viewer-field-read--caseDetailsTitle');
    }

    async flakeyClick(clickText: string, currentUrl: string) {
        for (let i = 0; i < 3; i++) {
            try {
                await this.click(clickText);
                await this.waitForPageNavigation(currentUrl)
                break;
            } catch {
                if (i < 2) {
                    console.log(`Click attempt ${i + 1} failed. Trying again.`)
                } else {
                    throw 'All click attempts failed. Giving up.';
                }
            }
        }
    }
}
