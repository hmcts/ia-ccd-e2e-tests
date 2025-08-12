import { AnyPage } from "./any.page";
import { Fields } from "../fields/fields";
import { $, ActionSequence, browser, By, by, element, ExpectedConditions } from "protractor";
import { expect } from "chai";
import { eventMappings } from "../enums/eventMappings";

const iaConfig = require("../ia.conf");

let caseUrl = "";

export class CcdPage extends AnyPage {
  protected readonly fields = new Fields($("body"));

  async alertContains(match: string) {
    await browser.wait(ExpectedConditions.visibilityOf($("div.alert-message")));
    return (await $("div.alert-message").getText()).includes(match);
  }

  async notificationContains(match: string) {
    await browser.wait(ExpectedConditions.visibilityOf($("div.notification")));
    return (await $("div.notification").getText()).includes(match);
  }

  async usernameContains(match: string) {
    try {
      return await element(
        by.xpath(
          '//*[@id="user-name" and contains(normalize-space(), "' +
          match +
          '")]'
        )
      ).isDisplayed();
    } catch (error) {
      return false;
    }
  }

  async clickLinkText(linkText: string) {
    const expandedLinkText = await this.valueExpander.expand(linkText);
    element(
      by.xpath('//a[normalize-space()="' + expandedLinkText + '"]')
    ).click();
  }

  async selectNextStep(nextStep: string) {
    const nextStepPath =
      '//select[@id="next-step"]' +
      '/option[normalize-space()="' +
      nextStep +
      '"]';
    const overviewUrl = await browser.getCurrentUrl();
    try {
      await this.triggerEventByUrl(overviewUrl, nextStep);
    } catch {
      console.log(`Next step URL attempt failed - trying via Go button`);
      await browser.get(overviewUrl);
      await this.waitForXpathElementVisible(nextStepPath, 30000);
      await element(by.xpath(nextStepPath)).click();
      const goPath = '//button[contains(text(), "Go")]';
      await element(by.xpath(goPath)).click();
      try {
        await this.waitForPageNavigation(overviewUrl, 30000);
        await this.waitForSpinner();
      } catch {
        await this.doubleClick('xpath', goPath);
        await this.waitForPageNavigation(overviewUrl, 30000);
        await this.waitForSpinner();
      }
    }
  }

  async triggerEventByUrl(overviewUrl: string, nextStep: string) {
    const url = await this.getCaseUrl(overviewUrl);
    const nextStepSlug: string | string[] | null = eventMappings[nextStep] || null;
    if (!nextStepSlug) {
      throw new Error(`No mapping found for next step: ${nextStep}`);
    }
    if (typeof nextStepSlug === "string") {
      await this.triggerEventByUrlAttempt(url, nextStepSlug, nextStep);
    } else {
      for (const slug of nextStepSlug) {
        let hasFound: boolean = await this.triggerEventByUrlAttempt(url, slug, nextStep);
        if (!hasFound) {
          console.log(`Event not found for slug: ${slug}, trying next one.`);
        } else {
          console.log(`Event successfully triggered for slug: ${slug}`);
          break;
        }
      }
    }
  }

  async triggerEventByUrlAttempt(url: string, slug: string, eventName: string) {
    const eventTriggerUrl = url + "/trigger/" + slug;
    console.log(`Triggering event at URL: ${eventTriggerUrl}`);
    const noEventFoundPath = '//p[contains(text(), "No event found")]';
    const captionPath = `//span[contains(text(), "${eventName}")][contains(@class, "govuk-caption-l")]`;
    const headerPath = `//h1[contains(text(), "${eventName}")]`;
    try {
      await browser.get(eventTriggerUrl);
      await this.waitForXpathElementVisible(`${noEventFoundPath} | ${headerPath} | ${captionPath}`, 45000);
    } catch {
      await browser.get(eventTriggerUrl);
      await this.waitForXpathElementVisible(`${noEventFoundPath} | ${headerPath} | ${captionPath}`, 45000);
    }
    return element(by.xpath(`${headerPath} | ${captionPath}`)).isPresent();
  }

  extract16Digits(input: string) {
    const match = input.match(/\d{16}/);
    return match ? match[0] : null;
  }

  async getCaseUrl(currentUrl?: string) {
    if (!currentUrl) {
      currentUrl = await browser.getCurrentUrl();
    }
    const caseId = this.extract16Digits(currentUrl);
    return currentUrl.replace(/\d{16}.*/, caseId);
  }

  async doubleClick(locatorType: 'xpath' | 'css', locator: string) {
    const driver = browser.driver;
    const goButton = driver.findElement(By[locatorType](locator));
    await new ActionSequence(driver).doubleClick(goButton).perform();
  }

  async isFieldDisplayed(
    fieldLabel: string,
    instanceNumber?: string | number,
    collectionLabel?: string,
    collectionItemNumber?: string | number
  ) {
    const field = await this.fields.find(
      "",
      fieldLabel,
      instanceNumber,
      collectionLabel,
      collectionItemNumber
    );

    return !!field && (await field.isDisplayed());
  }

  async isFieldValueDisplayed(
    fieldLabel: string,
    fieldMatch: string,
    isExactMatch = true,
    instanceNumber?: string | number,
    collectionLabel?: string,
    collectionItemNumber?: string | number,
    fieldType = ""
  ) {
    const field = await this.fields.find(
      fieldType,
      fieldLabel,
      instanceNumber,
      collectionLabel,
      collectionItemNumber
    );

    if (!!field && (await field.isDisplayed())) {
      const expandedFieldMatch = await this.valueExpander.expand(fieldMatch);
      const fieldValue = await field.getValue();

      if (isExactMatch) {
        return fieldValue === expandedFieldMatch;
      } else {
        return fieldValue.includes(expandedFieldMatch);
      }
    }

    return false;
  }

  async isFieldValueCorrectLength(
    fieldLabel: string,
    fieldValueLength: number,
    instanceNumber?: string | number,
    collectionLabel?: string,
    collectionItemNumber?: string | number
  ) {
    const field = await this.fields.find(
      "",
      fieldLabel,
      instanceNumber,
      collectionLabel,
      collectionItemNumber
    );

    if (!!field && (await field.isDisplayed())) {
      const fieldValue = await field.getValue();
      return fieldValue.length === fieldValueLength;
    }

    return false;
  }

  async isLoaded() {
    return (
      (await browser.driver.getCurrentUrl()).includes("ccd") &&
      (await ExpectedConditions.visibilityOf($("#sign-out"))())
    );
  }

  async overViewContains(match: string) {
    try {
      return await element(
        by.xpath("//*" + '[text()[normalize-space()="' + match + '"]]')
      ).isDisplayed();
    } catch (error) {
      return false;
    }
  }

  async acceptCookies() {
    let userIdCookie = await browser.manage().getCookie("__userid__");
    let userId: string;
    if (userIdCookie == null) {
      const sessionStorageData: string = await browser.executeScript(() => {
        return JSON.stringify(sessionStorage);
      });
      const sessionStorageJson = JSON.parse(sessionStorageData);
      userId = sessionStorageJson['userDetails']['uid'];
    } else {
      userId = userIdCookie["value"];
    }
    let cookieName = `hmcts-exui-cookies-${userId}-mc-accepted`;
    let cookieValue = "true";
    let cookieDomain =
      iaConfig.CcdWebUrl.split("/")[iaConfig.CcdWebUrl.split("/").length - 1];
    await browser.manage().addCookie({
      name: cookieName,
      value: cookieValue,
      domain: cookieDomain,
    });
  }

  async hideErrorMessages() {
    while (true) {
      try {
        await element(by.xpath("//a[text()='Hide message']")).click();
      } catch {
        break;
      }
    }
  }

  getStoredCaseUrl() {
    return caseUrl;
  }

  setStoredCaseUrl(url: string) {
    caseUrl = url;
  }

  async waitForConfirmationScreenAndContinue(previousUrl: string) {
    await this.waitForPageNavigation(previousUrl);
    const currentUrl = await browser.getCurrentUrl();
    try {
      expect(currentUrl).to.contain("confirm");
      await this.waitForCssElementVisible("#confirmation-header");
      await this.waitForXpathElementVisible('//button[contains(text(), "Close and Return to case details")]');
      await this.click('Close and Return to case details');
      await this.waitForOverviewPage(this.getStoredCaseUrl());
      this.setStoredCaseUrl(await browser.getCurrentUrl());
    } catch {
      await this.waitForOverviewPage(this.getStoredCaseUrl());
      this.setStoredCaseUrl(await browser.getCurrentUrl());
    }
  }

  async waitForConfirmationScreen(previousUrl: string) {
    await this.waitForPageNavigation(previousUrl);
    expect(await browser.getCurrentUrl()).to.contain("confirm");
    await this.waitForCssElementVisible("#confirmation-header");
  }

  async waitForCssElementVisible(locator: string) {
    await browser.wait(
      async () => element(by.css(locator)).isPresent(),
      30000,
      `Expected element ${locator} to be present within 30 seconds`
    );
    expect(await element(by.css(locator)).isPresent()).to.equal(true);
    const visibleElementCount = await element
      .all(by.css(locator))
      .filter(e => e.isDisplayed())
      .count();
    expect(visibleElementCount > 0).to.equal(true);
  }

  async waitForXpathElementVisible(locator: string, timeout = 30000) {
    await browser.wait(
      async () => element(by.xpath(locator)).isPresent(),
      timeout,
      `Expected element ${locator} to be present within ${timeout} ms`
    );
    expect(await element(by.xpath(locator)).isPresent()).to.equal(true);
    const visibleElementCount = await element
      .all(by.xpath(locator))
      .filter(e => e.isDisplayed())
      .count();
    expect(visibleElementCount > 0).to.equal(true);
  }

  async verifyVisibleByXpath(locator: string) {
    expect(await element(by.xpath(locator)).isPresent()).to.equal(true);
    const visibleElementCount = await element
      .all(by.xpath(locator))
      .filter(e => e.isDisplayed())
      .count();
    expect(visibleElementCount > 0).to.equal(true);
  }

  async verifyHiddenByXpath(locator: string) {
    const visibleElementCount = await element
      .all(by.xpath(locator))
      .filter(e => e.isDisplayed())
      .count();
    return visibleElementCount === 0;
  }

  async waitForOverviewPage(someCaseUrl: string) {
    try {
      await this.waitForCssElementVisible("#next-step");
    } catch {
      if (someCaseUrl === "") {
        throw new Error("Browser backed out to case list page, but no caseUrl saved to navigate back to the case overview page.");
      }
      await browser.get(someCaseUrl);
      await this.waitForCssElementVisible("#next-step");
    }
    await browser.wait(
      async () => element(by.css("#next-step")).isEnabled(),
      15000,
      "Expected element #next-step to be enabled within 15 seconds"
    );
    expect(await element(by.css("#next-step")).isEnabled()).to.equal(true);
    await this.waitForCssElementVisible(
      "#case-viewer-field-read--caseDetailsTitle"
    );
  }

  async flakeyClick(clickText: string, currentUrl: string) {
    for (let i = 0; i < 3; i++) {
      try {
        await this.click(clickText);
        await this.waitForPageNavigation(currentUrl);
        break;
      } catch {
        if (i < 2) {
          console.log(`Click attempt ${i + 1} failed. Trying again.`);
        } else {
          throw "All click attempts failed. Giving up.";
        }
      }
    }
  }

  async getTodayDate(date) {
    const expandedMatch = await this.valueExpander.expand(date);
    return expandedMatch;
  }

  async gotoTabs(match: string) {
    try {
      await this.waitForXpathElementVisible(`//div[contains(@class, 'mat-tab-label')][contains(text(), '${match}')]`, 30000);
      await element(by.xpath(`//div[contains(@class, 'mat-tab-label-content')][contains(text(), '${match}')]`)).click();
    } catch {
      await element(by.xpath(`//button[contains(@class, 'mat-tab-header-pagination-after')]`)).click();
      await this.waitForXpathElementVisible(`//div[contains(@class, 'mat-tab-label')][contains(text(), '${match}')]`, 30000);
      await element(by.xpath(`//div[contains(@class, 'mat-tab-label-content')][contains(text(), '${match}')]`)).click();
    }
  }
}
