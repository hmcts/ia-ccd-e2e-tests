import { CcdFormPage } from '../pages/ccd-form.page';
import { browser } from 'protractor';

const isSaveAndContinueEnabled = require('../ia.conf').isSaveAndContinueEnabled === 'true';

export class BuildCaseFlow {

    private ccdFormPage = new CcdFormPage();

    async buildCase(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Build your case');
        let overviewUrl = await browser.getCurrentUrl();
        await this.ccdFormPage.flakeyClick('Go', overviewUrl)

        await this.ccdFormPage.setFieldValue(
            'Appeal skeleton argument',
            '{@CaseArgument.pdf}',
            'document'
        );

        await this.ccdFormPage.setFieldValue(
            'Describe the document (Optional)',
            'This is the case argument',
            'text area'
        );

        await this.ccdFormPage.addCollectionItem('Evidence (Optional)');

        await this.ccdFormPage.setFieldValue(
            'Document (Optional)',
            '{@CaseArgumentEvidence.pdf}',
            'document',
            'first',
            'Evidence (Optional)',
            'first'
        );

        await this.ccdFormPage.setFieldValue(
            'Describe the document (Optional)',
            'The is the case argument evidence',
            'text area',
            'first',
            'Evidence (Optional)',
            'first'
        );
        await this.ccdFormPage.click('Continue');
        let buttonName = 'Submit Case';
        if (isSaveAndContinueEnabled) {
          buttonName = 'Upload';
        }
        await this.ccdFormPage.click(buttonName);
        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }
}
