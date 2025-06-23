import { CcdFormPage } from '../pages/ccd-form.page';

export class BailsAddCaseNoteFlow {
  private ccdFormPage = new CcdFormPage();

  async completeCaseNoteDetails(clickContinue = false, applicationNumber) {
    await this.ccdFormPage.runAccessbility();
    if (applicationNumber === '') {
      await this.ccdFormPage.setFieldValue('Subject', 'Case note subject');
      await this.ccdFormPage.setFieldValue('Case note', 'Case note text.');
      await this.ccdFormPage.setFieldValue('Upload a document (Optional)', '{@BailsCaseNote.pdf}', 'document');
    } else {
      await this.ccdFormPage.setFieldValue('Subject', 'Case note subject from application ' + applicationNumber);
      await this.ccdFormPage.setFieldValue('Case note', 'Case note text. This is from application ' + applicationNumber);
      await this.ccdFormPage.setFieldValue('Upload a document (Optional)', '{@BailsCaseNote.pdf}', 'document');
    }
    if (clickContinue) {
      try {
        await this.ccdFormPage.click('Continue');
      } catch {
        await this.ccdFormPage.click('Continue');

      }
    }
  }

  async completeCheckYourAnswers(clickContinue = false) {
    await this.ccdFormPage.runAccessbility();
    if (clickContinue) {
      await this.ccdFormPage.click('Add case note');
    }
  }

  async addCaseNote(clickContinue = false, applicationNumber: string) {
    await this.ccdFormPage.selectNextStep('Add case note');
    await this.completeCaseNoteDetails(true, applicationNumber);
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.completeCheckYourAnswers(true);
    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }
}
