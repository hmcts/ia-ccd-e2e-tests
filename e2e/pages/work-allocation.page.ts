import { $, $$, ElementArrayFinder } from 'protractor';

const BrowserWaits = require('../support/customWaits');

export class WorkAllocationPage {
  private findPersonEmailInput: any;
  private exclusionTextArea: any;
  private userFilterList: ElementArrayFinder;

  constructor() {
    this.findPersonEmailInput = $('xuilib-find-person #inputSelectPerson');
    this.exclusionTextArea = $('exui-describe-exclusion #exclusion-description');
    this.userFilterList = $$('.mat-autocomplete-panel .mat-option-text');

  }

  async enterAllocateUserEmailInput(text: string) {
    return await this.findPersonEmailInput.sendKeys(text);
  }

  async getFilteredUsersCount() {
    await BrowserWaits.waitForSeconds(2);
    return await this.userFilterList.count();
  }

  async selectUser() {
    let usersCount = await this.getFilteredUsersCount();
    if (usersCount) {
      await this.userFilterList.get(0).click();
    }
  }

  async addExclusionReason(reason: string) {
    return await this.exclusionTextArea.sendKeys(reason);
  }

}
