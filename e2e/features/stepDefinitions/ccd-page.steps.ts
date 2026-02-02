import { CcdPage } from "../../pages/ccd.page";
import { Given, Then, When } from "cucumber";
import { browser, By, by, element } from "protractor";
import { expect } from "chai";
import { Wait } from "../../enums/wait";
import { OrdinalToCardinal } from "../../helpers/ordinal-to-cardinal";
import { CcdFormPage } from "../../pages/ccd-form.page";
import CaseHelper from "../../helpers/CaseHelper";

const ccdPage = new CcdPage();
const ccdFormPage = new CcdFormPage();
const iaConfig = require("../../ia.conf");

Given("I create a new case", async function () {
  await ccdPage.acceptCookies();
  await browser.get(iaConfig.CcdWebUrl + "/cases/case-filter");
  try {
    await ccdPage.waitForCssElementVisible('#cc-jurisdiction');
  } catch {
    browser.refresh();
    await ccdPage.waitForCssElementVisible('#cc-jurisdiction');
  }
  await ccdPage.waitForSpinner();
  expect(await ccdPage.headingContains("Create Case")).to.equal(true);
  await ccdPage.runAccessbility();
  await ccdPage.hideErrorMessages();
  await ccdPage.doesDropdownHaveValues("Jurisdiction");
  await ccdFormPage.setFieldValue("Jurisdiction", "Immigration & Asylum");
  await ccdPage.doesDropdownHaveValues("Case type");
  await browser.wait(
    async () => element(by.xpath('//option[contains(text(), "Appeal*")]')).isPresent(),
    30000,
    `Expected element "//option[contains(text(), "Appeal*")]" to be present within 30 seconds`
  );
  await element(by.xpath('//option[contains(text(), "Appeal*")]')).click();
  await ccdPage.doesDropdownHaveValues("Event");
  await ccdPage.isButtonEnabled("Start");
  await ccdPage.click("Start");
  try {
    await ccdPage.waitForPageNavigation(iaConfig.CcdWebUrl + "/cases/case-filter");
  } catch {
    await ccdPage.click("Start");
    await ccdPage.waitForPageNavigation(iaConfig.CcdWebUrl + "/cases/case-filter");
  }
});

Given("I create a new bail application", async function () {
  await ccdPage.acceptCookies();
  await browser.get(iaConfig.CcdWebUrl + "/cases/case-filter");
  try {
    await ccdPage.waitForCssElementVisible('#cc-jurisdiction');
  } catch {
    browser.refresh();
    await ccdPage.waitForCssElementVisible('#cc-jurisdiction');
  }
  await ccdPage.waitForSpinner();
  expect(await ccdPage.headingContains("Create Case")).to.equal(true);
  await ccdPage.runAccessbility();
  await ccdPage.hideErrorMessages();
  await ccdPage.doesDropdownHaveValues("Jurisdiction");
  await ccdFormPage.setFieldValue("Jurisdiction", "Immigration & Asylum");
  await ccdPage.doesDropdownHaveValues("Case type");
  await browser.wait(
    async () => element(by.xpath('//option[contains(text(), "Bail*")]')).isPresent(),
    30000,
    `Expected element "//option[contains(text(), "Bail*")]" to be present within 30 seconds`
  );
  await element(by.xpath('//option[contains(text(), "Bail*")]')).click();
  await ccdPage.doesDropdownHaveValues("Event");
  await ccdPage.isButtonEnabled("Start");
  await ccdPage.click("Start");
  try {
    await ccdPage.waitForPageNavigation(iaConfig.CcdWebUrl + "/cases/case-filter");
  } catch {
    await ccdPage.click("Start");
    await ccdPage.waitForPageNavigation(iaConfig.CcdWebUrl + "/cases/case-filter");
  }
});

Given("I Apply case list filter", async function () {
  await ccdPage.waitForSpinner();
  expect(await ccdPage.headingContains("Case list")).to.equal(true);
  await ccdPage.runAccessbility();
  await ccdPage.doesDropdownHaveValues("Jurisdiction");
  await ccdFormPage.setFieldValue("Jurisdiction", "Immigration & Asylum");
  await ccdPage.doesDropdownHaveValues("Case type");
  await browser.wait(
    async () => element(by.xpath('//option[contains(text(), "Appeal*")]')).isPresent(),
    30000,
    `Expected element "//option[contains(text(), "Appeal*")]" to be present within 30 seconds`
  );
  await element(by.xpath('//option[contains(text(), "Appeal*")]')).click();
  await ccdPage.doesDropdownHaveValues("State");
  await ccdFormPage.setFieldValue("State", "Any");
  await ccdPage.isButtonEnabled("Apply");
  await ccdPage.click("Apply");
});

Given("I Apply case list filter for Bails", async function () {
  await ccdPage.waitForSpinner();
  expect(await ccdPage.headingContains("Case list")).to.equal(true);
  await ccdPage.runAccessbility();
  await ccdPage.doesDropdownHaveValues("Jurisdiction");
  await ccdFormPage.setFieldValue("Jurisdiction", "Immigration & Asylum");
  await ccdPage.doesDropdownHaveValues("Case type");
  await browser.wait(
    async () => element(by.xpath('//option[contains(text(), "Bail*")]')).isPresent(),
    30000,
    `Expected element "//option[contains(text(), "Bail*")]" to be present within 30 seconds`
  );
  await element(by.xpath('//option[contains(text(), "Bail*")]')).click();
  await ccdPage.doesDropdownHaveValues("State");
  await ccdFormPage.setFieldValue("State", "Any");
  await ccdPage.isButtonEnabled("Apply");
  await ccdPage.click("Apply");
});

Then("I wait for Create Case fields to load", async function () {
  await ccdPage.headingContains("Create Case");
  await ccdPage.doesDropdownHaveValues("Jurisdiction");
  await ccdPage.doesDropdownHaveValues("Case type");
  await ccdPage.doesDropdownHaveValues("Event");
  await ccdPage.isButtonEnabled("Start");
});

Then(/I wait for (\d+) seconds?$/, async function (waitDelay) {
  await browser.sleep(waitDelay * 1000);
});

Then(/^I should see `?([^`]+)`? in the url$/, async function (urlText) {
  expect(await ccdPage.urlContains(urlText)).to.equal(true);
});

Then(
  /^I (?:am on|should see) the `?([^`]+)`? page$/,
  async function (headingText) {
    expect(await ccdPage.headingContains(headingText)).to.equal(true);
  }
);

Then(/^I see the open case$/, async function () {
  expect(await ccdPage.linkContains("Print")).to.equal(true);
});

Then(
  /^I should see a notification saying `?([^`]+)`?$/,
  async function (message) {
    expect(await ccdPage.notificationContains(message)).to.equal(true);
  }
);

Then(/^I should see the username `?([^`]+)`?$/, async function (username) {
  expect(await ccdPage.usernameContains(username)).to.equal(true);
});

Then(
  /^I (?:should |)(see|not see) the image `?([^`]+)`?$/,
  async function (seeOrNotSee, match) {
    const shortWait = seeOrNotSee === "not see";
    try {
      expect(await ccdPage.imgSrcContains(match, shortWait)).to.equal(
        seeOrNotSee === "see"
      );
    } catch {
      browser.refresh();
      expect(await ccdPage.imgSrcContains(match, shortWait)).to.equal(
        seeOrNotSee === "see"
      );
    }
  }
);

Then(
  /^I (?:should |)(see|not see) the text `?([^`]+)`?$/,
  async function (seeOrNotSee, match) {
    const wait = seeOrNotSee === "not see" ? Wait.short : Wait.normal;
    expect(await ccdPage.contentContains(match, wait)).to.equal(
      seeOrNotSee === "see"
    );
  }
);

Then(
  /^I should see ?`([^`]+)`?$/,
  async function (match: string) {
    await ccdPage.waitForXpathElementVisible(`//*[contains(text(), "${match}")]`);
  }
);

Then(
  /^I (?:should |)(see|not see) the `?([^`]+)`? (?:button|link|tab|label)$/,
  async function (seeOrNotSee, linkText) {
    const shortWait = seeOrNotSee === "not see";
    expect(await ccdPage.linkContains(linkText, shortWait)).to.equal(
      seeOrNotSee === "see"
    );
  }
);

Then("I should be on the overview page", async function () {
  await ccdPage.waitForOverviewPage(ccdPage.getStoredCaseUrl());
});

Then("I go to the overview page for the stored case", async function () {
  await ccdPage.get(CaseHelper.getInstance().getStoredCaseUrl());
  await ccdPage.waitForOverviewPage(CaseHelper.getInstance().getStoredCaseUrl());
  await ccdPage.gotoTabs("Overview");
});

Then(
  /^the `?([^`]+)`? button is (?:still |)(enabled|disabled)$/,
  async function (buttonText, enabledOrDisabled) {
    expect(
      await ccdPage.isButtonEnabled(buttonText, enabledOrDisabled !== "enabled")
    ).to.equal(enabledOrDisabled === "enabled");
  }
);

When(
  /^I click the `?([^`]+)`? (?:button|link|tab|label)$/,
  async function (linkText) {
    await ccdPage.waitForSpinner();
    if (linkText === "tab") {
      await ccdPage.gotoTabs(linkText);
    } else {
      await ccdPage.click(linkText);
    }
  }
);

When(
  /^I click the `Continue` button for flakey Make an application$/,
  async function () {
    await ccdPage.waitForSpinner();
    try {
      await ccdPage.click("Continue", 0, 120000);
    } catch {
      await ccdPage.waitForCssElementVisible("div.error-summary");
      await ccdPage.click("Continue");
    }
  }
);

When(/^I click the `?([^`]+)`? button if present$/, async function (linkText) {
  await ccdPage.waitForSpinner();
  await ccdPage.clickButtonIfVisible(linkText);
});
When(
  /^I goto the `?([^`]+)`? (?:button|link|tab|label)$/,
  async function (linkText) {
    await ccdPage.waitForSpinner();
    if (linkText === 'Hearings') {
      const url = await ccdPage.getCaseUrl();
      await ccdPage.get(url + "/hearings");
      await ccdPage.waitForXpathElementVisible('//th[contains(text(), "Current and upcoming")]');
    } else {
      await ccdPage.gotoTabs(linkText);
    }
  }
);

When(
  /^I click the `?(first|second|third|)`?\s`?([^`]+)`? (?:button|link|tab|label)$/,
  async function (instanceNumber, linkText) {
    const xpathIndex =
      OrdinalToCardinal.convertWordToNumber(instanceNumber) - 1;
    await ccdPage.click(linkText, xpathIndex);
  }
);

When(/^I refresh the page$/, async function () {
  await ccdPage.refresh();
});

Then(
  /^I should (see|not see) the `?(first|second|third|)`?\s?(?:answer|field) without a label$/,
  async function (seeOrNotSee, instanceNumber) {
    expect(await ccdPage.isFieldDisplayed("", instanceNumber)).to.equal(
      seeOrNotSee === "see"
    );
  }
);

Then(
  /^I should (see|not see) the `?(first|second|third|)`?\s?`?([^`]+)`? (?:answer|field)$/,
  async function (seeOrNotSee, instanceNumber, fieldLabel) {
    expect(await ccdPage.isFieldDisplayed(fieldLabel, instanceNumber)).to.equal(
      seeOrNotSee === "see"
    );
  }
);

Then(
  /^the `?(first|second|third|)`?\s?`?([^`]+)`? (?:answer|field) should be empty$/,
  async function (instanceNumber, fieldLabel) {
    expect(
      await ccdPage.isFieldValueDisplayed(fieldLabel, "", true, instanceNumber)
    ).to.equal(true);
  }
);

Then(
  /^the `?(first|second|third|)`?\s?`?([^`]+)`? (?:answer|field) should be (\d+) characters long$/,
  async function (instanceNumber, fieldLabel, fieldValueSize) {
    expect(
      await ccdPage.isFieldValueCorrectLength(
        fieldLabel,
        fieldValueSize,
        instanceNumber
      )
    ).to.equal(true);
  }
);

Then(
  /^the `?(first|second|third|)`?\s?(?:answer|field) without a label should be empty$/,
  async function (instanceNumber) {
    expect(
      await ccdPage.isFieldValueDisplayed("", "", true, instanceNumber)
    ).to.equal(true);
  }
);

Then(
  /^I should see `?([^`]+)`? (in|for) the `?(first|second|third|)`?\s?(?:answer|field) without a label$/,
  async function (fieldMatch, inOrFor, instanceNumber) {
    const isExactMatch = inOrFor === "for";

    expect(
      await ccdPage.isFieldValueDisplayed(
        "",
        fieldMatch,
        isExactMatch,
        instanceNumber
      )
    ).to.equal(true);
  }
);

Then(
  /^I should see `?([^`]+)`? (in|for) the `?(first|second|third|fourth|fifth|)`?\s?`?([^`]+)`? (?:answer|field)$/,
  async function (fieldMatch, inOrFor, instanceNumber, fieldLabel) {
    const isExactMatch = inOrFor === "for";

    expect(
      await ccdPage.isFieldValueDisplayed(
        fieldLabel,
        fieldMatch,
        isExactMatch,
        instanceNumber
      )
    ).to.equal(true);
  }
);

Then(
  /^I should see `?([^`]+)`? (in|for) the `?([^`]+)`? text area input (?:answer|field)$/,
  async function (fieldMatch, inOrFor, fieldLabel) {
    const isExactMatch = inOrFor === "for";

    expect(
      await ccdPage.isFieldValueDisplayed(
        fieldLabel,
        fieldMatch,
        isExactMatch,
        "first",
        "",
        "",
        "text area"
      )
    ).to.equal(true);
  }
);

Then(
  /^I should see `?([^`]+)`? (in|for) the `?([^`]+)`? date input (?:answer|field)$/,
  async function (fieldMatch, inOrFor, fieldLabel) {
    const isExactMatch = inOrFor === "for";

    expect(
      await ccdPage.isFieldValueDisplayed(
        fieldLabel,
        fieldMatch,
        isExactMatch,
        "first",
        "",
        "",
        "date"
      )
    ).to.equal(true);
  }
);

Then(
  /^within the `?(first|second|third|)`?\s?`?([^`]+)`? fieldset, I should see `?([^`]+)`? (in|for) the (?:answer|field) without a label$/,
  async function (instanceNumber, fieldsetLabel, fieldMatch, inOrFor) {
    const isExactMatch = inOrFor === "for";

    expect(
      await ccdPage.isFieldValueDisplayed(
        "",
        fieldMatch,
        isExactMatch,
        instanceNumber,
        fieldsetLabel
      )
    ).to.equal(true);
  }
);

Then(
  /^within the `?(first|second|third|)`?\s?`?([^`]+)`? fieldset, I should see `?([^`]+)`? (in|for) the `?([^`]+)`? (?:answer|field)$/,
  async function (
    instanceNumber,
    fieldsetLabel,
    fieldMatch,
    inOrFor,
    fieldLabel
  ) {
    const isExactMatch = inOrFor === "for";

    expect(
      await ccdPage.isFieldValueDisplayed(
        fieldLabel,
        fieldMatch,
        isExactMatch,
        instanceNumber,
        fieldsetLabel
      )
    ).to.equal(true);
  }
);

Then(
  /^within the `?(first|second|third|)`?\s?`?([^`]+)`? collection's `?([^\s`]+)`? item, I should see `?([^`]+)`? (in|for) the (?:answer|field) without a label$/,
  async function (
    instanceNumber,
    collectionLabel,
    collectionItemNumber,
    fieldMatch,
    inOrFor
  ) {
    const isExactMatch = inOrFor === "for";

    expect(
      await ccdPage.isFieldValueDisplayed(
        "",
        fieldMatch,
        isExactMatch,
        instanceNumber,
        collectionLabel,
        collectionItemNumber
      )
    ).to.equal(true);
  }
);

Then(
  /^within the `?(first|second|third|)`?\s?`?([^`]+)`? collection's `?([^\s`]+)`? item, I should see `?([^`]+)`? (in|for) the `?([^`]+)`? (?:answer|field)$/,
  async function (
    instanceNumber,
    collectionLabel,
    collectionItemNumber,
    fieldMatch,
    inOrFor,
    fieldLabel
  ) {
    const isExactMatch = inOrFor === "for";

    expect(
      await ccdPage.isFieldValueDisplayed(
        fieldLabel,
        fieldMatch,
        isExactMatch,
        instanceNumber,
        collectionLabel,
        collectionItemNumber
      )
    ).to.equal(true);
  }
);

Then(
  /^within the `?(first|second|third|)`?\s?`?([^`]+)`? collection's `?([^\s`]+)`? item, I should see one of `?([^`]+)`? (in|for) the `?([^`]+)`? (?:answer|field)$/,
  async function (
    instanceNumber,
    collectionLabel,
    collectionItemNumber,
    fieldMatch,
    inOrFor,
    fieldLabel
  ) {
    const isExactMatch = inOrFor === "for";
    const values = fieldMatch.split(',');

    let result: boolean[] = [];

    for (const value of values) {
      const res = await ccdPage.isFieldValueDisplayed(
        fieldLabel,
        value,
        isExactMatch,
        instanceNumber,
        collectionLabel,
        collectionItemNumber
      );
      result.push(res);
    }
    expect(result.some(r => r === true)).to.equal(true);
  }
);

Then(/^I go to the URL `?([^`]+)`?$/, async function (URL) {
  await ccdFormPage.goToUrl(URL);
});

Then(
  /^I select `?([^`]+)`? from the dropdown with ID `?([^`]+)`?$/,
  async function (option, ID) {
    await ccdFormPage.typeText(ID, option);
  }
);

Given("I restart the browser", async function () {
  await browser.restart();
});
Then(/^I will make `?([^`]+)`? as Inactive$/, async function (flagtype) {
  await ccdFormPage.click(flagtype);
  await ccdFormPage.click("Continue", 0, 0, false);
  await ccdFormPage.waitForXpathElementVisible('//label[contains(text(), "Update flag")]');
  const isFlagComment = await browser.element(By.xpath(`//*[@id='flagComment']`)).isPresent();
  await ccdFormPage.typeText(
    isFlagComment ? 'flagComment' : 'flagComments',
    'test case flage make it inactive'
  );
  await ccdFormPage.click("Make inactive");
  await ccdFormPage.click("Continue", 0, 0, false);
  await ccdFormPage.click("Manage Flags");
});

Then(
  /^I have created a `?([^`]+)`? Flag in `?([^`]+)`?$/,
  async function (flag, type) {
    await ccdFormPage.click(type);
    await ccdFormPage.click("Continue", 0, 30000, false);
    await ccdFormPage.waitForXpathElementVisible(`//label[contains(text(),"${flag}")][contains(@class, "govuk-radios__label")]`);
    await ccdFormPage.click(flag);
    await ccdFormPage.click("Continue", 0, 30000, false);
    try {
      await ccdFormPage.waitForXpathElementVisible('//label[contains(text(), "Add comments for this flag")]');
    } catch {
      await ccdFormPage.click(flag);
      await ccdFormPage.click("Continue", 0, 30000, false);
      await ccdFormPage.waitForXpathElementVisible('//label[contains(text(), "Add comments for this flag")]');
    }
    await ccdFormPage.click("Continue", 0, 30000, false);
    const currentUrl = await browser.getCurrentUrl();
    await ccdFormPage.click("Create Flag");
    await ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
  }
);
Then(
  /^I have created a `Language Interpreter` Flag in `?([^`]+)`? and language name is `?([^`]+)`?$/,
  async function (type, language) {
    await ccdFormPage.click(type);
    await ccdFormPage.click("Continue", 0, 0, false);
    await ccdFormPage.waitForXpathElementVisible('//h1[contains(text(), "Select flag type")]');
    await ccdFormPage.click('Language Interpreter');
    await ccdFormPage.click("Continue", 0, 0, false);
    await ccdFormPage.waitForXpathElementVisible('//label[contains(text(), "Language Interpreter")]');
    await ccdFormPage.selectInterpreterLanguage(language);
    await browser.sleep(1000);
    await ccdFormPage.click("Continue", 0, 0, false);
    await ccdFormPage.waitForXpathElementVisible('//label[contains(text(), "Add comments for this flag")]');
    const isFlagComment = await browser.element(By.xpath(`//*[@id='flagComment']`)).isPresent();
    await ccdFormPage.typeText(
      isFlagComment ? 'flagComment' : 'flagComments',
      `just comment for interpreter languages`
    );
    await ccdFormPage.click("Continue", 0, 0, false);
    await ccdFormPage.waitForXpathElementVisible('//h2[contains(text(), "Review flag details")]');
    const currentUrl = await browser.getCurrentUrl();
    await ccdFormPage.click("Create Flag");
    await ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
  }
);
Then(
  /^I have created a `Reasonable adjustment` Flag in `?([^`]+)`? and signlanguage name is `?([^`]+)`?$/,
  async function (type, language) {
    await ccdFormPage.click(type);
    await ccdFormPage.click("Continue", 0, 0, false);
    await ccdFormPage.waitForXpathElementVisible('//h1[contains(text(), "Select flag type")]');
    await ccdFormPage.click('Reasonable adjustment');
    await ccdFormPage.click("Continue", 0, 0, false);
    await ccdFormPage.waitForXpathElementVisible('//h1[contains(text(), "Reasonable adjustment")]');
    await ccdFormPage.click("I need help communicating and understanding");
    await ccdFormPage.click("Continue", 0, 0, false);
    await ccdFormPage.waitForXpathElementVisible('//h1[contains(text(), " I need help communicating and understanding")]');
    await ccdFormPage.click("Sign Language Interpreter");
    await ccdFormPage.click("Continue", 0, 0, false);
    await ccdFormPage.waitForXpathElementVisible('//label[contains(text(), "Sign Language Interpreter")]');
    await ccdFormPage.selectInterpreterLanguage(language);
    await browser.sleep(1000);
    await ccdFormPage.click("Continue", 0, 0, false);
    await ccdFormPage.waitForXpathElementVisible('//label[contains(text(), "Add comments for this flag")]');
    const isFlagComment = await browser.element(By.xpath(`//*[@id='flagComment']`)).isPresent();
    await ccdFormPage.typeText(
      isFlagComment ? 'flagComment' : 'flagComments',
      `just comment for sign languages`
    );
    await ccdFormPage.click("Continue", 0, 0, false);
    await ccdFormPage.waitForXpathElementVisible('//h2[contains(text(), "Review flag details")]');
    const currentUrl = await browser.getCurrentUrl();
    await ccdFormPage.click("Create Flag");
    await ccdFormPage.waitForConfirmationScreenAndContinue(currentUrl);
  }
);

Then(/^I will update s94b flag$/, async function () {
  await ccdFormPage.setFieldValue("Mark appeal as s94b?", "Yes");
  await ccdFormPage.click("Continue", 0, 0, false);
  await ccdFormPage.click("Submit");
});
Then(/^I Add the bail interpreter details$/, async function () {
  await ccdPage.click("Add new");
  await ccdFormPage.setFieldValue("Booking reference", "Test-32123");
  await ccdFormPage.setFieldValue("Given names", "David");
  await ccdFormPage.setFieldValue("Family name", "Test");
  await ccdFormPage.setFieldValue("Phone number", "09878999878");
  await ccdFormPage.setFieldValue("Email", "TestInterpreter@gmail.com");
  await ccdFormPage.setFieldValue(
    "Note (Optional)",
    "Adding new spoken or sign language intrpreter"
  );

  await ccdFormPage.click("Continue");

  await ccdFormPage.click("Update");
});
Then(/^I update interpreter booking status$/, async function () {
  await ccdFormPage.setFieldValue("Harri Pugh - Applicant - Korean", "Booked");
  await ccdFormPage.setFieldValue(
    "Harri Pugh - Applicant - British Sign Language (BSL)",
    "Booked"
  );
  await browser.sleep(3000);
  await ccdFormPage.setFieldValue("John Smith - FCS - Telugu", "Booked");
  await ccdFormPage.setFieldValue(
    "John Smith - FCS - British Sign Language (BSL)",
    "Requested"
  );
  await ccdFormPage.setFieldValue("Jane Doe - FCS - Hindi", "Requested");
  await ccdFormPage.setFieldValue(
    "Jane Doe - FCS - British Sign Language (BSL)",
    "Cancelled"
  );
  await ccdFormPage.click("Continue");
  await browser.sleep(3000);
  await ccdFormPage.click("Update");
});

Given("I wait for the spinner", async function () {
  await ccdPage.waitForSpinner();
});

Then(
  /^within the `?([^`]+)`? collection's first item, I should see case flag name `?([^`]+)`? and comments `?([^`]+)`? creation date `?([^`]+)`? last modified `?([^`]+)`? flag status `?([^`]+)`?$/,
  async function (
    partie,
    caseFlagName,
    comments = "",
    creationDate,
    lastModifiedDate,
    flagStatus
  ) {
    let field =
      '//caption[normalize-space()="' +
      partie +
      '"]' +
      '/ancestor::ccd-case-flag-table[position()=1]/table/tbody/tr/td[normalize-space()="' +
      caseFlagName +
      '"]' +
      "/ancestor::tr[position()=1]//td";
    lastModifiedDate = lastModifiedDate === " " ? "" : lastModifiedDate;
    let tds = await element.all(by.xpath(field));
    let tdCount = await element.all(by.xpath(field)).count();
    // let createdDate = await ccdPage.getTodayDate(creationDate);
    let ModifiedDate = await ccdPage.getTodayDate(lastModifiedDate);

    console.log("ModifiedDate:::" + ModifiedDate);
    for (let td = 0; td < tdCount; td++) {
      let tdValue = await tds[td];
      let caseFlagValue = JSON.stringify(await tdValue.getText()).trim();
      if (td === 0) {
        expect(JSON.stringify(caseFlagName).trim()).to.equal(caseFlagValue);
      }
      if (td === 1) {
        expect(comments.trim()).to.equal(caseFlagValue);
      }
      // if (td === 2) {
      //   expect(JSON.stringify(createdDate).trim()).to.equal(caseFlagValue);
      // }
      if (td === 3) {
        expect(JSON.stringify(ModifiedDate).trim()).to.equal(caseFlagValue);
      }
      if (td === 4) {
        expect(JSON.stringify(flagStatus).trim()).to.equal(caseFlagValue);
      }
    }
  }
);
