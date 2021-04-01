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

    async getLatestCaseIdFromUrl(shortWait = false) {
        let url = await browser.driver.getCurrentUrl();
        let startIndex = url.indexOf('case-details/')
        let endIndex = url.indexOf('/trigger')
        let caseId = url.substring(startIndex + 13, endIndex)

        this.noticeOfChangeCaseId = caseId;
        this.latestCaseId = caseId;
        console.log('\n\tcase id: ' + caseId + '\n');
    }

    async goToRemovedCase(shortWait = false) {
        browser.driver.get(`${ccdUrl}/cases/case-details/` + this.latestCaseId);
    }

    async setCaseRoleId(shortWait = false) {
        await element(by.id('changeOrganisationRequestField_CaseRoleId'))
            .$('[value=\'1: [LEGALREPRESENTATIVE]\']').click();
    }

    async checkLatestCaseIdIsNotTheSame(shortWait = false) {
        if (this.latestCaseId !== this.noticeOfChangeCaseId) {
            return
        } else {
            throw Error('latestCaseId and noticeOfChangeCaseId are the same...')
        }
    }
}
