import { browser, by, element } from 'protractor';
import { CcdFormPage } from '../pages/ccd-form.page';

export class UploadRespondentEvidenceFlow {
  private ccdFormPage = new CcdFormPage();

  async uploadRespondentEvidence(clickContinue = false) {
    await this.ccdFormPage.selectNextStep('Upload respondent evidence');

    await this.ccdFormPage.addCollectionItem('Upload case documents');
    // await this.ccdFormPage.setFieldValue('Document', '{@RespondentEvidence.pdf}', 'document', 'first', 'Upload case documents', 'first');
    await this.ccdFormPage.uploadFile('RespondentEvidence.pdf');
    await this.ccdFormPage.setFieldValue('Describe the document', 'This is the respondent evidence', 'text area', 'first', 'Upload case documents', 'first');

    await this.ccdFormPage.click('Continue');
    await browser.sleep(1000);
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('Upload');

    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }

  // Use this to upload the document by Home Office user
  async uploadHomeOfficeBundle(clickContinue = false) {
    await this.ccdFormPage.selectNextStep('Upload Home Office bundle');

    await this.ccdFormPage.addCollectionItem('Upload Home Office bundle');
    await this.ccdFormPage.setFieldValue('Upload a file', '{@RespondentEvidence.pdf}', 'document', 'first', 'Upload Home Office bundle', 'first');
    await this.ccdFormPage.setFieldValue('Describe the document', 'This is the Home Office Bundle', 'text area', 'first', 'Upload Home Office bundle', 'first');

    await this.ccdFormPage.click('Continue');
    const currentUrl = await this.ccdFormPage.getCurrentUrl();
    await this.ccdFormPage.click('Upload');

    if (clickContinue) {
      await this.ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
    }
  }

  async verifyDefaultTextInTextArea() {
    const cssPath = '#sendDirectionExplanation';
    const textArea = element(by.css(cssPath));
    const actualText = await textArea.getText();
    expect(actualText).toContain('A notice of appeal has been lodged against this decision.');
    expect(actualText).toContain('By the date indicated below the respondent is directed to supply the documents:');
    expect(actualText).toContain('The bundle must comply with (i) Rule 23 or Rule 24 of the Tribunal Procedure Rules 2014 (as applicable) and (ii) Practice Direction (1.11.2024) Part 3, sections 7.1 - 7.4. Specifically, the bundle must contain:');
    expect(actualText).toContain('- the notice of decision appealed against.');
    expect(actualText).toContain('- any other document provided to the appellant giving reasons for that decision.');
    expect(actualText).toContain('- any evidence or material relevant to the disputed issues.');
    expect(actualText).toContain('- any statements of evidence.');
    expect(actualText).toContain('- the application form.');
    expect(actualText).toContain('- any record of interview with the appellant in relation to the decision being appealed.');
    expect(actualText).toContain('- any previous decision(s) of the Tribunal and Upper Tribunal (IAC) relating to the appellant.');
    expect(actualText).toContain('- any other unpublished documents on which you rely.');
    expect(actualText).toContain('- the notice of any other appealable decision made in relation to the appellant.');
    expect(actualText).toContain('Where the appeal involves deportation, you must also include the following evidence:');
    expect(actualText).toContain('- a copy of the Certificate of Conviction.');
    expect(actualText).toContain('- a copy of any indictment/charge.');
    expect(actualText).toContain('- a transcript of the Sentencing Judge\'s Remarks.');
    expect(actualText).toContain('- a copy of any Pre-Sentence Report.');
    expect(actualText).toContain('- a copy of the appellant\'s criminal record.');
    expect(actualText).toContain('- a copy of any Parole Report or other document relating to the appellant\'s period in custody and/or release.');
    expect(actualText).toContain('- a copy of any mental health report.');
    expect(actualText).toContain('Parties must ensure they conduct proceedings with procedural rigour. The Tribunal will not overlook breaches of the requirements of the Procedure Rules, Practice Statement or Practice Direction, nor failures to comply with directions issued by the Tribunal. Parties are reminded of the sanctions for non-compliance set out in paragraph 5.3 of the Practice Direction of 01.11.24.');
  }
}
