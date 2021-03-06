import { CcdPage } from '../pages/ccd.page';
import { CcdFormPage } from '../pages/ccd-form.page';

export class SubmitAppealFlow {

    private ccdPage = new CcdPage();
    private ccdFormPage = new CcdFormPage();

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

    async completeCheckYourAnswers(clickContinue = false) {

        if (clickContinue) {
            await this.ccdPage.click('Submit');
        }
    }

    async submitAppeal(clickContinue = false) {

        await this.ccdPage.selectNextStep('Submit your appeal');
        await this.ccdPage.click('Go');

        await this.completeDeclaration(true);
        await this.completeCheckYourAnswers(true);

        if (clickContinue) {
            await this.ccdPage.click('Close and Return to case details');
        }
    }

    async submitLateAppeal(clickContinue = false) {

        await this.ccdPage.selectNextStep('Submit your appeal');
        await this.ccdPage.click('Go');

        await this.ccdFormPage.setFieldValue(
            'You can upload a document or fill out the box below. (Optional)',
            'I was on holiday',
            'text area'
        );
        if (clickContinue) {
            await this.ccdPage.click('Continue');
        }
        await this.completeDeclaration(true);
        await this.completeCheckYourAnswers(true);

        if (clickContinue) {
            await this.ccdPage.click('Close and Return to case details');
        }
    }
}
