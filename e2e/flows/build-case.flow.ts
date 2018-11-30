import { CcdFormPage } from '../pages/ccd-form.page';

export class BuildCaseFlow {

    private ccdFormPage = new CcdFormPage();

    async buildCase(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Build your case');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.setFieldValue(
            'Appeal skeleton argument',
            '{@CaseArgument.pdf}'
        );

        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Upload');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
            await this.ccdFormPage.waitUntilLoaded();
        }
    }
}
