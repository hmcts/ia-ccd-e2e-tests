Feature: SnL Flow submit hearing requirements


  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I wait for 30 seconds
    And I create a new case
    And I save my initial PA appeal type without remission and with hearing fee and pay now
    And I wait for 12 seconds
    # And I click the `Close and Return to case details` button
    And I wait for 5 second
    Then I should see the text `You still need to submit your appeal.`
    And I pay for and submit my appeal by Card
    And I wait for 15 seconds
    And I switch to be a `Case Officer`
    And I request home office data
    And I request respondent evidence
    And I wait for 3 seconds
    And I progress case to force request case building
    And I request Force case - case under review
    And I request respondent review
    And I request Force case - hearing reqs
    And I switch to be a `Legal Org User Rep A`
    When I select the `Submit hearing requirements` Next step
    Then I should see the text `Submit hearing requirements`
    And I should see the text `If the appellant needs interpreter services, step-free access or a hearing loop, these will be provided.`
    And I should see the text `You'll also be able to request additional adjustments based on the appellant's personal circumstances. The tribunal will review these and decide whether a request can be granted.`

  @regression @force-case-progression-to-submit-hearing-requirements @RIA-2776
  Scenario: SnL flow Submit hearing requirements with 'No' options selected
    When I click the `Continue` button

    Then I select `No` for the `Will the appellant attend the hearing?` field
    When I click the `Continue` button

    Then I select `No` for the `Will the appellant give oral evidence at the hearing?` field
    When I click the `Continue` button

    Then I select `No` for the `Will any witnesses attend the hearing?` field
    When I click the `Continue` button

    Then I select `No` for the `Will the appellant or anyone else be giving oral evidence from outside the United Kingdom?` field
    When I click the `Continue` button

    Then I select `No` for the `Will the appellant need a spoken or sign language interpreter at the hearing?` field
    When I click the `Continue` button

    Then I select `No` for the `Do you need a hearing room with step-free access?` field
    When I click the `Continue` button

    Then I select `No` for the `Do you need a hearing loop?` field
    When I click the `Continue` button

    Then I should see the text `Additional requests`
    And I should see the text `You can request additional adjustments based on the appellant's personal circumstances. The Tribunal will review the information you provide and decide whether a request can be granted.`
    When I click the `Continue` button

    Then I select `No` for the `Is there anything you'd like the Tribunal to consider when deciding if a video call is suitable?` field
    When I click the `Continue` button

    Then I select `No` for the `Does the appellant have any physical or mental health issues that may impact them on the day?` field
    When I click the `Continue` button

    Then I select `No` for the `Has the appellant had any past experiences that may impact them on the day?` field
    When I click the `Continue` button

    Then I select `No` for the `Do you have multimedia evidence?` field
    When I click the `Continue` button

    Then I select `No` for the `Does the appellant need a single-sex court?` field
    When I click the `Continue` button

    Then I select `No` for the `Does the appellant need an in camera court?` field
    When I click the `Continue` button

    Then I select `No` for the `Is there anything else you would like to request?` field
    When I click the `Continue` button

    Then I select `No` for the `Are there any dates that the appellant or their on-day representation cannot attend?` field
    When I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `No` in the `Will the appellant attend the hearing?` field
    And I should see `No` in the `Will the appellant give oral evidence at the hearing?` field
    And I should see `No` in the `Will any witnesses attend the hearing?` field
    And I should see `No` in the `Will the appellant or anyone else be giving oral evidence from outside the United Kingdom?` field
    And I should see `No` in the `Do you need interpreter services on the day?` field
    And I should see `No` in the `Do you need a hearing room with step-free access?` field
    And I should see `No` in the `Do you need a hearing loop?` field
    And I should see `No` in the `Is there anything you'd like the Tribunal to consider when deciding if a video call is suitable?` field
    And I should see `No` in the `Does the appellant have any physical or mental health issues that may impact them on the day?` field
    And I should see `No` in the `Has the appellant had any past experiences that may impact them on the day?` field
    And I should see `No` in the `Do you have multimedia evidence?` field
    And I should see `No` in the `Does the appellant need a single-sex court?` field
    And I should see `No` in the `Does the appellant need an in camera court?` field
    And I should see `No` in the `Is there anything else you would like to request?` field
    And I should see `No` in the `Are there any dates that the appellant or their on-day representation cannot attend?` field

    When I click the `Submit` button
    Then I should see the text `You've submitted your hearing requirements`
    And I should see the text `What happens next`
    And I should see the text `The Tribunal will review your hearing requirements and any additional requests for adjustments.`
    And I should see the text `We'll notify you when the hearing is listed. You'll then be able to review the hearing requirements.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Submit hearing requirements`

    When I goto the `Hearing and appointment` tab
    Then I should see the `Requirements and requests` field
    And within the `Requirements and requests` collection's first item, I should see `-Gonzlez-hearing-requirements.PDF` in the `Document` field
    And within the `Requirements and requests` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And I should see `No` in the `Will the appellant attend the hearing?` field
    And I should see `No` in the `Will the appellant give oral evidence at the hearing?` field
    And I should see `No` in the `Will any witnesses attend the hearing?` field
    And I should see `No` in the `Will the appellant or anyone else be giving oral evidence from outside the United Kingdom?` field
    And I should see `No` in the `Do you need interpreter services on the day?` field
    And I should see `No` in the `Do you need a hearing room with step-free access?` field
    And I should see `No` in the `Do you need a hearing loop?` field
    And I should see `No` in the `Is there anything you'd like the Tribunal to consider when deciding if a video call is suitable?` field
    And I should not see the agreed additional adjustments yes path
    And I should see the text `Hearing requirements`
    And I should see the text `Requests for additional adjustments`
    And I should see the text `Record of requirements and requests`


  Scenario: SnL flow Submit hearing requirements with 'Yes' options selected

    When I click the `Continue` button
    Then I select `Yes` for the `Will the appellant attend the hearing?` field
    When I click the `Continue` button

    Then I select `Yes` for the `Will the appellant give oral evidence at the hearing?` field
    And I click the `Continue` button

    And I select `Yes` for the `Will any witnesses attend the hearing?` field
    Then I see the text `Witness details`

    And I click the `Add new` button
    And I type `Jenny Bat` for the `Given names` field
    And I type `1` for the `Family name` field

    And I wait for 2 seconds
    And I click the `Add new` button
    And I type `krish` for the field with ID `witnessDetails_1_witnessName`
    And I type `2` for the field with ID `witnessDetails_1_witnessFamilyName`

    And I wait for 2 seconds
    And I click the `Add new` button
    And I type `ramesh` for the field with ID `witnessDetails_2_witnessName`
    And I type `3` for the field with ID `witnessDetails_2_witnessFamilyName`

    And I wait for 2 seconds
    And I click the `Add new` button
    And I type `Mat` for the field with ID `witnessDetails_3_witnessName`
    And I type `4` for the field with ID `witnessDetails_3_witnessFamilyName`

    And I wait for 2 seconds
    And I click the `Add new` button
    And I type `Samuel` for the field with ID `witnessDetails_4_witnessName`
    And I type `5` for the field with ID `witnessDetails_4_witnessFamilyName`

    And I wait for 3 seconds
    And I click the `Continue` button

    And I select `Yes` for the `Will the appellant or anyone else be giving oral evidence from outside the United Kingdom?` field
    And I click the `Continue` button

    And I select `Yes` for the `Will the appellant need a spoken or sign language interpreter at the hearing?` field
    And I click the `Continue` button

    And I click the `Spoken language interpreter` label
    And I click the `Sign language interpreter` label
    And I click the `Continue` button

    And I select `Korean` for the `Spoken language` field
    And I click the `Continue` button

    And I select `British Sign Language (BSL)` for the `Sign language` field
    And I click the `Continue` button

    And I select `Yes` for the `Will any of the witnesses require a spoken or sign language interpreter at the hearing?` field
    And I click the `Continue` button

    # And I click the `Jenny Bat 1` label
    And I wait for 1 seconds
    And I select `Spoken language interpreter` for the `What kind of interpreter does Jenny Bat 1 need? (Optional)` field
    And I select `Sign language interpreter` for the `What kind of interpreter does Jenny Bat 1 need? (Optional)` field

    # And I click the `krish 2` label
    And I wait for 1 seconds
    And I select `Spoken language interpreter` for the `What kind of interpreter does krish 2 need? (Optional)` field
    And I select `Sign language interpreter` for the `What kind of interpreter does krish 2 need? (Optional)` field

    # And I click the `ramesh 3` label
    And I wait for 1 seconds
    And I select `Sign language interpreter` for the `What kind of interpreter does ramesh 3 need? (Optional)` field

    # And I click the `Mat 4` label
    And I wait for 1 seconds
    And I select `Spoken language interpreter` for the `What kind of interpreter does Mat 4 need? (Optional)` field
    And I click the `Continue` button

    And I select `Brong` for the `Spoken language` field
    And I click the `Continue` button

    And I select `Lipspeaker` for the `Sign language` field
    And I click the `Continue` button

    And I select `Akan` for the `Spoken language` field
    And I click the `Continue` button

    And I select `Notetaker` for the `Sign language` field
    And I click the `Continue` button

    And I select `Visual frame signing` for the `Sign language` field
    And I click the `Continue` button

    And I select `Telugu` for the `Spoken language` field
    And I click the `Continue` button

    Then I select `Yes` for the `Do you need a hearing room with step-free access?` field
    And I click the `Continue` button

    Then I select `Yes` for the `Do you need a hearing loop?` field
    When I click the `Continue` button

    Then I should see the text `Additional requests`
    And I should see the text `You can request additional adjustments based on the appellant's personal circumstances. The Tribunal will review the information you provide and decide whether a request can be granted.`
    When I click the `Continue` button

    And I select `Yes` for the `Is there anything you'd like the Tribunal to consider when deciding if a video call is suitable?` field
    When I type `The appellant for video call` for the `Explain in detail anything you would like the Tribunal to consider` field
    When I click the `Continue` button

    # And I select `Yes` for Remote hearing with details `I have good internet connectivity and laptop`

    And I select `Yes` for the `Does the appellant have any physical or mental health issues that may impact them on the day?` field
    When I type `The appellant is deaf in one ear` for the `Explain in detail how any physical or mental health issues may affect them on the day.` field
    When I click the `Continue` button

    And I select `Yes` for the `Has the appellant had any past experiences that may impact them on the day?` field
    When I type `The appellant is fearful of the law` for the `Explain in detail how any past experiences may affect them on the day?` field
    When I click the `Continue` button

    And I select `Yes` for the `Do you have multimedia evidence?` field
    When I type `The appellant has a video recording on a memory stick which needs to be played on a computer` for the `You should provide the equipment to play this evidence. If this is not possible, explain why and what equipment you'll need to play it. (Optional)` field
    When I click the `Continue` button

    And I select `Yes` for the `Does the appellant need a single-sex court?` field
    When I click the `Continue` button

    And I select `All female` for the `What type of court do they need?` field
    When I type `The appellant is fearful of men` for the `Explain in detail why the appellant needs a single-sex court.` field
    When I click the `Continue` button

    And I select `Yes` for the `Does the appellant need an in camera court?` field
    When I type `The appellant is afraid of the general public` for the `Explain in detail why the appellant needs an in camera court.` field
    When I click the `Continue` button

    And I select `Yes` for the `Is there anything else you would like to request?` field
    When I type `The appellant would like fresh orange juice and doughnuts` for the `Provide details of any additional requests and why they are necessary.` field
    When I click the `Continue` button

    Then I should see the text `Hearing dates to avoid`

    When I select `Yes` for the `Are there any dates that the appellant or their on-day representation cannot attend?` field
    Then I should see the text `Tell us which dates and explain why the case cannot be heard on these dates.`
    And I should see the text `Dates to avoid`
    When I click the `Add new` button
    Then I type `15-10-2023` for the `Date` field
    Then I type `New Year's Eve` for the `Reason` field
    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Yes` in the `Will the appellant attend the hearing?` field
    And I should see `Yes` in the `Will the appellant give oral evidence at the hearing?` field
    And I should see `Yes` in the `Will any witnesses attend the hearing?` field
    And within the `Witness details` collection's first item, I should see `Jenny Bat` in the `Given names` field
    And within the `Witness details` collection's first item, I should see `1` in the `Family name` field

    And within the `Witness details` collection's second item, I should see `krish` in the `Given names` field
    And within the `Witness details` collection's second item, I should see `2` in the `Family name` field

    And within the `Witness details` collection's third item, I should see `ramesh` in the `Given names` field
    And within the `Witness details` collection's third item, I should see `3` in the `Family name` field

    And within the `Witness details` collection's fourth item, I should see `Mat` in the `Given names` field
    And within the `Witness details` collection's fourth item, I should see `4` in the `Family name` field

    And within the `Witness details` collection's fifth item, I should see `Samuel` in the `Given names` field
    And within the `Witness details` collection's fifth item, I should see `5` in the `Family name` field

    And I should see `Yes` in the `Will the appellant or anyone else be giving oral evidence from outside the United Kingdom?` field
    And I should see `Yes` in the `Will the appellant need a spoken or sign language interpreter at the hearing?` field
    And I should see `Spoken language interpreter` in the `What kind of interpreter will the appellant need?` field
    And I should see `Sign language interpreter` in the `What kind of interpreter will the appellant need?` field

    And within the `Tell us which spoken language is needed for the appellant` collection's first item, I should see `Korean` in the `Spoken language` field
    And within the `Tell us which sign language is needed for the appellant` collection's first item, I should see `British Sign Language (BSL)` in the `Sign language` field

    And I should see `Yes` in the `Will any of the witnesses require a spoken or sign language interpreter at the hearing?` field

    And within the `Which spoken language interpreter is needed for Jenny Bat 1?` collection's first item, I should see `Brong` in the `Spoken language` field
    And within the `Which sign language is needed for Jenny Bat 1?` collection's first item, I should see `Lipspeaker` in the `Sign language` field

    And within the `Which spoken language interpreter is needed for krish 2?` collection's first item, I should see `Akan` in the `Spoken language` field
    And within the `Which sign language is needed for krish 2?` collection's first item, I should see `Notetaker` in the `Sign language` field

    And within the `Which sign language is needed for ramesh 3?` collection's first item, I should see `Visual frame signing` in the `Sign language` field
    And within the `Which spoken language interpreter is needed for Mat 4?` collection's first item, I should see `Telugu` in the `Spoken language` field


    And I should see `Yes` in the `Do you need a hearing room with step-free access?` field
    And I should see `Yes` in the `Do you need a hearing loop?` field

    And I should see `Yes` in the `Is there anything you'd like the Tribunal to consider when deciding if a video call is suitable?` field
    And I should see `The appellant for video call` in the `Explain in detail anything you would like the Tribunal to consider` field


    And I should see `Yes` in the `Does the appellant have any physical or mental health issues that may impact them on the day?` field
    And I should see `The appellant is deaf in one ear` in the `Explain in detail how any physical or mental health issues may affect them on the day.` field
    And I should see `Yes` in the `Has the appellant had any past experiences that may impact them on the day?` field
    And I should see `The appellant is fearful of the law` in the `Explain in detail how any past experiences may affect them on the day?` field
    And I should see `Yes` in the `Do you have multimedia evidence?` field
    And I should see `The appellant has a video recording on a memory stick which needs to be played on a computer` in the `You should provide the equipment to play this evidence. If this is not possible, explain why and what equipment you'll need to play it.` field
    And I should see `Yes` in the `Does the appellant need a single-sex court?` field
    And I should see `All female` in the `What type of court do they need?` field
    And I should see `The appellant is fearful of men` in the `Explain in detail why the appellant needs a single-sex court.` field
    And I should see `Yes` in the `Does the appellant need an in camera court?` field
    And I should see `The appellant is afraid of the general public` in the `Explain in detail why the appellant needs an in camera court.` field
    And I should see `Yes` in the `Is there anything else you would like to request?` field
    And I should see `The appellant would like fresh orange juice and doughnuts` in the `Provide details of any additional requests and why they are necessary.` field
    And I should see the `Dates to avoid` field
    And I should see `15 Oct 2023` in the `Date` field
    And I should see `New Year's Eve` in the `Reason` field

    When I click the `Submit` button

    Then I should see the text `You've submitted your hearing requirements`
    And I should see the text `What happens next`
    And I should see the text `The Tribunal will review your hearing requirements and any additional requests for adjustments.`
    And I should see the text `We'll notify you when the hearing is listed. You'll then be able to review the hearing requirements.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Submit hearing requirements`


    When I goto the `Hearing and appointment` tab
    Then I should see the `Requirements and requests` field
    And I should see `Yes` in the `Will the appellant attend the hearing?` field
    And I should see `Yes` in the `Will the appellant give oral evidence at the hearing?` field
    And I should see `Yes` in the `Will any witnesses attend the hearing?` field
    And I should see `5` in the `How many witnesses will attend?` field

    And within the `Witness details` collection's first item, I should see `Jenny Bat` in the `Given names` field
    And within the `Witness details` collection's first item, I should see `1` in the `Family name` field

    And within the `Witness details` collection's second item, I should see `krish` in the `Given names` field
    And within the `Witness details` collection's second item, I should see `2` in the `Family name` field

    And within the `Witness details` collection's third item, I should see `ramesh` in the `Given names` field
    And within the `Witness details` collection's third item, I should see `3` in the `Family name` field

    And within the `Witness details` collection's fourth item, I should see `Mat` in the `Given names` field
    And within the `Witness details` collection's fourth item, I should see `4` in the `Family name` field

    And within the `Witness details` collection's fifth item, I should see `Samuel` in the `Given names` field
    And within the `Witness details` collection's fifth item, I should see `5` in the `Family name` field

    And I should see `Yes` in the `Will the appellant or anyone else be giving oral evidence from outside the United Kingdom?` field
    And I should see `Yes` in the `Do you need interpreter services on the day?` field

    And within the `Tell us which spoken language is needed for the appellant` collection's first item, I should see `Korean` in the `Spoken language` field
    And within the `Tell us which sign language is needed for the appellant` collection's first item, I should see `British Sign Language (BSL)` in the `Sign language` field
    And I should see `Yes` in the `Will any of the witnesses require a spoken or sign language interpreter at the hearing?` field

    And I should see `Brong` in the second `Spoken language` field
    And I should see `Lipspeaker` in the second `Sign language` field

    And I should see `Akan` in the third `Spoken language` field
    And I should see `Notetaker` in the third `Sign language` field

    And I should see `Telugu` in the fourth `Spoken language` field
    And I should see `Visual frame signing` in the fourth `Sign language` field

    And I should see `Yes` in the `Do you need a hearing room with step-free access?` field
    And I should see `Yes` in the `Do you need a hearing loop?` field
    And I should see `Yes` in the `Is there anything you'd like the Tribunal to consider when deciding if a video call is suitable?` field

    # And I should not see the agreed additional adjustments no path
    And I should see the text `Hearing requirements`
    And I should see the text `Requests for additional adjustments`
    And I should see the text `Record of requirements and requests`
    And within the `Requirements and requests` collection's first item, I should see `-Gonzlez-hearing-requirements.PDF` in the `Document` field
    And within the `Requirements and requests` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
