import { Wait } from '../enums/wait';
import { browser, by, element, By } from 'protractor';

const iaConfig = require('../ia.conf');

const ccdUrl = iaConfig.CcdWebUrl;

export class NoticeOfChangePage {
  private noticeOfChangeCaseId: string;
  private latestCaseId: string;

  constructor() {
    // noop
  }

  async enterCaseId(shortWait = false) {
    browser.driver.findElement(By.xpath("//*[@id='caseRef']")).sendKeys(this.noticeOfChangeCaseId);
  }

  async filterBailsByCaseId(shortWait = false) {
    browser.driver.findElement(By.xpath("//*[@id='bailReferenceNumber']")).sendKeys(this.noticeOfChangeCaseId);
  }

  async enterFirstName(shortWait = false) {
    browser.driver.findElement(By.xpath("//*[@id='NoCChallengeQ1']")).sendKeys(`José`);
  }

  async enterIncorrectFirstName(shortWait = false) {
    browser.driver.findElement(By.xpath("//*[@id='NoCChallengeQ1']")).sendKeys(`Jo`);
  }

  async enterLastName(shortWait = false) {
    browser.driver.findElement(By.xpath("//*[@id='NoCChallengeQ2']")).sendKeys('González');
  }

  async enterIncorrectLastName(shortWait = false) {
    browser.driver.findElement(By.xpath("//*[@id='NoCChallengeQ2']")).sendKeys(`Gonz`);
  }

  async checkAffirmationCheckbox(shortWait = false) {
    const affirmationIdPath = "//*[@id='affirmation']";

    try {
      await browser.wait(
        async() => (
          (await element
            .all(by.xpath(affirmationIdPath))
            .filter(e => e.isPresent())
            .count()) > 0
        ),
        shortWait ? Wait.minimal : Wait.normal
      );
    } catch (error) {
      throw Error('affirmation checkbox not found...');
    }

    browser.driver.findElement(By.xpath('//*[@id="affirmation"]')).click();
  }

  async checkNotifyEveryPartyCheckbox(shortWait = false) {
    const notifyEveryPartyIdPath = "//*[@id='notifyEveryParty']";

    try {
      await browser.wait(
        async() => (
          (await element
            .all(by.xpath(notifyEveryPartyIdPath))
            .filter(e => e.isPresent())
            .count()) > 0
        ),
        shortWait ? Wait.minimal : Wait.normal
      );
    } catch (error) {
      throw Error('notifyEveryParty checkbox not found...');
    }

    browser.driver.findElement(By.xpath('//*[@id="notifyEveryParty"]')).click();
  }

  async getLatestCaseIdFromUrl() {
    const caseUrlMatcher = /\d{16}/g;
    const currentUrl = await browser.driver.getCurrentUrl();
    const caseIdIndex = currentUrl.search(caseUrlMatcher);
    const caseId = currentUrl.substring(caseIdIndex, caseIdIndex + 16);

    this.noticeOfChangeCaseId = caseId;
    this.latestCaseId = caseId;
    console.log(`\n\tcase id: ${caseId}\n`);
  }

  async goToRemovedCase(shortWait = false) {
    browser.driver.get(`${ccdUrl}/cases/case-details/${this.latestCaseId}`);
  }

  async checkCaseRemoved(shortWait = false) {
    await browser.wait(
      async() => {
        const url = await browser.getCurrentUrl();
        return url === `${ccdUrl}/search/noresults`;
      },
      60000,
      'User was not redirected to the case list.'
    );
  }

  async setCaseRoleId(shortWait = false) {
    await element(by.id('changeOrganisationRequestField_CaseRoleId')).$("[value='1: [LEGALREPRESENTATIVE]']")
      .click();
  }

  async enterBailsFirstName(shortWait = false) {
    browser.driver.findElement(By.xpath("//*[@id='NoCChallengeQ1']")).sendKeys(`Harri`);
  }

  async enterBailsIncorrectFirstName(shortWait = false) {
    browser.driver.findElement(By.xpath("//*[@id='NoCChallengeQ1']")).sendKeys(`Harry`);
  }

  async enterBailsLastName(shortWait = false) {
    browser.driver.findElement(By.xpath("//*[@id='NoCChallengeQ2']")).sendKeys(`Pugh`);
  }

  async enterBailsIncorrectLastName(shortWait = false) {
    browser.driver.findElement(By.xpath("//*[@id='NoCChallengeQ2']")).sendKeys(`Pughes`);
  }

  async enterBailsDateOfBirth() {
    await element(by.css('.form-group-day > input')).sendKeys(`31`);
    await element(by.css('.form-group-month > input')).sendKeys(`12`);
    await element(by.css('.form-group-year > input')).sendKeys(`1999`);
  }

  async enterBailsIncorrectDateOfBirth() {
    await element(by.css('.form-group-day > input')).sendKeys(`10`);
    await element(by.css('.form-group-month > input')).sendKeys(`02`);
    await element(by.css('.form-group-year > input')).sendKeys(`1999`);
  }
}
