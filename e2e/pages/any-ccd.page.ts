import { $, browser, ExpectedConditions } from 'protractor';
import { AnyPage } from './any.page';
import { Wait } from '../enums/wait';

export class AnyCcdPage extends AnyPage {

    private signOutLink = $('#sign-out');

    async isLoaded() {

        return (await browser.driver.getCurrentUrl()).includes('ccd')
            && (await ExpectedConditions.visibilityOf(this.signOutLink)());
    }

    async waitUntilLoaded() {

        await browser.waitForAngular();
        await browser.driver.wait(
            ExpectedConditions.visibilityOf(this.signOutLink),
            Wait.normal,
            'CCD page did not load in time'
        );
    }
}
