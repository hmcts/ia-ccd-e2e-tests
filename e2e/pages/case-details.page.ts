import { $$, browser, by, element } from 'protractor';
import { AnyCcdPage } from './any-ccd.page';
import { Wait } from '../enums/wait';

export class CaseDetailsPage extends AnyCcdPage {

    async isFieldValueDisplayed(
        fieldLabel: string,
        fieldValue: string
    ) {
        try {

            if ($$('cut-tabs').isPresent()) {

                return await element(by.xpath(
                    '//div[normalize-space()="' + fieldLabel + '"]/../..' +
                    '//td[normalize-space()="' + fieldValue + '"]'
                )).isDisplayed();
            }

            return false;
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
}
