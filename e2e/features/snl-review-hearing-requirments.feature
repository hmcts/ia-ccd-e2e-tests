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
    And I pay for and submit my appeal by Card for a PA appeal type
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

@nightly-test43210
  Scenario: SnL flow Review hearing requirements with 'Agreed' options selected

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

    And I click the `Jenny Bat 1` label
    And I wait for 1 seconds
    And I select `Spoken language interpreter` for the `What kind of interpreter does Jenny Bat 1 need?` field
    And I select `Sign language interpreter` for the `What kind of interpreter does Jenny Bat 1 need?` field

    And I click the `krish 2` label
    And I wait for 1 seconds
    And I select `Spoken language interpreter` for the `What kind of interpreter does krish 2 need?` field
    And I select `Sign language interpreter` for the `What kind of interpreter does krish 2 need?` field

    And I click the `ramesh 3` label
    And I wait for 1 seconds
    And I select `Sign language interpreter` for the `What kind of interpreter does ramesh 3 need?` field

    And I click the `Mat 4` label
    And I wait for 1 seconds
    And I select `Spoken language interpreter` for the `What kind of interpreter does Mat 4 need?` field
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

    When I click the `Submit` button
    When I click the `Close and Return to case details` button

    And I switch to be a `Case Officer`
    When I select the `Hearing requirements` Next step
