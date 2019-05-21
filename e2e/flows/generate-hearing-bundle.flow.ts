import { CcdFormPage } from '../pages/ccd-form.page';

export class HearingBundleFlow {

    private ccdFormPage = new CcdFormPage();

    async generateHearingBundle(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Generate hearing ready bundle');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.headingContains('Generate hearing ready bundle');

        await this.ccdFormPage.click('Generate');

        await this.ccdFormPage.contentContains('has been updated with event: Generate hearing ready bundle');
    }
}
