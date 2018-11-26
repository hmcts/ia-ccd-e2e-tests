import { $$, by, element } from 'protractor';
import { AnyCcdPage } from './any-ccd.page';

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

        await element(by.xpath(
            '//select[@id="next-step"]/option[normalize-space()="' + nextStep + '"]'
        )).click();
    }
}
