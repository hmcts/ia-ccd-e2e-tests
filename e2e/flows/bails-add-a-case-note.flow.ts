import { browser } from 'protractor';
import { CcdFormPage } from '../pages/ccd-form.page';

export class BailsAddCaseNoteFlow {

    private ccdFormPage = new CcdFormPage();

    async completeCaseNoteDetails(clickContinue = false, applicationNumber) {
        await this.ccdFormPage.runAccessbility();
        if (applicationNumber === '') {
            await this.ccdFormPage.setFieldValue('Subject', 'Case note subject');
            await this.ccdFormPage.setFieldValue('Case note', 'Case note text.');
            await this.ccdFormPage.setFieldValue('Upload a document (Optional)', '{@BailsCaseNote.pdf}');
        } else {
            await this.ccdFormPage.setFieldValue('Subject', 'Case note subject from application ' + applicationNumber);
            await this.ccdFormPage.setFieldValue('Case note', 'Case note text. This is from application ' + applicationNumber);
            await this.ccdFormPage.setFieldValue('Upload a document (Optional)', '{@BailsCaseNote.pdf}');
        }
        await browser.sleep(2000);
        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeCheckYourAnswers(clickContinue = false) {
        await this.ccdFormPage.runAccessbility();
        if (clickContinue) {
            await this.ccdFormPage.click('Add case note');
            await browser.sleep(5000)
        }
    }

    async addCaseNote(clickContinue = false, applicationNumber: string) {
        await this.ccdFormPage.selectNextStep('Add case note');
        let overviewUrl = await browser.getCurrentUrl();
        await this.ccdFormPage.flakeyClick('Go', overviewUrl)
        await this.completeCaseNoteDetails(true, applicationNumber);
        await this.completeCheckYourAnswers(true);
        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }
}
