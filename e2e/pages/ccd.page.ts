import { AnyPage } from "./any.page";
import { Fields } from "../fields/fields";
import { $, ActionSequence, browser, By, by, element, ExpectedConditions } from "protractor";
import { expect } from "chai";

const iaConfig = require("../ia.conf");

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
    for (let i = 0; i < 5; i++) {
      try {
        await this.waitForXpathElementVisible(nextStepPath, 15000);
        await element(by.xpath(nextStepPath)).click();
        let overviewUrl = await browser.getCurrentUrl();
        const goPath = '//button[contains(text(), "Go")]';
        // await element(by.xpath(goPath)).click();
        await this.doubleClick('xpath', goPath);
        await this.waitForPageNavigation(overviewUrl, 15000);
        await this.waitForSpinner();
        break;
      } catch {
        if (i === 4) {
          throw "All attempts failed. Giving up.";
        } else {
          browser.refresh();
          console.log(`Next step event trigger attempt ${i + 1} failed. Trying again.`);
        }
      }
    }
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
    let userID = (await browser.manage().getCookie("__userid__"))["value"];
    let cookieName = `hmcts-exui-cookies-${userID}-mc-accepted`;
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

  async waitForConfirmationScreenAndContinue(previousUrl: string) {
    await this.waitForPageNavigation(previousUrl);
    const currentUrl = await browser.getCurrentUrl();
    try {
      expect(currentUrl).to.contain("confirm");
      await this.waitForCssElementVisible("#confirmation-header");
      await this.click('Close and Return to case details');
    } catch {
      expect(currentUrl).to.contain("#Overview");
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
  }

  async waitForXpathElementVisible(locator: string, timeout = 30000) {
    await browser.wait(
      async () => element(by.xpath(locator)).isPresent(),
      timeout,
      `Expected element ${locator} to be present within ${timeout} ms`
    );
    expect(await element(by.xpath(locator)).isPresent()).to.equal(true);
  }

  async waitForOverviewPage() {
    await this.waitForCssElementVisible("#next-step");
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
      await this.waitForXpathElementVisible(`//div[contains(@class, 'mat-tab-label')][contains(text(), '${match}')]`, 15000);
    } catch {
      await element(by.xpath(`//button[contains(@class, 'mat-tab-header-pagination-after')]`)).click();
      await element(by.xpath(`//div[contains(@class, 'mat-tab-label')][contains(text(), '${match}')]`)).click();
    }
  }
}
