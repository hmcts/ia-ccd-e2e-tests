import { browser, by, element, ElementFinder, protractor } from "protractor";
import { expect } from 'chai';
import { Wait } from "../enums/wait";
import { ValueExpander } from "../helpers/value-expander";

const AxeRunner = require("../helpers/accessibility/axe-runner");
const iaConfig = require("../ia.conf");
const BrowserWaits = require("../support/customWaits");

const submitButtons = [
  "Continue",
  "Submit",
  "Send direction",
  "Upload",
  "Request Home Office data",
  "Save"
];
export class AnyPage {
  protected readonly valueExpander = new ValueExpander();

  async getCurrentUrl() {
    return await browser.driver.getCurrentUrl();
  }

  async get(uri: string) {
    await browser.get(uri);
  }

  async runAccessbility() {
    if (iaConfig.TestForAccessibility) {
      await AxeRunner.runAndReportAccessibility();
    }
  }

  async getDisplayedImageSources(wait = Wait.normal) {
    try {
      await browser.wait(async () => {
        return (
          (await element
            .all(by.xpath("//img"))
            .filter((e) => e.isPresent() && e.isDisplayed())
            .count()) > 0
        );
      }, wait);

      return await element
        .all(by.xpath("//img"))
        .filter((e) => e.isPresent() && e.isDisplayed())
        .map(async (img) => (await img.getAttribute("src")).trim());
    } catch (error) {
      return [];
    }
  }

  async click(
    linkText: string,
    xpathIndex = 0,
    waitForNavigationTime?: number,
    shouldWaitForNavigation = true
  ) {
    const expandedLinkText = await this.valueExpander.expand(linkText);

    const buttonPath = '//button[normalize-space()="' + expandedLinkText + '"]';
    const anchorPath = '//a[normalize-space()="' + expandedLinkText + '"]';
    const linkPath =
      "//*" + '[text()[normalize-space()="' + expandedLinkText + '"]]';

    try {
      await browser.wait(
        async () => {
          return (
            (await element
              .all(by.xpath(buttonPath + " | " + anchorPath + " | " + linkPath))
              .filter((e) => e.isPresent() && e.isDisplayed() && e.isEnabled())
              .count()) > 0
          );
        },
        linkText === "Close and Return to case details" ? Wait.long : Wait.short
      );
    } catch (e) {
      console.log(linkText + " not found on page.");
    }

    const button = await element
      .all(by.xpath(buttonPath))
      .filter((e) => e.isPresent() && e.isDisplayed())
      .get(xpathIndex);

    if (await button.isPresent()) {
      await BrowserWaits.waitForelementToBeClickable(button);
      await this.waitForSpinner(180000);
      const unexpectedError = element(by.xpath('//*[contains(text(),"Something unexpected happened")]'));
      const nullIndexError = element(by.xpath('//*[contains(text(),"Cannot read properties of null")]'));
      const couldNotBeCreated = element(by.xpath('//*[contains(text(),"The event could not be created")]'));
      const thisPageUrl = await browser.getCurrentUrl();
      await button.click();
      await this.waitForSpinner(180000);
      try {
        expect(await unexpectedError.isPresent()).to.equal(false);
        expect(await nullIndexError.isPresent()).to.equal(false);
        expect(await couldNotBeCreated.isPresent()).to.equal(false);
      } catch {
        await button.click();
      }
      if (submitButtons.includes(linkText) && shouldWaitForNavigation) {
        await this.waitForSpinner(180000);
        await this.waitForPageNavigation(thisPageUrl, waitForNavigationTime);
        try {
          expect(await unexpectedError.isPresent()).to.equal(false);
          expect(await nullIndexError.isPresent()).to.equal(false);
          expect(await couldNotBeCreated.isPresent()).to.equal(false);
        } catch {
          await button.click();
          await this.waitForSpinner(180000);
          await this.waitForPageNavigation(thisPageUrl, waitForNavigationTime);
        }
      }
      return;
    }

    const anchor = await element
      .all(by.xpath(anchorPath))
      .filter((e) => e.isPresent() && e.isDisplayed())
      .get(xpathIndex);

    if (await anchor.isPresent()) {
      await BrowserWaits.waitForelementToBeClickable(anchor);
      await anchor.click();
      await browser.sleep(5000);
      return;
    }

    const link = await element
      .all(by.xpath(linkPath))
      .filter((e) => e.isPresent() && e.isDisplayed())
      .get(xpathIndex);

    await BrowserWaits.waitForelementToBeClickable(link);
    await link.click();
    await this.waitForSpinner();
  }

  async waitForPageNavigation(
    currentPageUrl: string,
    waitForNavigationTime?: number
  ) {
    let nextPage = "";
    let pageErrors = "";
    await browser.wait(
      async () => {
        nextPage = await browser.getCurrentUrl();

        if (
          nextPage.includes("/noc") ||
          nextPage.includes("/allocate-role/") ||
          nextPage.includes("/add-exclusion")
        ) {
          return true;
        }

        return currentPageUrl !== nextPage;
      },
      waitForNavigationTime ? waitForNavigationTime : 30000,
      "Navigation to next page taking too long " +
      (waitForNavigationTime ? waitForNavigationTime : 30000) +
      ". Current page " +
      currentPageUrl +
      ". Errors => " +
      pageErrors
    );
  }

  async isButtonEnabled(match: string, shortWait = false) {
    const expandedMatch = await this.valueExpander.expand(match);

    try {
      await browser.wait(
        async () => {
          return (
            (await element
              .all(
                by.xpath(
                  "//*[self::button or self::a]" +
                  '[contains(normalize-space(), "' +
                  expandedMatch +
                  '") and not(ancestor::*[@hidden])]'
                )
              )
              .filter((e) => e.isPresent() && e.isDisplayed() && e.isEnabled())
              .count()) > 0
          );
        },
        shortWait ? Wait.minimal : Wait.normal
      );
      return true;
    } catch (error) {
      return false;
    }
  }

  async doesDropdownHaveValues(match: string, shortWait = false) {
    const expandedMatch = await this.valueExpander.expand(match);

    try {
      await browser.wait(
        async () => {
          return (
            (await element
              .all(
                by.xpath(
                  '//label[contains(normalize-space(),"' +
                  expandedMatch +
                  '")]' +
                  "/../select/option[string-length(@value) > 0]"
                )
              )
              .filter((e) => e.isPresent() && e.isDisplayed() && e.isEnabled())
              .count()) > 0
          );
        },
        shortWait ? Wait.short : Wait.normal
      );

      return true;
    } catch (error) {
      return false;
    }
  }

  async linkContains(match: string, shortWait = false) {
    const expandedMatch = await this.valueExpander.expand(match);

    try {
      await browser.wait(
        async () => {
          return (
            (await element
              .all(
                by.xpath(
                  "//*[self::button or self::a]" +
                  '[contains(normalize-space(), "' +
                  expandedMatch +
                  '") and not(ancestor::*[@hidden])]'
                )
              )
              .filter((e) => e.isPresent() && e.isDisplayed())
              .count()) > 0
          );
        },
        shortWait ? Wait.short : Wait.normal
      );

      return true;
    } catch (error) {
      return false;
    }
  }

  async headingContains(match: string, shortWait = false) {
    const expandedMatch = await this.valueExpander.expand(match);

    try {
      await browser.wait(
        async () => {
          return (
            (await element
              .all(
                by.xpath(
                  "//*[self::h1 or self::h2 or self::h3 or self::caption]" +
                  '[contains(normalize-space(), "' +
                  expandedMatch +
                  '") and not(ancestor::*[@hidden])]'
                )
              )
              .filter((e) => e.isPresent() && e.isDisplayed())
              .count()) > 0
          );
        },
        shortWait ? Wait.short : Wait.normal
      );

      return true;
    } catch (error) {
      return false;
    }
  }

  async contentContains(match: string, wait: Wait = Wait.normal) {
    const expandedMatch = await this.valueExpander.expand(match);

    const contentPath =
      "//*[" +
      "self::h1 or " +
      "self::h2 or " +
      "self::h3 or " +
      "self::h4 or " +
      "self::caption or " +
      "self::label or " +
      "self::p or " +
      'self::li                        [contains(text(), "' +
      expandedMatch +
      '")] or ' + // for bulleted text
      'self::div                       [contains(text(), "' +
      expandedMatch +
      '")] or ' + // avoid text in child nodes
      'self::ccd-read-date-field       [contains(text(), "' +
      expandedMatch +
      '")] or ' + // for more generic containers
      'self::dt                        [contains(text(), "' +
      expandedMatch +
      '")] or ' + // added recently
      'self::ccd-read-fixed-list-field [contains(text(), "' +
      expandedMatch +
      '")] or ' + // ..
      'self::ng-component              [contains(text(), "' +
      expandedMatch +
      '")] or ' + // ..
      'self::span                      [contains(text(), "' +
      expandedMatch +
      '")] or ' + // ..
      'self::td                        [contains(text(), "' +
      expandedMatch +
      '")]' + // ..
      "]" +
      '[contains(normalize-space(), "' +
      expandedMatch +
      '") and not(ancestor::*[@hidden])]';

    try {
      await browser.wait(async () => {
        return (
          (await element
            .all(by.xpath(contentPath))
            .filter((e) => e.isPresent() && e.isDisplayed())
            .count()) > 0
        );
      }, wait);

      return true;
    } catch (error) {
      return false;
    }
  }

  async imgSrcContains(match: string, shortWait = false) {
    const expandedMatch = await this.valueExpander.expand(match);

    try {
      await browser.wait(async () => {
        return (
          (await element
            .all(by.xpath('//img[contains(@src, "' + expandedMatch + '")]'))
            .filter((e) => e.isPresent() && e.isDisplayed())
            .count()) > 0
        );
      }, Wait.normal);

      return true;
    } catch (error) {
      return false;
    }
  }

  async urlContains(match: string, shortWait = false) {
    const expandedMatch = await this.valueExpander.expand(match);

    try {
      await browser.wait(
        async () => {
          return (await browser.driver.getCurrentUrl()).includes(expandedMatch);
        },
        shortWait ? Wait.short : Wait.normal
      );

      return true;
    } catch (error) {
      return false;
    }
  }

  async waitUntilLoaded() {
    if (iaConfig.WaitForAngular) {
      await browser.waitForAngularEnabled(true);
      await browser.waitForAngular();
    } else {
      await browser.sleep(Wait.minimal);
    }
  }

  async waitForSpinner(timeout= 60000) {
    let EC = protractor.ExpectedConditions;
    await browser.wait(
      EC.invisibilityOf(element(by.css("div.spinner-container"))),
      timeout,
      "Spinner did not stop."
    );
  }

  async clickButtonIfVisible(linkText: string) {
    let button = element(by.xpath('//button[text()="' + linkText + '"]'));
    try {
      await BrowserWaits.waitForElement(button);
      await BrowserWaits.waitForelementToBeClickable(button);
      await button.click();
    } catch {
    }
  }

  async createCaseClickable() {
    let createCase: ElementFinder = element(
      by.xpath('//a[contains(text(), "Create case")]')
    );
    await BrowserWaits.waitForElement(createCase);
    await BrowserWaits.waitForelementToBeClickable(createCase);
  }

  async refresh() {
    browser.refresh();
  }

  async goToUrl(URL) {
    browser.driver.get(URL);
  }

  async stopSpinnerLoad() {
    await browser.executeScript(
      `[].forEach.call(document.querySelectorAll('.spinner-container'), function (el) { el.style.visibility = 'hidden'; el.style.display = 'none'; });`
    );
  }
}
