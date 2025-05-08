import { CcdPage } from "../../pages/ccd.page";
import { Given, Then, When } from "cucumber";
import { browser, by, element, protractor } from "protractor";
import { expect } from "chai";
import { Wait } from "../../enums/wait";
import { OrdinalToCardinal } from "../../helpers/ordinal-to-cardinal";
import { CcdFormPage } from "../../pages/ccd-form.page";

const ccdPage = new CcdPage();
const ccdFormPage = new CcdFormPage();
const iaConfig = require("../../ia.conf");

Given("I create a new case", async function () {
  await ccdPage.acceptCookies();
  // there is loading mask with spinner added by ExUI
  // let EC = protractor.ExpectedConditions;
  // await browser.get(iaConfig.CcdWebUrl + "/cases");
  // try {
  //   await browser.wait(
  //     EC.visibilityOf(element(by.css("div.spinner-container"))),
  //     40000,
  //     "Spinner did not appear."
  //   );
  // } catch {
  //   browser.refresh();
  //   await browser.wait(
  //     EC.visibilityOf(element(by.css("div.spinner-container"))),
  //     40000,
  //     "Spinner did not appear."
  //   );
  // }
  // await ccdPage.waitForSpinner();
    await ccdPage.click("Apply");
    await browser.sleep(5000);
  await ccdPage.linkContains("Create case");
  await ccdPage.runAccessbility();
  await ccdPage.createCaseClickable();
  await ccdPage.click("Create case");
  expect(await ccdPage.headingContains("Create Case")).to.equal(true);
  await ccdPage.runAccessbility();
  await ccdPage.hideErrorMessages();
  await ccdPage.doesDropdownHaveValues("Jurisdiction");
  await ccdFormPage.setFieldValue("Jurisdiction", "Immigration & Asylum");
  await ccdPage.doesDropdownHaveValues("Case type");

  if (iaConfig.CcdWebUrl.includes("xui-ia-case-api-pr")) {
    await ccdFormPage.setFieldValue("Case type", "Appeal* ia-ccd-definit");
  } else if (
    iaConfig.CcdWebUrl.includes("aat") ||
    iaConfig.CcdWebUrl.includes("pr")
  ) {
    await ccdFormPage.setFieldValue("Case type", "Appeal* master");
  } else if (iaConfig.CcdWebUrl.includes("demo")) {
    await ccdFormPage.setFieldValue("Case type", "Appeal* ia-ccd-definit");
  } else if (iaConfig.CcdWebUrl.includes("pr-")) {
    await ccdFormPage.setFieldValue("Case type", "Appeal* ia-ccd-definit");
  }

  await ccdPage.doesDropdownHaveValues("Event");
  await ccdPage.isButtonEnabled("Start");
  await ccdPage.click("Start");
});

Given("I create a new bail application", async function () {
  await ccdPage.acceptCookies();
  // there is loading mask with spinner added by ExUI
  await browser.get(iaConfig.CcdWebUrl + "/cases");
  let EC = protractor.ExpectedConditions;
  try {
    await browser.wait(
      EC.visibilityOf(element(by.css("div.spinner-container"))),
      30000,
      "Spinner did not appear."
    );
  } catch {
    browser.refresh();
    await browser.wait(
      EC.visibilityOf(element(by.css("div.spinner-container"))),
      30000,
      "Spinner did not appear."
    );
  }
  await ccdPage.waitForSpinner();
  await ccdPage.linkContains("Create case");
  await ccdPage.runAccessbility();
  await ccdPage.createCaseClickable();
  await ccdPage.click("Create case");
  expect(await ccdPage.headingContains("Create Case")).to.equal(true);
  await ccdPage.runAccessbility();
  await ccdPage.hideErrorMessages();
  await ccdPage.doesDropdownHaveValues("Jurisdiction");
  await ccdFormPage.setFieldValue("Jurisdiction", "Immigration & Asylum");
  await ccdPage.doesDropdownHaveValues("Case type");

  if (iaConfig.CcdWebUrl.includes("aat") || iaConfig.CcdWebUrl.includes("pr")) {
    await ccdFormPage.setFieldValue("Case type", "Bail* master");
  } else if (iaConfig.CcdWebUrl.includes("demo")) {
    await ccdFormPage.setFieldValue("Case type", "Bail* ia-bail-ccd-de");
  }

  await ccdPage.doesDropdownHaveValues("Event");
  await ccdPage.isButtonEnabled("Start");
  await ccdPage.click("Start");
});

Given("I Apply case list filter", async function () {
  // there is loading mask with spinner added by ExUI
  await browser.sleep(10000);

  expect(await ccdPage.headingContains("Case list")).to.equal(true);
  await ccdPage.runAccessbility();
  await ccdPage.doesDropdownHaveValues("Jurisdiction");
  await ccdFormPage.setFieldValue("Jurisdiction", "Immigration & Asylum");
  await ccdPage.doesDropdownHaveValues("Case type");
  if (iaConfig.CcdWebUrl.includes("aat") || iaConfig.CcdWebUrl.includes("pr")) {
    await ccdFormPage.setFieldValue("Case type", "Appeal* master");
  } else if (iaConfig.CcdWebUrl.includes("demo")) {
    await ccdFormPage.setFieldValue("Case type", "Appeal* ia-ccd-definit");
  }
  await ccdPage.doesDropdownHaveValues("State");
  await ccdFormPage.setFieldValue("State", "Any");
  await ccdPage.isButtonEnabled("Apply");
  await ccdPage.click("Apply");
});

Given("I Apply case list filter for Bails", async function () {
  // there is loading mask with spinner added by ExUI
  await browser.sleep(5000);

  expect(await ccdPage.headingContains("Case list")).to.equal(true);
  await ccdPage.runAccessbility();
  await ccdPage.doesDropdownHaveValues("Jurisdiction");
  await ccdFormPage.setFieldValue("Jurisdiction", "Immigration & Asylum");
  await ccdPage.doesDropdownHaveValues("Case type");
  if (iaConfig.CcdWebUrl.includes("aat") || iaConfig.CcdWebUrl.includes("pr")) {
    await ccdFormPage.setFieldValue("Case type", "Bail* master");
  } else if (iaConfig.CcdWebUrl.includes("demo")) {
    await ccdFormPage.setFieldValue("Case type", "Bail* ia-bail-ccd-de");
  }

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
    expect(await ccdPage.imgSrcContains(match, shortWait)).to.equal(
      seeOrNotSee === "see"
    );
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
  /^I (?:should |)(see|not see) the `?([^`]+)`? (?:button|link|tab|label)$/,
  async function (seeOrNotSee, linkText) {
    const shortWait = seeOrNotSee === "not see";
    expect(await ccdPage.linkContains(linkText, shortWait)).to.equal(
      seeOrNotSee === "see"
    );
  }
);

Then("I should be on the overview page", async function () {
  await ccdPage.waitForOverviewPage();
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
    await ccdPage.gotoTabs(linkText);
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
Then(/^I will make `?([^`]+)`? as In Active$/, async function (flagtype) {
  await ccdFormPage.click(flagtype);
  await ccdFormPage.click("Next");
  await ccdFormPage.typeText(
    `flagComments`,
    `test case flage make it inactive`
  );
  await ccdFormPage.click("Make inactive");
  await ccdFormPage.click("Next");
  await ccdFormPage.click("Manage Flags");
});

Then(
  /^I have created a `?([^`]+)`? Flag in `?([^`]+)`?$/,
  async function (flag, type) {
    await browser.sleep(8000);
    await ccdFormPage.click(type);
    await ccdFormPage.click("Next");
    await browser.sleep(3000);
    await ccdFormPage.click(flag);
    await ccdFormPage.click("Next");
    await ccdFormPage.click("Next");
    await ccdFormPage.click("Create Flag");
  }
);
Then(
  /^I have created a `?([^`]+)`? Flag in `?([^`]+)`? and language name is `?([^`]+)`?$/,
  async function (flag, type, language) {
    await ccdFormPage.click(type);
    await ccdFormPage.click("Next");
    await browser.sleep(3000);
    await ccdFormPage.click(flag);
    await ccdFormPage.click("Next");
    await ccdFormPage.selectInterpreterLanguage(language);
    await browser.sleep(3000);
    await ccdFormPage.click("Next");
    await ccdFormPage.typeText(
      `flagComment`,
      `just comment for interpreter languages`
    );
    await ccdFormPage.click("Next");
    await ccdFormPage.click("Create Flag");
  }
);
Then(
  /^I have created a `?([^`]+)`? Flag in `?([^`]+)`? and signlanguage name is `?([^`]+)`?$/,
  async function (flag, type, language) {
    await ccdFormPage.click(type);
    await ccdFormPage.click("Next");
    await browser.sleep(3000);
    await ccdFormPage.click(flag);
    await ccdFormPage.click("Next");
    await ccdFormPage.click("I need help communicating and understanding");
    await browser.sleep(3000);
    await ccdFormPage.click("Next");
    await ccdFormPage.click("Sign Language Interpreter");
    await browser.sleep(3000);
    await ccdFormPage.click("Next");
    await ccdFormPage.selectInterpreterLanguage(language);
    await ccdFormPage.click("Next");
    await ccdFormPage.typeText(
      `flagComments`,
      `just comment for interpreter languages`
    );
    await ccdFormPage.click("Next");
    await ccdFormPage.click("Create Flag");
  }
);

Then(/^I will update s94b flag$/, async function () {
  await ccdFormPage.setFieldValue("Mark appeal as s94b?", "Yes");
  await ccdFormPage.click("Continue");
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
    let tds = await element.all(by.xpath(field));
    let tdCount = await element.all(by.xpath(field)).count();
    let createdDate = await ccdPage.getTodayDate(creationDate);
    let ModifiedDate = await ccdPage.getTodayDate(lastModifiedDate);

    console.log("ModifiedDate:::" + ModifiedDate);
    for (let td = 0; td < tdCount; td++) {
      let tdValue = await tds[td];
      let caseFlagValue = JSON.stringify(await tdValue.getText());
      if (td === 0) {
        expect(JSON.stringify(caseFlagName)).to.equal(caseFlagValue);
      }
      if (td === 1) {
        expect(comments).to.equal(caseFlagValue);
      }
      if (td === 2) {
        expect(JSON.stringify(createdDate)).to.equal(caseFlagValue);
      }
      if (td === 3) {
        expect(JSON.stringify(ModifiedDate)).to.equal(caseFlagValue);
      }
      if (td === 4) {
        expect(JSON.stringify(flagStatus)).to.equal(caseFlagValue);
      }
    }
  }
);
