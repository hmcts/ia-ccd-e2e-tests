import { browser } from 'protractor';

export class AnyPage {

    async get(uri: string) {
        await browser.waitForAngularEnabled(true);
        await browser.get(uri);
    }

    async getWithoutWaitingForAngular(uri: string) {
        await browser.waitForAngularEnabled(false);
        await browser.get(uri);
    }
}
