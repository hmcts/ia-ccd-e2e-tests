/* tslint:disable:no-trailing-whitespace */
import { Wait } from '../enums/wait';
import { browser, by, element, By } from 'protractor';

const iaConfig = require('../ia.conf');
const ccdUrl = iaConfig.CcdWebUrl;

export class NoticeOfChangePage {

    private noticeOfChangeCaseId: string;
    private latestCaseId: string;

    constructor() {
    }

    async selectLastCaseCheckbox(shortWait = false) {
        const checkboxPath = '//input[@class=\'govuk-checkboxes__input\']';

        try {
            await browser.wait(
                async () => {
                    return (await element
                        .all(by.xpath(checkboxPath))
                        .filter(e => e.isPresent())
                        .count()) > 0;
                },
                shortWait ? Wait.minimal : Wait.normal
            );
        } catch (error) {
            throw Error('Case list did not load in time...')
        }

        const lastCase = await element
            .all(by.className('govuk-checkboxes__input'))
            .last();

        await lastCase.click();
    }

    async getNoticeOfChangeCaseId(shortWait = false) {
        const caseIdPath = '//*[@id=\'case-id\']';

        try {
            await browser.wait(
                async () => {
                    return (await element
                        .all(by.xpath(caseIdPath))
                        .filter(e => e.isPresent())
                        .count()) > 0;
                },
                shortWait ? Wait.minimal : Wait.normal
            );
        } catch (error) {
            throw Error('Case id not found...')
        }

        const caseId = await element
            .all(by.id('case-id'))
            .last()
            .getText();

        this.noticeOfChangeCaseId = caseId;
        console.log('\n\tNotice of change case id : ' + caseId + '\n')
    }

    async enterCaseId(shortWait = false) {
        browser.driver
            .findElement(By.xpath('//*[@id=\'caseRef\']'))
            .sendKeys(this.noticeOfChangeCaseId);
    }

    async enterFirstName(shortWait = false) {
        browser.driver
            .findElement(By.xpath('//*[@id=\'NoCChallengeQ1\']'))
            .sendKeys(`José`);
    }

    async enterIncorrectFirstName(shortWait = false) {
        browser.driver
            .findElement(By.xpath('//*[@id=\'NoCChallengeQ1\']'))
            .sendKeys(`Jo`);
    }

    async enterLastName(shortWait = false) {
        browser.driver
            .findElement(By.xpath('//*[@id=\'NoCChallengeQ2\']'))
            .sendKeys('González');
    }

    async enterIncorrectLastName(shortWait = false) {
        browser.driver
            .findElement(By.xpath('//*[@id=\'NoCChallengeQ2\']'))
            .sendKeys(`Gonz`);
    }

    async checkAffirmationCheckbox(shortWait = false) {
        const affirmationIdPath = '//*[@id=\'affirmation\']';

        try {
            await browser.wait(
                async () => {
                    return (await element
                        .all(by.xpath(affirmationIdPath))
                        .filter(e => e.isPresent())
                        .count()) > 0;
                },
                shortWait ? Wait.minimal : Wait.normal
            );
        } catch (error) {
            throw Error('affirmation checkbox not found...')
        }

        browser.driver
            .findElement(By.xpath('//*[@id="affirmation"]'))
            .click()
    }

    async checkNotifyEveryPartyCheckbox(shortWait = false) {
        const notifyEveryPartyIdPath = '//*[@id=\'notifyEveryParty\']';

        try {
            await browser.wait(
                async () => {
                    return (await element
                        .all(by.xpath(notifyEveryPartyIdPath))
                        .filter(e => e.isPresent())
                        .count()) > 0;
                },
                shortWait ? Wait.minimal : Wait.normal
            );
        } catch (error) {
            throw Error('notifyEveryParty checkbox not found...')
        }

        browser.driver
            .findElement(By.xpath('//*[@id="notifyEveryParty"]'))
            .click()
    }

    async getLatestCaseId(shortWait = false) {
        const caseIdPath = '//*[@id=\'case-id\']';

        try {
            await browser.wait(
                async () => {
                    return (await element
                        .all(by.xpath(caseIdPath))
                        .filter(e => e.isPresent())
                        .count()) > 0;
                },
                shortWait ? Wait.minimal : Wait.normal
            );
        } catch (error) {
            throw Error('Case id not found...')
        }

        const caseId = await element
            .all(by.id('case-id'))
            .last()
            .getText();

        this.latestCaseId = caseId;
        console.log('\n\tLatest case id : ' + this.latestCaseId + '\n')
    }

    async goToLatestCase(shortWait = false) {
        browser.driver.get(`${ccdUrl}/cases/case-details/` + this.noticeOfChangeCaseId);
    }

    async checkLatestCaseIdIsNotTheSame(shortWait = false) {
        if (this.latestCaseId !== this.noticeOfChangeCaseId) {
            return
        } else {
            throw Error('latestCaseId and noticeOfChangeCaseId are the same...')
        }
    }
}
