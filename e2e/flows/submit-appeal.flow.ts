import { CcdFormPage } from '../pages/ccd-form.page';

export class SubmitAppealFlow {

    private ccdFormPage = new CcdFormPage();

    async completeDeclaration(clickContinue = false) {
        await this.ccdFormPage.headingContains('Submit your appeal');

        await this.ccdFormPage.click(
            'I the representative am giving notice of appeal in accordance with the appellant\'s instructions ' +
            'and the appellant has confirmed to me they believe that the facts stated in this appeal form are true.'
        );

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeCheckYourAnswers(clickContinue = false) {

        if (clickContinue) {
            await this.ccdFormPage.click('Submit');
        }
    }

    async submitAppeal(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Submit your appeal');
        await this.ccdFormPage.click('Go');

        await this.completeFeePayment(true);
        await this.completeDeclaration(true);
        await this.completeCheckYourAnswers(true);

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }

    async completeFeePayment(clickContinue = false) {
        await this.ccdFormPage.headingContains('Submit your appeal');

        await this.ccdFormPage.setFieldValue('When do you intend to pay for this appeal?',
            'Submit the appeal now and pay within 14 days'
        );

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

}
