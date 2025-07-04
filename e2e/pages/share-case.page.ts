import { Wait } from '../enums/wait';
import { $, $$, browser, by, element, ElementArrayFinder, ElementFinder } from 'protractor';
import { CcdFormPage } from './ccd-form.page';

const BrowserWaits = require('../support/customWaits');
const ccdFormPage = new CcdFormPage();

export class ShareCasePage {
  private userEmailInput: any;
  private userFilterList: ElementArrayFinder;
  private shareCaseContainer: ElementFinder;
  private selectedCases: ElementArrayFinder;
  private addUserBtn: ElementFinder;
  private continueButton: ElementFinder;
  private caseIdToBeShared: string;
  private sharedCaseId: string;
  private appealReference: string;

  constructor() {
    this.shareCaseContainer = $('exui-case-share');
    this.selectedCases = $$('xuilib-selected-case-list xuilib-selected-case');
    this.userEmailInput = $('#add-user xuilib-user-select .govuk-input');
    this.userFilterList = $$('.mat-autocomplete-panel .mat-option-text');
    this.addUserBtn = $('#btn-add-user');
    this.continueButton = $('#share-case-nav button');
  }

  async selectLastCaseCheckbox(shortWait = false) {
    await browser.sleep(5000);
    const paginationElement = element.all(by.css('ccd-pagination pagination-template ul li'));
    await BrowserWaits.waitForelementToBeClickable(element(by.css('ccd-pagination pagination-template')));

    const pagination = await paginationElement.count();

    if (pagination > 4) {
      await paginationElement
        .get(pagination - 2)
        .element(by.tagName('a'))
        .click();
    }
    await browser.sleep(5000);
    const checkboxPath = "//input[@class='govuk-checkboxes__input']";

    try {
      await browser.wait(
        async () => {
          return (
            (await element
              .all(by.xpath(checkboxPath))
              .filter((e) => e.isPresent())
              .count()) > 0
          );
        },
        shortWait ? Wait.minimal : Wait.normal,
      );
    } catch (error) {
      throw Error('Case list did not load in time...');
    }

    const lastCase = await element.all(by.className('govuk-checkboxes__input')).last();

    await lastCase.click();
  }

  async selectFirstCaseCheckbox() {
    const checkboxPaths = '//input[@class="govuk-checkboxes__input"]';
    const checkBoxCount = await element.all(by.xpath(checkboxPaths)).count();
    if (checkBoxCount === 0) {
      throw Error('No cases found to share...');
    } else if (checkBoxCount > 2) {
      throw Error('Multiple cases found for HMCTS reference');
    }
    await element.all(by.xpath(checkboxPaths)).first().click();
  }

  async getCaseIdToBeShared(shortWait = false) {
    const caseIdPath = '//*[contains(@id,"case-id-")]';

    try {
      await browser.wait(
        async () => {
          return (
            (await element
              .all(by.xpath(caseIdPath))
              .filter((e) => e.isPresent())
              .count()) > 0
          );
        },
        shortWait ? Wait.minimal : Wait.normal,
      );
    } catch (error) {
      throw Error('Case id not found...');
    }

    const caseId = await element.all(by.xpath('//*[contains(@id,"case-id-")]')).last().getText();

    this.caseIdToBeShared = caseId;
    console.log('\n\tSharing case with id : ' + caseId + '\n');
  }

  async getSharedCaseId(shortWait = false) {
    const caseIdPath = '//*[contains(@id,"case-id-")]';

    try {
      await browser.wait(
        async () => {
          return (
            (await element
              .all(by.xpath(caseIdPath))
              .filter((e) => e.isPresent())
              .count()) > 0
          );
        },
        shortWait ? Wait.minimal : Wait.normal,
      );
    } catch (error) {
      throw Error('Case id not found...');
    }

    const caseId = await element.all(by.xpath('//*[contains(@id,"case-id-")]')).last().getText();

    this.sharedCaseId = caseId;
    console.log('\n\tShared case has id : ' + caseId + '\n');
  }

  async checkSharedCaseIdIsTheSame(shortWait = false) {
    if (this.caseIdToBeShared === this.sharedCaseId) {
      return;
    } else {
      throw Error('caseIdToBeShared and sharedCaseId are different...');
    }
  }

  async enterUserEmailToSelect(emailText) {
    return await this.userEmailInput.sendKeys(emailText);
  }

  async getFilteredUserEmails() {
    let userEmails = [];
    let usernameEmails = await this.getFilteredUserNameEmails();
    for (let userCounter = 0; userCounter < usernameEmails.length; userCounter++) {
      let usernameEmailText = usernameEmails[userCounter];
      let userEmail = usernameEmailText.split('-')[1].trim();
      userEmails.push(userEmail);
    }
    return userEmails;
  }

  async getFilteredUserNameEmails() {
    let userNameEmails = [];
    let usersCount = await this.getFilteredUsersCount();
    for (let userCounter = 0; userCounter < usersCount; userCounter++) {
      let user = await this.userFilterList.get(userCounter);
      let usernameEmailText = await user.getText();
      userNameEmails.push(usernameEmailText);
    }
    return userNameEmails;
  }

  async getFilteredUsersCount() {
    await BrowserWaits.waitForSeconds(2);
    return await this.userFilterList.count();
  }

  async selectUserWithEmailNotSharedWithAtLeastOneCase() {
    let useremails = await this.getFilteredUserEmails();
    let userToSelect = 0;
    let email = '';
    for (let i = 0; i < useremails.length; i++) {
      email = useremails[i];
      let caseNum = await this.isUserWithEmailNotSharedWithAtleastOneCase(email);
      if (caseNum > 0) {
        userToSelect = i + 1;
        break;
      }
    }
    if (userToSelect > 0) {
      await this.selectUserFromFilteredList(userToSelect);
    } else {
      throw Error('All users shared with all selected cases. Cannot proceed to select a user not shared with at least one case');
    }
  }

  async isUserWithEmailNotSharedWithAtleastOneCase(email) {
    let totalCases = await this.casesCount();
    for (let i = 1; i <= totalCases; i++) {
      if (!(await this.isUserWithEmailListedInCase(i, email))) {
        return i;
      }
    }
    return 0;
  }

  async isUserWithEmailListedInCase(caseNum, email) {
    let userRow = await this.getUserRowInCase(caseNum, email);
    return userRow !== null;
  }

  async getUserRowInCase(caseNum, email) {
    let selectedCase = await this.selectedCases.get(caseNum - 1);
    let users = selectedCase.$$('tbody tr');
    let userCount = await users.count();
    for (let user = 0; user < userCount; user++) {
      let userRow = await users.get(user);

      let userEmail = await browser.executeScript('return arguments[0].textContent', userRow.$('td:nth-of-type(2)'));

      if (userEmail === email) {
        return userRow;
      }
    }
    return null;
  }

  async selectUserFromFilteredList(userNum) {
    let userToSelect = await this.userFilterList.get(userNum - 1);
    await userToSelect.click();
  }

  async casesCount() {
    await this.waitForPageToLoad();
    return await this.selectedCases.count();
  }

  async waitForPageToLoad() {
    await BrowserWaits.waitForElement(this.shareCaseContainer);
    await BrowserWaits.waitForCondition(async () => {
      return (await this.selectedCases.count()) > 0;
    });
    await browser.sleep(2000);
  }

  async clickAddUserbutton() {
    await this.addUserBtn.click();
  }

  async clickContinueButton() {
    await this.continueButton.click();
  }

  async getAppealReference() {
    let appealReferenceTitle = await element.all(by.xpath('(//h1)[1]')).getText();
    this.appealReference = appealReferenceTitle.toString().substring(16, 30);
    console.log('\n\tCase has reference : ' + this.appealReference + '\n');
  }

  async filterByAppealReference() {
    const jurisdictionPath = '//select[@id="wb-jurisdiction"]' + '/option[normalize-space()="Immigration & Asylum"]';
    await ccdFormPage.waitForXpathElementVisible(jurisdictionPath);
    await element(by.xpath(jurisdictionPath)).click();
    await element(by.xpath('//option[contains(text(), "Appeal*")]')).click();
    const appealRefPath = '//*[@id="appealReferenceNumber"]';
    try {
      await ccdFormPage.waitForXpathElementVisible(appealRefPath);
    } catch {
      await element(by.xpath('//button[@title="Reset filter"]')).click();
      await ccdFormPage.waitForXpathElementVisible(appealRefPath);
      await ccdFormPage.waitForSpinner();
    }
    const appealRefField = element(by.xpath(appealRefPath));
    await appealRefField.clear();
    await appealRefField.sendKeys(this.appealReference);
    await ccdFormPage.waitForSpinner();
    await element(by.xpath("//button[@title='Apply filter']")).click();
    await ccdFormPage.waitForSpinner();
  }
}
