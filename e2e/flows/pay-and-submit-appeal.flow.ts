import { CcdPage } from '../pages/ccd.page';
import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

export class PayAndSubmitAppealFlow {

    private ccdPage = new CcdPage();
    private ccdFormPage = new CcdFormPage();

    async payForAppealByPBA(clickContinue = false) {

        await this.ccdFormPage.click('pay for your appeal');
        await browser.sleep(5000);
        await this.ccdFormPage.click('Pay now');
        await browser.sleep(5000);
        await this.ccdFormPage.click('Pay fee using Payment by Account (PBA)');
        await browser.sleep(1000);
        await this.ccdFormPage.typeText('pbaAccountNumber', 'PBA0087535');
        await browser.sleep(1000);
        await this.ccdFormPage.typeText('pbaAccountRef', 'Unique Reference');
        await this.ccdFormPage.typeEnter('pbaAccountRef');
        await this.ccdFormPage.click('Confirm payment');

        if (clickContinue) {
            await this.ccdPage.click('View service requests');
        }
    }

    async payForAppealByCard(clickContinue = false) {

            await this.ccdFormPage.click('pay for your appeal');
            await browser.sleep(5000);
            await this.ccdFormPage.click('Pay now');
            await browser.sleep(5000);
            await this.ccdFormPage.click('Pay by credit or debit card');
            await this.ccdFormPage.click('Continue');
            await browser.sleep(1000);
            await this.ccdFormPage.typeText(`card-no`, `4444333322221111`);
            await this.ccdFormPage.typeText(`expiry-month`, `10`);
            await this.ccdFormPage.typeText(`expiry-year`, `24`);
            await this.ccdFormPage.typeText(`cardholder-name`, `Test User`);
            await this.ccdFormPage.typeText(`cvc`, `123`);
            await this.ccdFormPage.typeText(`address-line-1`, `123 Fake Street`);
            await this.ccdFormPage.typeText(`address-city`, `Fakeicester`);
            await this.ccdFormPage.typeText(`address-postcode`, `FE1 2EF`);
            await this.ccdFormPage.typeText(`email`, `test@test.com`);
            await this.ccdFormPage.click('Continue');
            await browser.sleep(5000);
            await this.ccdFormPage.click('Confirm payment');

            if (clickContinue) {
                await this.ccdPage.click('Return to service request');
            }
        }
}
