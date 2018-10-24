import { $$, browser } from 'protractor';

export class AnyPage {

    private pageHeadings = $$('h1,h2');

    async get(uri: string) {
        await browser.get(uri);
    }

    async getWithoutWaitingForAngular(uri: string) {
        await browser.waitForAngularEnabled(false);
        await this.get(uri);
    }

    async pageHeadingContains(match: string) {

        let foundMatchingHeading = false;
        await this.pageHeadings.each(async (pageHeading, _) => {
            if (!foundMatchingHeading) {
                let headingText = (await pageHeading.getText());
                foundMatchingHeading = headingText.includes(match);
            }
        });

        return foundMatchingHeading;
    }
}
