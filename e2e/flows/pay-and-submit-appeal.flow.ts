import { CcdPage } from '../pages/ccd.page';

export class PayAndSubmitAppealFlow {

    private ccdPage = new CcdPage();

    async completeDeclaration(clickContinue = false) {
        await this.ccdPage.headingContains('Submit your appeal');

        await this.ccdPage.click(
            'I the representative am giving notice of appeal in accordance with the appellant\'s instructions ' +
            'and the appellant has confirmed to me they believe that the facts stated in this appeal form are true.'
        );

        if (clickContinue) {
            await this.ccdPage.click('Continue');
        }
    }

    async paymentByAccountSelection(clickContinue = false) {
        await this.ccdPage.headingContains('Pay and submit');

        await this.ccdPage.doesDropdownHaveValues('PBA0087535');
        if (clickContinue) {
            await this.ccdPage.click('Continue');
        }
    }

    async completeCheckYourAnswers(clickContinue = false) {

        if (clickContinue) {
            await this.ccdPage.click('Pay and submit now');
        }
    }

    async payAndsubmitAppeal(clickContinue = false) {

        await this.ccdPage.selectNextStep('Pay and submit');
        await this.ccdPage.click('Go');

        await this.paymentByAccountSelection(true);
        await this.completeDeclaration(true);
        await this.completeCheckYourAnswers(true);

        if (clickContinue) {
            await this.ccdPage.click('Close and Return to case details');
        }
    }
}
