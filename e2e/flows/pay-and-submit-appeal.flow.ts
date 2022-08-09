import { CcdPage } from '../pages/ccd.page';
import { browser } from 'protractor';

export class PayAndSubmitAppealFlow {

    private ccdPage = new CcdPage();

    async payForAppealByPBA(clickContinue = false) {

        await this.ccdFormPage.click('pay for your appeal');
        await browser.sleep(5000);
        await this.ccdFormPage.click('Pay now');
        await browser.sleep(5000);
        await this.ccdFormPage.click('Pay fee using Payment by Account (PBA)');
        await this.ccdFormPage.setFieldValue('Select a PBA', 'PBA0087535');
        await this.ccdFormPage.setFieldValue('Enter a reference for your PBA account statements', 'Unique Reference');
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
            await this.ccdFormPage.setFieldValue('Card number', 'PBA0087535');
            await this.ccdFormPage.setFieldValue('Month', '10');
            await this.ccdFormPage.setFieldValue('Year', '23');
            await this.ccdFormPage.setFieldValue('Name on card', 'Test User');
            await this.ccdFormPage.setFieldValue('Card security code', '123');
            await this.ccdFormPage.setFieldValue('Building number or name and street', '123 Fake Street');
            await this.ccdFormPage.setFieldValue('Town or city', 'Fakeicester');
            await this.ccdFormPage.setFieldValue('Postcode', 'FE1 2EF');
            await this.ccdFormPage.setFieldValue('Email', 'test@test.com');
            await this.ccdFormPage.click('Continue');
            await browser.sleep(5000);
            await this.ccdFormPage.click('Confirm payment');

            if (clickContinue) {
                await this.ccdPage.click('Return to service request');
            }
        }
}
