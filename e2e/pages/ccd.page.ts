import { AnyPage } from './any.page';
import { Fields } from '../fields/fields';
import { ValueExpander } from '../helpers/value-expander';
import { $, browser, by, element, ExpectedConditions } from 'protractor';
import { Wait } from '../enums/wait';

export class CcdPage extends AnyPage {

    protected readonly fields = new Fields($('body'));
    protected readonly valueExpander = new ValueExpander();

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
            Wait.normal,
            'Next steps did not show in time'
        );

        await element(by.xpath(nextStepPath)).click();
    }

    async isFieldDisplayed(
        fieldLabel: string,
        collectionLabel?: string,
        collectionItemNumber?: string | number
    ) {
        const field = await this.fields.find(
            fieldLabel,
            collectionLabel,
            collectionItemNumber
        );

        return (!!field && await field.isDisplayed());
    }

    async isFieldValueDisplayed(
        fieldLabel: string,
        fieldMatch: string,
        isExactMatch = true,
        collectionLabel?: string,
        collectionItemNumber?: string | number
    ) {
        const field = await this.fields.find(
            fieldLabel,
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

    async isLoaded() {
        return (await browser.driver.getCurrentUrl()).includes('ccd')
            && (await ExpectedConditions.visibilityOf($('#sign-out'))());
    }

    async waitUntilLoaded() {
        await browser.waitForAngularEnabled(true);
        await browser.waitForAngular();
    }
}
