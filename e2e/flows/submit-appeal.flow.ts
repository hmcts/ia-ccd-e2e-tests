import { AnyCcdFormPage } from '../pages/any-ccd-form.page';
import { CaseDetailsPage } from '../pages/case-details.page';

export class SubmitAppealFlow {

    private anyCcdFormPage = new AnyCcdFormPage();
    private caseDetailsPage = new CaseDetailsPage();

    async completeDeclaration(clickContinue = false) {
        await this.anyCcdFormPage.pageHeadingContains('Submit your appeal');

        await this.anyCcdFormPage.click(
            'I the representative am giving notice of appeal in accordance with the appellant\'s instructions ' +
            'and the appellant has confirmed to me they believe that the facts stated in this appeal form are true.'
        );

        if (clickContinue) {
            await this.anyCcdFormPage.click('Continue');
        }
    }

    async submitAppeal() {
        await this.caseDetailsPage.selectNextStep('Submit your appeal');
        await this.caseDetailsPage.click('Go');

        await this.completeDeclaration(true);
        await this.anyCcdFormPage.click('Submit');

        await this.anyCcdFormPage.click('Close and Return to case details');
    }
}
