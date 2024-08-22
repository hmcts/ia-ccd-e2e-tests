import { CcdFormPage } from "../pages/ccd-form.page";
import { browser } from "protractor";

const isOutOfCountryEnabled =
  require("../ia.conf").isOutOfCountryEnabled === "true";

export class SubmitHearingRequirementsFlow {
  private ccdFormPage = new CcdFormPage();

  async submitHearingRequirements(clickContinue = false, isYesPath = false) {
    await this.ccdFormPage.selectNextStep("Submit hearing requirements");
    let overviewUrl = await browser.getCurrentUrl();
    await this.ccdFormPage.flakeyClick("Go", overviewUrl);
    await this.ccdFormPage.waitForSpinner();

    await this.ccdFormPage.headingContains("Submit hearing requirements");

    if (isYesPath) {
      await this.hearingRequirementsYesPath();
    } else {
      await this.hearingRequirementsNoPath();
    }
    await this.ccdFormPage.click("Submit");

    if (clickContinue) {
      await this.ccdFormPage.click("Close and Return to case details");
    }
  }

  async submitHearingRequirementsForInOutOfCountry(
    clickContinue = false,
    isYesPath = false,
    inCountry = true
  ) {
    await this.ccdFormPage.selectNextStep("Submit hearing requirements");
    let overviewUrl = await browser.getCurrentUrl();
    await this.ccdFormPage.flakeyClick("Go", overviewUrl);
    await this.ccdFormPage.waitForSpinner();

    // await this.ccdFormPage.headingContains('Submit hearing requirements');
    if (isYesPath) {
      if (inCountry) {
        await this.hearingRequirementsYesPathForInOutOfCountry(true);
      } else {
        await this.hearingRequirementsYesPathForInOutOfCountry(false);
      }
    } else {
      if (inCountry) {
        await this.hearingRequirementsNoPathForInOutOfCountry(true);
      } else {
        await this.hearingRequirementsNoPathForInOutOfCountry(false);
      }
    }

    await this.ccdFormPage.click("Submit");

    if (clickContinue) {
      await this.ccdFormPage.click("Close and Return to case details");
    }
  }

  async updateHearingRequirements(clickContinue = false, isYesPath = false) {
    await this.ccdFormPage.selectNextStep("Update hearing requirements");
    let overviewUrl = await browser.getCurrentUrl();
    await this.ccdFormPage.flakeyClick("Go", overviewUrl);
    await this.ccdFormPage.waitForSpinner();

    if (isYesPath) {
      await this.updateHearingRequirementsYesPath();
    } else {
      await this.hearingRequirementsNoPath();
    }

    await this.ccdFormPage.click("Update");

    if (clickContinue) {
      await this.ccdFormPage.click("Close and Return to case details");
    }
  }

  async updateHearingRequirementsForInOutOfCountry(
    clickContinue = false,
    isYesPath = false,
    inCountry = true
  ) {
    await this.ccdFormPage.selectNextStep("Update hearing requirements");
    let overviewUrl = await browser.getCurrentUrl();
    await this.ccdFormPage.flakeyClick("Go", overviewUrl);
    await this.ccdFormPage.waitForSpinner();

    if (isYesPath) {
      if (inCountry) {
        await this.updateHearingRequirementsYesPathForInOutOfCountry(
          true,
          true
        );
      } else {
        await this.updateHearingRequirementsYesPathForInOutOfCountry(
          false,
          true
        );
      }
    } else {
      if (inCountry) {
        await this.hearingRequirementsNoPathForInOutOfCountry(true);
      } else {
        await this.hearingRequirementsNoPathForInOutOfCountry(false);
      }
    }

    await this.ccdFormPage.click("Update");

    if (clickContinue) {
      await this.ccdFormPage.click("Close and Return to case details");
    }
  }

  async hearingRequirementsYesPath() {
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Will the appellant attend the hearing?",
      "Yes"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Will the appellant give oral evidence at the hearing?",
      "Yes"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Will any witnesses attend the hearing?",
      "Yes"
    );
    await browser.sleep(5000);
<<<<<<< HEAD
    await this.ccdFormPage.click("Add new");
    await this.ccdFormPage.setFieldValue("Name", "Jenny button");
    await this.ccdFormPage.click("Continue");
    await this.ccdFormPage.setFieldValue(
      "Will the appellant or anyone else be giving oral evidence from outside the United Kingdom?",
      "Yes"
    );
    await this.ccdFormPage.click("Continue");
=======
    await this.ccdFormPage.click('Add new');
    //await this.ccdFormPage.setFieldValue('Name', 'Jenny button');
    await this.ccdFormPage.setFieldValue('Given names', 'Jenny');
    await this.ccdFormPage.setFieldValue('Family name', 'button');
    await this.ccdFormPage.click('Continue');
    await this.ccdFormPage.setFieldValue('Will the appellant or anyone else be giving oral evidence from outside the United Kingdom?', 'Yes');
    await this.ccdFormPage.click('Continue');
>>>>>>> 69d1bb5 (fixes to run against pr.)

    await this.ccdFormPage.setFieldValue(
      "Do you need interpreter services on the day?",
      "Yes"
    );
    await browser.sleep(1000);
    await this.ccdFormPage.click("Add new");
    await this.ccdFormPage.setFieldValue("Language", "Zulu");
    await this.ccdFormPage.setFieldValue("Dialect", "Kwabe");
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Do you need a hearing room with step-free access?",
      "Yes"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue("Do you need a hearing loop?", "Yes");
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.click("Continue");

    await this.setRemoteHearingRequirement(
      true,
      "Yes",
      "The appellant has good internet connectivity and a laptops"
    );

    await this.ccdFormPage.setFieldValue(
      "Does the appellant have any physical or mental health issues that may impact them on the day?",
      "Yes"
    );
    await this.ccdFormPage.setFieldValue(
      "Explain in detail how any physical or mental health issues may affect them on the day.",
      "The appellant is deaf in one ear",
      "text area"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Has the appellant had any past experiences that may impact them on the day?",
      "Yes"
    );
    await this.ccdFormPage.setFieldValue(
      "Explain in detail how any past experiences may affect them on the day?",
      "The appellant is fearful of the law",
      "text area"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Do you have multimedia evidence?",
      "Yes"
    );
    await this.ccdFormPage.setFieldValue(
      "You should provide the equipment to play this evidence. If this is not possible, explain why and what equipment you'll need to play it.",
      "The appellant has a video recording on a memory stick which needs to be played on a computer",
      "text area"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Does the appellant need a single-sex court?",
      "Yes"
    );
    await this.ccdFormPage.click("Continue");
    await this.ccdFormPage.setFieldValue(
      "What type of court do they need?",
      "All female"
    );
    await this.ccdFormPage.setFieldValue(
      "Explain in detail why the appellant needs a single-sex court.",
      "The appellant is fearful of men",
      "text area"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Does the appellant need an in camera court?",
      "Yes"
    );
    await this.ccdFormPage.setFieldValue(
      "Explain in detail why the appellant needs an in camera court.",
      "The appellant is afraid of the general public",
      "text area"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Is there anything else you would like to request?",
      "Yes"
    );
    await this.ccdFormPage.setFieldValue(
      "Provide details of any additional requests and why they are necessary.",
      "The appellant would like fresh orange juice and doughnuts",
      "text area"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Are there any dates that the appellant or their on-day representation cannot attend?",
      "Yes"
    );
    await browser.sleep(1000);
    await this.ccdFormPage.click("Add new");
    await browser.sleep(500);
    await this.ccdFormPage.setFieldValue("Date", "31-12-2019");
    await this.ccdFormPage.setFieldValue(
      "Reason",
      "New year's eve",
      "text area"
    );

    await this.ccdFormPage.click("Continue");
  }

  async hearingRequirementsYesPathForInOutOfCountry(isInCountry = true) {
    await this.ccdFormPage.click("Continue");

    if (isInCountry) {
      await this.ccdFormPage.setFieldValue(
        "Will the appellant attend the hearing?",
        "Yes"
      );
      await this.ccdFormPage.click("Continue");

      await this.ccdFormPage.setFieldValue(
        "Will the appellant give oral evidence at the hearing?",
        "Yes"
      );
      await this.ccdFormPage.click("Continue");

      await this.ccdFormPage.setFieldValue(
        "Will any witnesses attend the hearing?",
        "Yes"
      );
      await browser.sleep(2000);
<<<<<<< HEAD
      await this.ccdFormPage.click("Add new");
      await browser.sleep(2000);
      await this.ccdFormPage.setFieldValue("Given names", "Jenny Bat");
      await this.ccdFormPage.setFieldValue("Family name", "1");
      await this.ccdFormPage.click("Add new");
      await browser.sleep(2000);
      await this.ccdFormPage.typeText("witnessDetails_1_witnessName", "krish");
      await this.ccdFormPage.typeText(
        "witnessDetails_1_witnessFamilyName",
        "2"
      );
      await this.ccdFormPage.click("Add new");
      await browser.sleep(2000);
      await this.ccdFormPage.typeText("witnessDetails_2_witnessName", "ramesh");
      await this.ccdFormPage.typeText(
        "witnessDetails_2_witnessFamilyName",
        "3"
      );
      await this.ccdFormPage.click("Add new");
      await browser.sleep(2000);
      await this.ccdFormPage.typeText("witnessDetails_3_witnessName", "Mat");
      await this.ccdFormPage.typeText(
        "witnessDetails_3_witnessFamilyName",
        "4"
      );
      await this.ccdFormPage.click("Continue");
=======
      await this.ccdFormPage.click('Add new');
    //await this.ccdFormPage.setFieldValue('Name', 'Jenny button');
      await this.ccdFormPage.setFieldValue('Given names', 'Jenny');
      await this.ccdFormPage.setFieldValue('Family name', 'button');
      await this.ccdFormPage.click('Continue');
>>>>>>> 69d1bb5 (fixes to run against pr.)

      await this.ccdFormPage.setFieldValue(
        "Will the appellant or anyone else be giving oral evidence from outside the United Kingdom?",
        "Yes"
      );
      await this.ccdFormPage.click("Continue");
    } else {
      await this.ccdFormPage.setFieldValue(
        "Will the appellant or anyone else be giving oral evidence from outside the United Kingdom?",
        "Yes"
      );
      await this.ccdFormPage.click("Continue");

      await this.ccdFormPage.setFieldValue(
        "Will any witnesses attend the hearing?",
        "Yes"
      );
      await browser.sleep(2000);
<<<<<<< HEAD
      await this.ccdFormPage.click("Add new");
      await browser.sleep(2000);
      await this.ccdFormPage.setFieldValue("Given names", "Jenny Bat");
      await this.ccdFormPage.setFieldValue("Family name", "1");
      await this.ccdFormPage.click("Add new");
      await browser.sleep(2000);
      await this.ccdFormPage.typeText("witnessDetails_1_witnessName", "krish");
      await this.ccdFormPage.typeText(
        "witnessDetails_1_witnessFamilyName",
        "2"
      );
      await browser.sleep(5000);
      await this.ccdFormPage.click("Add new");
      await browser.sleep(2000);
      await this.ccdFormPage.typeText("witnessDetails_2_witnessName", "ramesh");
      await this.ccdFormPage.typeText(
        "witnessDetails_2_witnessFamilyName",
        "3"
      );
      await this.ccdFormPage.click("Add new");
      await browser.sleep(2000);
      await this.ccdFormPage.typeText("witnessDetails_3_witnessName", "Mat");
      await this.ccdFormPage.typeText(
        "witnessDetails_3_witnessFamilyName",
        "4"
      );
      await this.ccdFormPage.click("Continue");
=======
      await this.ccdFormPage.click('Add new');
    //await this.ccdFormPage.setFieldValue('Name', 'Jenny button');
      await this.ccdFormPage.setFieldValue('Given names', 'Jenny');
      await this.ccdFormPage.setFieldValue('Family name', 'button');
      await this.ccdFormPage.click('Continue');
>>>>>>> 69d1bb5 (fixes to run against pr.)
    }

    await this.ccdFormPage.setFieldValue(
      "Will the appellant need a spoken or sign language interpreter at the hearing?",
      "Yes"
    );
    await this.ccdFormPage.click("Continue");

    await browser.sleep(2000);
    await this.ccdFormPage.click("Spoken language interpreter");
    await this.ccdFormPage.click("Sign language interpreter");
    await this.ccdFormPage.click("Continue");
    await this.ccdFormPage.setFieldValue("Spoken language", "Korean");
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Sign language",
      "British Sign Language (BSL)"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Will any of the witnesses require a spoken or sign language interpreter at the hearing?",
      "Yes"
    );
    await browser.sleep(1000);
    await this.ccdFormPage.click("Continue");
    await browser.sleep(1000);

    // await this.ccdFormPage.click('Jenny Bat 1');
    await browser.sleep(1000);

    await this.ccdFormPage.setFieldValue(
      "What kind of interpreter does Jenny Bat 1 need? (Optional)",
      "Spoken language interpreter"
    );

    await this.ccdFormPage.setFieldValue(
      "What kind of interpreter does Jenny Bat 1 need? (Optional)",
      "Sign language interpreter"
    );

    // await this.ccdFormPage.click('krish 2');
    await browser.sleep(1000);

    await this.ccdFormPage.setFieldValue(
      "What kind of interpreter does krish 2 need? (Optional)",
      "Spoken language interpreter"
    );

    await this.ccdFormPage.setFieldValue(
      "What kind of interpreter does krish 2 need? (Optional)",
      "Sign language interpreter"
    );

    // await this.ccdFormPage.click('ramesh 3');
    await browser.sleep(1000);

    await this.ccdFormPage.setFieldValue(
      "What kind of interpreter does ramesh 3 need? (Optional)",
      "Sign language interpreter"
    );

    await this.ccdFormPage.click("Continue");
    await browser.sleep(1000);

    await this.ccdFormPage.setFieldValue("Spoken language", "Brong");
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue("Sign language", "Lipspeaker");
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue("Spoken language", "Akan");
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue("Sign language", "Notetaker");
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Sign language",
      "Visual frame signing"
    );
    await this.ccdFormPage.click("Continue");

    // await this.ccdFormPage.setFieldValue(
    //     'Spoken language',
    //     'Telugu'
    // );
    // await this.ccdFormPage.click('Continue');

    await this.ccdFormPage.setFieldValue(
      "Do you need a hearing room with step-free access?",
      "Yes"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue("Do you need a hearing loop?", "Yes");
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.click("Continue");

    await this.setRemoteHearingRequirementForInOutOfCountryForInOutOfCountry(
      true,
      "Yes",
      "The appellant has good internet connectivity and a laptops"
    );

    await this.ccdFormPage.setFieldValue(
      "Does the appellant have any physical or mental health issues that may impact them on the day?",
      "Yes"
    );
    await this.ccdFormPage.setFieldValue(
      "Explain in detail how any physical or mental health issues may affect them on the day.",
      "The appellant is deaf in one ear",
      "text area"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Has the appellant had any past experiences that may impact them on the day?",
      "Yes"
    );
    await this.ccdFormPage.setFieldValue(
      "Explain in detail how any past experiences may affect them on the day?",
      "The appellant is fearful of the law",
      "text area"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Do you have multimedia evidence?",
      "Yes"
    );
    await this.ccdFormPage.setFieldValue(
      "You should provide the equipment to play this evidence. If this is not possible, explain why and what equipment you'll need to play it. (Optional)",
      "The appellant has a video recording on a memory stick which needs to be played on a computer",
      "text area"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Does the appellant need a single-sex court?",
      "Yes"
    );
    await this.ccdFormPage.click("Continue");
    await this.ccdFormPage.setFieldValue(
      "What type of court do they need?",
      "All female"
    );
    await this.ccdFormPage.setFieldValue(
      "Explain in detail why the appellant needs a single-sex court.",
      "The appellant is fearful of men",
      "text area"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Does the appellant need an in camera court?",
      "Yes"
    );
    await this.ccdFormPage.setFieldValue(
      "Explain in detail why the appellant needs an in camera court.",
      "The appellant is afraid of the general public",
      "text area"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Is there anything else you would like to request?",
      "Yes"
    );
    await this.ccdFormPage.setFieldValue(
      "Provide details of any additional requests and why they are necessary.",
      "The appellant would like fresh orange juice and doughnuts",
      "text area"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Are there any dates that the appellant or their on-day representation cannot attend?",
      "Yes"
    );
    await browser.sleep(2000);
    await this.ccdFormPage.click("Add new");
    await browser.sleep(500);
    await this.ccdFormPage.setFieldValue("Date", "18-03-2024");
    await this.ccdFormPage.setFieldValue(
      "Reason",
      "Person reason",
      "text area"
    );

    await this.ccdFormPage.click("Continue");
  }

  async updateHearingRequirementsYesPath() {
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Will the appellant attend the hearing?",
      "Yes"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Will the appellant give oral evidence at the hearing?",
      "Yes"
    );
    await this.ccdFormPage.click("Continue");

<<<<<<< HEAD
    await this.ccdFormPage.setFieldValue(
      "Will any witnesses attend the hearing?",
      "Yes"
    );
    await this.ccdFormPage.click("Add new");
    await this.ccdFormPage.setFieldValue("Name", "Jenny button");
    await this.ccdFormPage.click("Continue");
=======
    await this.ccdFormPage.setFieldValue('Will any witnesses attend the hearing?', 'Yes');
    await this.ccdFormPage.click('Add new');
    //await this.ccdFormPage.setFieldValue('Name', 'Jenny button');
    await this.ccdFormPage.setFieldValue('Given names', 'Jenny');
    await this.ccdFormPage.setFieldValue('Family name', 'button');    
    await this.ccdFormPage.click('Continue');
>>>>>>> 69d1bb5 (fixes to run against pr.)

    await this.ccdFormPage.setFieldValue(
      "Do you need interpreter services on the day?",
      "Yes"
    );
    await this.ccdFormPage.click("Add new");
    await this.ccdFormPage.setFieldValue("Language", "Zulu");
    await this.ccdFormPage.setFieldValue("Dialect", "Kwabe");
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Do you need a hearing room with step-free access?",
      "Yes"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue("Do you need a hearing loop?", "Yes");
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.click("Continue");

    await this.setRemoteHearingRequirement(
      true,
      "Yes",
      "The appellant has good internet connectivity and a laptops"
    );

    await this.ccdFormPage.setFieldValue(
      "Does the appellant have any physical or mental health issues that may impact them on the day?",
      "Yes"
    );
    await this.ccdFormPage.setFieldValue(
      "Explain in detail how any physical or mental health issues may affect them on the day.",
      "The appellant is deaf in one ear - updated",
      "text area"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Has the appellant had any past experiences that may impact them on the day?",
      "Yes"
    );
    await this.ccdFormPage.setFieldValue(
      "Explain in detail how any past experiences may affect them on the day?",
      "The appellant is fearful of the law - updated",
      "text area"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Do you have multimedia evidence?",
      "Yes"
    );
    await this.ccdFormPage.setFieldValue(
      "You should provide the equipment to play this evidence. If this is not possible, explain why and what equipment you'll need to play it.",
      "The appellant has a video recording on a memory stick which needs to be played on a computer - updated",
      "text area"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Does the appellant need a single-sex court?",
      "Yes"
    );
    await this.ccdFormPage.click("Continue");
    await this.ccdFormPage.setFieldValue(
      "What type of court do they need?",
      "All female"
    );
    await this.ccdFormPage.setFieldValue(
      "Explain in detail why the appellant needs a single-sex court.",
      "The appellant is fearful of men - updated",
      "text area"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Does the appellant need an in camera court?",
      "Yes"
    );
    await this.ccdFormPage.setFieldValue(
      "Explain in detail why the appellant needs an in camera court.",
      "The appellant is afraid of the general public - updated",
      "text area"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Is there anything else you would like to request?",
      "Yes"
    );
    await this.ccdFormPage.setFieldValue(
      "Provide details of any additional requests and why they are necessary.",
      "The appellant would like fresh orange juice and doughnuts - updated",
      "text area"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Are there any dates that the appellant or their on-day representation cannot attend?",
      "Yes"
    );

    await this.ccdFormPage.click("Add new");
    await browser.sleep(500);
    await this.ccdFormPage.setFieldValue("Date", "31-12-2021");
    await this.ccdFormPage.setFieldValue(
      "Reason",
      "New year's eve",
      "text area"
    );
    await this.ccdFormPage.click("Continue");
  }

  async updateHearingRequirementsYesPathForInOutOfCountry(
    isInCountry = true,
    keepExitingValues = true
  ) {
    await this.ccdFormPage.click("Continue");

    if (isInCountry) {
      await this.ccdFormPage.setFieldValue(
        "Will the appellant attend the hearing?",
        "Yes"
      );
      await this.ccdFormPage.click("Continue");

      await this.ccdFormPage.setFieldValue(
        "Will the appellant give oral evidence at the hearing?",
        "Yes"
      );
      await this.ccdFormPage.click("Continue");

      await this.ccdFormPage.setFieldValue(
        "Will any witnesses attend the hearing?",
        "Yes"
      );

      if (!keepExitingValues) {
<<<<<<< HEAD
        await this.ccdFormPage.click("Add new");
        await this.ccdFormPage.setFieldValue("Name", "Jenny button");
=======
        await this.ccdFormPage.click('Add new');
        //await this.ccdFormPage.setFieldValue('Name', 'Jenny button');
        await this.ccdFormPage.setFieldValue('Given names', 'Jenny');
        await this.ccdFormPage.setFieldValue('Family name', 'button');        
>>>>>>> 69d1bb5 (fixes to run against pr.)
      }
      await this.ccdFormPage.click("Continue");

      await this.ccdFormPage.setFieldValue(
        "Will the appellant or anyone else be giving oral evidence from outside the United Kingdom?",
        "Yes"
      );
      await this.ccdFormPage.click("Continue");
    } else {
      await this.ccdFormPage.setFieldValue(
        "Will the appellant or anyone else be giving oral evidence from outside the United Kingdom?",
        "Yes"
      );
      await this.ccdFormPage.click("Continue");

      await this.ccdFormPage.setFieldValue(
        "Will any witnesses attend the hearing?",
        "Yes"
      );

      if (!keepExitingValues) {
<<<<<<< HEAD
        await this.ccdFormPage.click("Add new");
        await this.ccdFormPage.setFieldValue("Name", "Jenny button");
=======
        await this.ccdFormPage.click('Add new');
        //await this.ccdFormPage.setFieldValue('Name', 'Jenny button');
        await this.ccdFormPage.setFieldValue('Given names', 'Jenny');
        await this.ccdFormPage.setFieldValue('Family name', 'button');
>>>>>>> 69d1bb5 (fixes to run against pr.)
      }
      await this.ccdFormPage.click("Continue");
    }

    await this.ccdFormPage.setFieldValue(
      "Do you need interpreter services on the day?",
      "Yes"
    );
    if (!keepExitingValues) {
      await this.ccdFormPage.click("Add new");
      await this.ccdFormPage.setFieldValue("Language", "Zulu");
      await this.ccdFormPage.setFieldValue("Dialect", "Kwabe");
    }
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Do you need a hearing room with step-free access?",
      "Yes"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue("Do you need a hearing loop?", "Yes");
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.click("Continue");

    await this.setRemoteHearingRequirementForInOutOfCountryForInOutOfCountry(
      true,
      "Yes",
      "The appellant has good internet connectivity and a laptops"
    );

    await this.ccdFormPage.setFieldValue(
      "Does the appellant have any physical or mental health issues that may impact them on the day?",
      "Yes"
    );
    await this.ccdFormPage.setFieldValue(
      "Explain in detail how any physical or mental health issues may affect them on the day.",
      "The appellant is deaf in one ear - updated",
      "text area"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Has the appellant had any past experiences that may impact them on the day?",
      "Yes"
    );
    await this.ccdFormPage.setFieldValue(
      "Explain in detail how any past experiences may affect them on the day?",
      "The appellant is fearful of the law - updated",
      "text area"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Do you have multimedia evidence?",
      "Yes"
    );
    await this.ccdFormPage.setFieldValue(
      "You should provide the equipment to play this evidence. If this is not possible, explain why and what equipment you'll need to play it.",
      "The appellant has a video recording on a memory stick which needs to be played on a computer - updated",
      "text area"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Does the appellant need a single-sex court?",
      "Yes"
    );
    await this.ccdFormPage.click("Continue");
    await this.ccdFormPage.setFieldValue(
      "What type of court do they need?",
      "All female"
    );
    await this.ccdFormPage.setFieldValue(
      "Explain in detail why the appellant needs a single-sex court.",
      "The appellant is fearful of men - updated",
      "text area"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Does the appellant need an in camera court?",
      "Yes"
    );
    await this.ccdFormPage.setFieldValue(
      "Explain in detail why the appellant needs an in camera court.",
      "The appellant is afraid of the general public - updated",
      "text area"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Is there anything else you would like to request?",
      "Yes"
    );
    await this.ccdFormPage.setFieldValue(
      "Provide details of any additional requests and why they are necessary.",
      "The appellant would like fresh orange juice and doughnuts - updated",
      "text area"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Are there any dates that the appellant or their on-day representation cannot attend?",
      "Yes"
    );

    if (!keepExitingValues) {
      await this.ccdFormPage.click("Add new");
      await browser.sleep(500);
      await this.ccdFormPage.setFieldValue("Date", "31-12-2021");
      await this.ccdFormPage.setFieldValue(
        "Reason",
        "New year's eve",
        "text area"
      );
    }
    await this.ccdFormPage.click("Continue");
  }

  async hearingRequirementsNoPath() {
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Will the appellant attend the hearing?",
      "No"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Will the appellant give oral evidence at the hearing?",
      "No"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Will any witnesses attend the hearing?",
      "No"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Do you need interpreter services on the day?",
      "No"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Do you need a hearing room with step-free access?",
      "No"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue("Do you need a hearing loop?", "No");
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.click("Continue");

    await this.setRemoteHearingRequirement(true, "No", "");

    await this.ccdFormPage.setFieldValue(
      "Does the appellant have any physical or mental health issues that may impact them on the day?",
      "No"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Has the appellant had any past experiences that may impact them on the day?",
      "No"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Do you have multimedia evidence?",
      "No"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Does the appellant need a single-sex court?",
      "No"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Does the appellant need an in camera court?",
      "No"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Is there anything else you would like to request?",
      "No"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Are there any dates that the appellant or their on-day representation cannot attend?",
      "No"
    );

    await this.ccdFormPage.click("Continue");
  }

  async hearingRequirementsNoPathForInOutOfCountry(isInCountry = true) {
    await this.ccdFormPage.click("Continue");

    if (isInCountry) {
      await this.ccdFormPage.setFieldValue(
        "Will the appellant attend the hearing?",
        "No"
      );
      await this.ccdFormPage.click("Continue");

      await this.ccdFormPage.setFieldValue(
        "Will the appellant give oral evidence at the hearing?",
        "No"
      );
      await this.ccdFormPage.click("Continue");

      await this.ccdFormPage.setFieldValue(
        "Will any witnesses attend the hearing?",
        "No"
      );
      await this.ccdFormPage.click("Continue");

      await this.ccdFormPage.setFieldValue(
        "Will the appellant or anyone else be giving oral evidence from outside the United Kingdom?",
        "No"
      );
      await this.ccdFormPage.click("Continue");
    } else {
      await this.ccdFormPage.setFieldValue(
        "Will the appellant or anyone else be giving oral evidence from outside the United Kingdom?",
        "No"
      );
      await this.ccdFormPage.click("Continue");

      await this.ccdFormPage.setFieldValue(
        "Will any witnesses attend the hearing?",
        "No"
      );
      await this.ccdFormPage.click("Continue");
    }

    await this.ccdFormPage.setFieldValue(
      "Do you need interpreter services on the day?",
      "No"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Do you need a hearing room with step-free access?",
      "No"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue("Do you need a hearing loop?", "No");
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.click("Continue");

    await this.setRemoteHearingRequirementForInOutOfCountryForInOutOfCountry(
      true,
      "No",
      ""
    );

    await this.ccdFormPage.setFieldValue(
      "Does the appellant have any physical or mental health issues that may impact them on the day?",
      "No"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Has the appellant had any past experiences that may impact them on the day?",
      "No"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Do you have multimedia evidence?",
      "No"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Does the appellant need a single-sex court?",
      "No"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Does the appellant need an in camera court?",
      "No"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Is there anything else you would like to request?",
      "No"
    );
    await this.ccdFormPage.click("Continue");

    await this.ccdFormPage.setFieldValue(
      "Are there any dates that the appellant or their on-day representation cannot attend?",
      "No"
    );

    await this.ccdFormPage.click("Continue");
  }

  async setRemoteHearingRequirement(
    clickContinue = false,
    isYesPath = "",
    details = ""
  ) {
    if (isYesPath === "Yes") {
      await this.ccdFormPage.setFieldValue(
        "Is there anything you'd like the Tribunal to consider when deciding if a video call is suitable?",
        "Yes"
      );
      await this.ccdFormPage.setFieldValue(
        "Explain in detail anything you would like the Tribunal to consider",
        details
      );
    } else {
      await this.ccdFormPage.setFieldValue(
        "Is there anything you'd like the Tribunal to consider when deciding if a video call is suitable?",
        "No"
      );
    }
    if (clickContinue) {
      await this.ccdFormPage.click("Continue");
    }
  }

  async setRemoteHearingRequirementForInOutOfCountryForInOutOfCountry(
    clickContinue = false,
    isYesPath = "",
    details = ""
  ) {
    if (isOutOfCountryEnabled) {
      if (isYesPath === "Yes") {
        await this.ccdFormPage.setFieldValue(
          "Is there anything you'd like the Tribunal to consider when deciding if a video call is suitable?",
          "Yes"
        );
        await this.ccdFormPage.setFieldValue(
          "Explain in detail anything you would like the Tribunal to consider",
          details
        );
      } else {
        await this.ccdFormPage.setFieldValue(
          "Is there anything you'd like the Tribunal to consider when deciding if a video call is suitable?",
          "No"
        );
      }
      if (clickContinue) {
        await this.ccdFormPage.click("Continue");
      }
    }
  }
  async setHearingLocation(clickContinue = false, location = "") {
    await browser.sleep(3000);
    await this.ccdFormPage.typeTextBasedOnClass(
      "mat-autocomplete-trigger",
      location
    );
    await browser.sleep(3000);
    await this.ccdFormPage.click("Atlantic Quay - Glasgow");
    await this.ccdFormPage.click("Add location");
  }

  async setBailsHearingLocation(clickContinue = false, location = "") {
    await browser.sleep(3000);
    await this.ccdFormPage.typeTextBasedOnClass(
      "mat-autocomplete-trigger",
      location
    );
    await browser.sleep(3000);
    await this.ccdFormPage.click("Hatton Cross Tribunal Hearing Centre");
    await this.ccdFormPage.click("Add location");
  }
}
