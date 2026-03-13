import { $, $$, browser, by, element, ExpectedConditions } from 'protractor';
import { CcdFormPage } from '../pages/ccd-form.page';

export class CaseListFlow {
  private ccdFormPage = new CcdFormPage();
  private caseListRows = $$('ccd-search-result>table>tbody>tr');
  private ccdCaseViewer = $('ccd-case-viewer');
  private BrowserWaits = require('../support/customWaits');
  private readonly quickSearchInput = element(by.id('exuiCaseReferenceSearch'));
  private readonly quickSearchFindButton = element(by.xpath(
    "//*[@id='exuiCaseReferenceSearch']/ancestor::form//button[normalize-space()='Find'] | //button[normalize-space()='Find']"
  ));

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

  async searchForAppealAndOpen(caseReference: string) {
    const caseId = caseReference.match(/\d{16}/)?.[0];
    if (!caseId) {
      throw new Error(`Expected a 16-digit case reference but got: ${caseReference}`);
    }
    await browser.wait(ExpectedConditions.visibilityOf(this.quickSearchInput), 30000);
    await this.quickSearchInput.clear();
    await this.quickSearchInput.sendKeys(caseId);
    await this.quickSearchFindButton.click();
    await this.ccdFormPage.waitForSpinner();

    try {
      await this.ccdFormPage.waitForCssElementVisible('#next-step');
    } catch {
      await this.clickCaseLinkAtRow(1);
    }
  }

}
