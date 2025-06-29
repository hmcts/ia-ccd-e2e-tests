import { Given, Then } from "cucumber";
import { expect } from "chai";
import { Wait } from "../../../enums/wait";
import { CcdPage } from "../../../pages/ccd.page";
import { SubmitHearingRequirementsFlow } from "../../../flows/submit-hearing-requirements.flow";
import { CcdFormPage } from "../../../pages/ccd-form.page";

const submitHearingRequirementsFlow = new SubmitHearingRequirementsFlow();
const ccdPage = new CcdPage();
const ccdFormPage = new CcdFormPage();

Then(/^I submit hearing requirements with all no$/, async function () {
  await submitHearingRequirementsFlow.submitHearingRequirements(true, false);
});

Then(
  /^I submit hearing requirements with all no when (in|out of) country$/,
  async function (inOrOutOfCountry) {
    const inCountry = inOrOutOfCountry === "in";

    if (inCountry) {
      await submitHearingRequirementsFlow.submitHearingRequirementsForInOutOfCountry(
        true,
        false,
        true
      );
    } else {
      await submitHearingRequirementsFlow.submitHearingRequirementsForInOutOfCountry(
        true,
        false,
        false
      );
    }
  }
);

Then(/^I update hearing requirements with all no$/, async function () {
  await submitHearingRequirementsFlow.updateHearingRequirements(true, false);
});

Then(/^I submit hearing requirements with all yes$/, async function () {
  await submitHearingRequirementsFlow.submitHearingRequirements(true, true);
});

Then(
  /^I submit hearing requirements with all yes when (in|out of) country$/,
  async function (inOrOutOfCountry) {
    const inCountry = inOrOutOfCountry === "in";

    if (inCountry) {
      await submitHearingRequirementsFlow.submitHearingRequirementsForInOutOfCountry(
        true,
        true,
        true
      );
    } else {
      await submitHearingRequirementsFlow.submitHearingRequirementsForInOutOfCountry(
        true,
        true,
        false
      );
    }
  }
);

Then(/^I update hearing requirements with all yes$/, async function () {
  await submitHearingRequirementsFlow.updateHearingRequirements(true, true);
});

Then(
  /^I update hearing requirements with all yes when (in|out of) country$/,
  async function (inOrOutOfCountry) {
    const inCountry = inOrOutOfCountry === "in";

    if (inCountry) {
      await submitHearingRequirementsFlow.updateHearingRequirementsForInOutOfCountry(
        true,
        true,
        true
      );
    } else {
      await submitHearingRequirementsFlow.updateHearingRequirementsForInOutOfCountry(
        true,
        true,
        false
      );
    }
  }
);

Then(
  /^I update hearing requirements with all no when (in|out of) country$/,
  async function (inOrOutOfCountry) {
    const inCountry = inOrOutOfCountry === "in";

    if (inCountry) {
      await submitHearingRequirementsFlow.updateHearingRequirementsForInOutOfCountry(
        true,
        false,
        true
      );
    } else {
      await submitHearingRequirementsFlow.updateHearingRequirementsForInOutOfCountry(
        true,
        false,
        false
      );
    }
  }
);

Then(
  /^I should (see|not see) the hearing requirements (yes|no) path$/,
  async function (seeOrNotSee, yesOrNo) {
    const isDisplayed = seeOrNotSee === "see";
    const isYesPath = yesOrNo === "yes";

    expect(
      await ccdPage.headingContains("Hearing requirements", isDisplayed)
    ).to.equal(isDisplayed);
    if (isDisplayed) {
      if (isYesPath) {
        expect(
          await ccdPage.isFieldValueDisplayed(
            "Will the appellant give oral evidence at the hearing?",
            "Yes"
          )
        ).to.equal(true);
        expect(
          await ccdPage.isFieldValueDisplayed(
            "Will the appellant attend the hearing?",
            "Yes"
          )
        ).to.equal(true);
        expect(
          await ccdPage.isFieldValueDisplayed(
            "Will any witnesses attend the hearing?",
            "Yes"
          )
        ).to.equal(true);
        expect(await ccdPage.contentContains("Name", Wait.instant)).to.equal(
          true
        );
        expect(
          await ccdPage.isFieldValueDisplayed(
            "How many witnesses will attend?",
            "1"
          )
        ).to.equal(true);
        expect(
          await ccdPage.isFieldValueDisplayed(
            "Do you need interpreter services on the day?",
            "Yes"
          )
        ).to.equal(true);
        expect(
          await ccdPage.isFieldValueDisplayed(
            "Do you need a hearing room with step-free access?",
            "Yes"
          )
        ).to.equal(true);
        expect(
          await ccdPage.isFieldValueDisplayed(
            "Do you need a hearing loop?",
            "Yes"
          )
        ).to.equal(true);
        expect(
          await ccdPage.contentContains("Language", Wait.instant)
        ).to.equal(true);
        expect(await ccdPage.contentContains("Dialect", Wait.instant)).to.equal(
          true
        );
        expect(await ccdPage.contentContains("Date", Wait.instant)).to.equal(
          true
        );
        expect(await ccdPage.contentContains("Reason", Wait.instant)).to.equal(
          true
        );
      } else {
        expect(
          await ccdPage.isFieldValueDisplayed(
            "Will the appellant give oral evidence at the hearing?",
            "No"
          )
        ).to.equal(true);
        expect(
          await ccdPage.isFieldValueDisplayed(
            "Will the appellant attend the hearing?",
            "No"
          )
        ).to.equal(true);
        expect(
          await ccdPage.isFieldValueDisplayed(
            "Will any witnesses attend the hearing?",
            "No"
          )
        ).to.equal(true);
        expect(
          await ccdPage.isFieldValueDisplayed(
            "Do you need interpreter services on the day?",
            "No"
          )
        ).to.equal(true);
        expect(
          await ccdPage.isFieldValueDisplayed(
            "Do you need a hearing room with step-free access?",
            "No"
          )
        ).to.equal(true);
        expect(
          await ccdPage.isFieldValueDisplayed(
            "Do you need a hearing loop?",
            "No"
          )
        ).to.equal(true);
      }
    } else {
      expect(
        await ccdPage.contentContains(
          "Will the appellant give oral evidence at the hearing?",
          Wait.instant
        )
      ).to.equal(false);
      expect(
        await ccdPage.contentContains(
          "Will the appellant attend the hearing?",
          Wait.instant
        )
      ).to.equal(false);
      expect(
        await ccdPage.contentContains(
          "Will any witnesses attend the hearing?",
          Wait.instant
        )
      ).to.equal(false);
      expect(await ccdPage.contentContains("Name", Wait.instant)).to.equal(
        false
      );
      expect(
        await ccdPage.contentContains(
          "How many witnesses will attend?",
          Wait.instant
        )
      ).to.equal(false);
      expect(
        await ccdPage.contentContains(
          "Do you need interpreter services on the day?",
          Wait.instant
        )
      ).to.equal(false);
      expect(await ccdPage.contentContains("Language", Wait.instant)).to.equal(
        false
      );
      expect(await ccdPage.contentContains("Dialect", Wait.instant)).to.equal(
        false
      );
      expect(
        await ccdPage.contentContains(
          "Do you need a hearing room with step-free access?",
          Wait.instant
        )
      ).to.equal(false);
      expect(
        await ccdPage.contentContains(
          "Do you need a hearing loop?",
          Wait.instant
        )
      ).to.equal(false);
      expect(await ccdPage.contentContains("Date")).to.equal(false);
      expect(await ccdPage.contentContains("Reason")).to.equal(false);
    }
  }
);

Then(
  /^I should (see|not see) the reheard hearing requirements (yes|no) path$/,
  async function (seeOrNotSee, yesOrNo) {
    const isDisplayed = seeOrNotSee === "see";
    const isYesPath = yesOrNo === "yes";

    expect(
      await ccdPage.headingContains("Hearing requirements", isDisplayed)
    ).to.equal(isDisplayed);
    if (isDisplayed) {
      if (isYesPath) {
        expect(
          await ccdPage.isFieldValueDisplayed(
            "Will the appellant attend the hearing?",
            "Yes"
          )
        ).to.equal(true);
        expect(
          await ccdPage.isFieldValueDisplayed(
            "Will the appellant give oral evidence at the hearing?",
            "Yes"
          )
        ).to.equal(true);
        expect(
          await ccdPage.isFieldValueDisplayed(
            "Will any witnesses attend the hearing?",
            "Yes"
          )
        ).to.equal(true);
        expect(
          await ccdPage.isFieldValueDisplayed(
            "How many witnesses will attend?",
            "1"
          )
        ).to.equal(true);
        expect(
          await ccdPage.isFieldValueDisplayed("Name", "Jenny button")
        ).to.equal(true);
        expect(
          await ccdPage.isFieldValueDisplayed(
            "Do you need interpreter services on the day?",
            "Yes"
          )
        ).to.equal(true);
        expect(
          await ccdPage.isFieldValueDisplayed("Language", "Zulu")
        ).to.equal(true);
        expect(
          await ccdPage.isFieldValueDisplayed("Dialect", "Kwabe")
        ).to.equal(true);
        expect(
          await ccdPage.isFieldValueDisplayed(
            "Do you need a hearing room with step-free access?",
            "Yes"
          )
        ).to.equal(true);
        expect(
          await ccdPage.isFieldValueDisplayed(
            "Do you need a hearing loop?",
            "Yes"
          )
        ).to.equal(true);
      } else {
        expect(
          await ccdPage.isFieldValueDisplayed(
            "Will the appellant give oral evidence at the hearing?",
            "No"
          )
        ).to.equal(true);
        expect(
          await ccdPage.isFieldValueDisplayed(
            "Will the appellant attend the hearing?",
            "No"
          )
        ).to.equal(true);
        expect(
          await ccdPage.isFieldValueDisplayed(
            "Will any witnesses attend the hearing?",
            "No"
          )
        ).to.equal(true);
        expect(
          await ccdPage.isFieldValueDisplayed(
            "Do you need interpreter services on the day?",
            "No"
          )
        ).to.equal(true);
        expect(
          await ccdPage.isFieldValueDisplayed(
            "Do you need a hearing room with step-free access?",
            "No"
          )
        ).to.equal(true);
        expect(
          await ccdPage.isFieldValueDisplayed(
            "Do you need a hearing loop?",
            "No"
          )
        ).to.equal(true);
      }
    } else {
      expect(
        await ccdPage.contentContains(
          "Will the appellant give oral evidence at the hearing?",
          Wait.instant
        )
      ).to.equal(false);
      expect(
        await ccdPage.contentContains(
          "Will the appellant attend the hearing?",
          Wait.instant
        )
      ).to.equal(false);
      expect(
        await ccdPage.contentContains(
          "Will any witnesses attend the hearing?",
          Wait.instant
        )
      ).to.equal(false);
      expect(await ccdPage.contentContains("Name", Wait.instant)).to.equal(
        false
      );
      expect(
        await ccdPage.contentContains(
          "How many witnesses will attend?",
          Wait.instant
        )
      ).to.equal(false);
      expect(
        await ccdPage.contentContains(
          "Do you need interpreter services on the day?",
          Wait.instant
        )
      ).to.equal(false);
      expect(await ccdPage.contentContains("Language", Wait.instant)).to.equal(
        false
      );
      expect(await ccdPage.contentContains("Dialect", Wait.instant)).to.equal(
        false
      );
      expect(
        await ccdPage.contentContains(
          "Do you need a hearing room with step-free access?",
          Wait.instant
        )
      ).to.equal(false);
      expect(
        await ccdPage.contentContains(
          "Do you need a hearing loop?",
          Wait.instant
        )
      ).to.equal(false);
    }
  }
);

Given(
  /^I select `?([^\s`]+)`? for Remote hearing with details `?([^`]+)`?$/,
  async function (isYesPath, details) {
    await submitHearingRequirementsFlow.setRemoteHearingRequirement(
      true,
      isYesPath,
      details
    );
  }
);

Given(/^I add the `?([^`]+)`? hearing location$/, async function (location) {
  await submitHearingRequirementsFlow.setHearingLocation(true, location);
});
Given(/^I add the `?([^`]+)`? bail hearing location$/, async function (location) {
  await submitHearingRequirementsFlow.setBailsHearingLocation(true, location);
});
Then(/^I Add the interpreter details$/, async function () {
  await ccdPage.click("Add new");
  await ccdFormPage.setFieldValue("Booking reference", "Test-32123");
  await ccdFormPage.setFieldValue("Given names", "Thomas");
  await ccdFormPage.setFieldValue("Family name", "chals");
  await ccdFormPage.setFieldValue("Phone number", "09878999878");
  await ccdFormPage.setFieldValue("Email", "TestInterpreter@gmail.com");
  await ccdFormPage.setFieldValue(
    "Note (Optional)",
    "Adding new spoken or sign language intrpreter"
  );

  await ccdFormPage.click("Continue");

  await ccdFormPage.click("Update");
});
// When(/^I add the `?([^`]+)`? hearing location$/, async function (location) {
//   await submitHearingRequirementsFlow.setHearingLocation(true, location);
// });

Then(/^I select how each of the ?([0-9]+)? participants will attend the hearing$/, async function (numberOfParticipants: number) {
  await submitHearingRequirementsFlow.selectParticipantAttendingMethods(numberOfParticipants);
});

Then(/^I select No for specific judge question with `?([^`]+)`? judge type$/, async function (judgeType: string) {
  await submitHearingRequirementsFlow.noSpecificJudge(judgeType);
});
