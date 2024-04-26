import { $, $$ } from 'protractor';
import { CcdFormPage } from '../pages/ccd-form.page';

export class CaseListFlow {
  private ccdFormPage = new CcdFormPage();
  private caseListRows = $$('ccd-search-result>table>tbody>tr');
  private ccdCaseViewer = $('ccd-case-viewer');
  private BrowserWaits = require('../support/customWaits');

  async filterCasesByTodaysDate(clickApply = false) {
    await this.ccdFormPage.setFieldValue('Appeal start date', '{$TODAY}');

    if (clickApply) {
      await this.ccdFormPage.click('Apply');
    }
  }

  async filterCasesByPostcode(postcode, clickApply = false) {
    await this.ccdFormPage.setFieldValue('Post code', postcode);

    if (clickApply) {
      await this.ccdFormPage.click('Apply');
    }
  }

  async filterCasesByState(state, clickApply = false) {
    await this.ccdFormPage.setFieldValue('State', state);

    if (clickApply) {
      await this.ccdFormPage.click('Apply');
    }
  }

  async clickCaseLinkAtRow(rowNum) {
    let caseRow = await this.caseListRows.get(rowNum - 1);
    await caseRow.$('.search-result-column-cell a').click();
    await this.BrowserWaits.waitForElement(this.ccdCaseViewer, undefined, 'Case view page is not displayed');
  }
}
