Feature: SnL Flow Update hearing requirements


    Background:
        Given I am signed in as a `Legal Org User Rep A`
        And I wait for 30 seconds
        And I create a new case
        And I save my initial PA appeal type without remission and with hearing fee and pay now
        And I click the `Close and Return to case details` button if present
        # And I click the `Close and Return to case details` button if present
        And I wait for 5 second
        Then I should see `You still need to submit your appeal.`
        And I pay for and submit my appeal by Card
        And I switch to be a `Case Officer`
        And I check the case has been paid for
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

    @nightly-test @snl
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

        When I click the `Submit` button
        When I click the `Close and Return to case details` button if present

        # Review hearing requirements (placeholder)
        # This flow requires testing for the field display changes
        And I switch to be a `Case Officer`
        When I select the `Hearing requirements` Next step
        And I should see the `Hearing requirements` page
        And I should see `3 hours` in the `Length` field
        And I click the `Continue` button
        And I click the `Granted` button
        And I type `Remote hearing requirement will be reviewed` for the `Remote hearing` field
        And I click the `Continue` button
        And I click the `Granted` button
        And I type `Physical or mental health conditions will be reviewed` for the `Adjustments to accommodate vulnerabilities` field
        And I click the `Continue` button
        And I click the `Granted` button
        And I type `Multimedia equipment requirement will be reviewed` for the `Multimedia equipment` field
        And I click the `Continue` button
        And I click the `Granted` button
        And I type `Single sex court requirement will be reviewed` for the `Single-sex court` field
        And I click the `Continue` button
        And I click the `Granted` button
        And I type `Private hearing requirement will be reviewed` for the `In camera court` field
        And I click the `Continue` button
        And I click the `Granted` button
        And I type `Additional adjustments requirement will be reviewed` for the `Other adjustments` field
        And I click the `Continue` button
        And I should see the text `What type of hearing is required?`
        And I should see the text `In Person`
        And I should see the text `Not in Attendance`
        And I should see the text `On the Papers`
        And I should see the text `Telephone`
        And I should see the text `Video`
        And I click the `In Person` button
        And I click the `Continue` button
        And I select `Yes` for the `Are there any additional instructions for the hearing?` field
        And I type `Adding Additional instructions for the test` for the `Additional Instructions` field
        And I click the `Continue` button
        Then I am on the `Check your answers` page
        And I should see `3 hours` for the `Length` field
        And I should see `Granted` for the `Remote hearing decision` field
        And I should see `Remote hearing requirement will be reviewed` for the `Remote hearing` field

        And I should see `Granted` for the `Vulnerabilities decision` field
        And I should see `Physical or mental health conditions will be reviewed` for the `Adjustments to accommodate vulnerabilities` field

        And I should see `Granted` for the `Multimedia decision` field
        And I should see `Multimedia equipment requirement will be reviewed` for the `Multimedia equipment` field

        And I should see `Granted` for the `Single-sex court decision` field
        And I should see `Single sex court requirement will be reviewed` for the `Single-sex court` field

        And I should see `Granted` for the `In camera court decision` field
        And I should see `Private hearing requirement will be reviewed` for the `In camera court` field

        And I should see `Granted` for the `Other adjustments decision` field
        And I should see `Additional adjustments requirement will be reviewed` for the `Other adjustments` field

        And I should see `In Person` for the `What type of hearing is required?` field

        And I should see `Yes` for the `Are there any additional instructions for the hearing?` field
        And I should see `Adding Additional instructions for the test` for the `Additional Instructions` field

        And I click the `Submit` button
        And I click the `Close and Return to case details` button if present

        # update hearing requirements (placeholder)
        # This flow requires testing for the field display changes
        When I select the `Update hearing requirements` Next step
        And I should see the `Update hearing requirements` page

        When I click the `Continue` button
        Then I should see the text `Will the appellant attend the hearing?`

        When I click the `Continue` button
        Then I should see the text `Will the appellant give oral evidence at the hearing?`
        And I click the `Continue` button

        And I should see the text `Will any witnesses attend the hearing?`
        Then I see the text `Witness details`
        And I click the `Add new` button
        And I type `test1` for the field with ID `witnessDetails_5_witnessName`
        And I type `6` for the field with ID `witnessDetails_5_witnessFamilyName`
        And I wait for 2 seconds
        And I click the `Add new` button
        And I type `test12` for the field with ID `witnessDetails_6_witnessName`
        And I type `7` for the field with ID `witnessDetails_6_witnessFamilyName`
        And I wait for 3 seconds
        And I click the `Continue` button
        And I should see the text `Will the appellant or anyone else be giving oral evidence from outside the United Kingdom?`
        And I click the `Continue` button
        And I should see the text `Will the appellant need a spoken or sign language interpreter at the hearing?`
        And I click the `Continue` button
        And I click the `Spoken language interpreter` label
        And I click the `Sign language interpreter` label
        And I click the `Continue` button

        And I select `Korean` for the `Spoken language` field
        And I click the `Continue` button
        And I select `British Sign Language (BSL)` for the `Sign language` field
        When I click the `Continue` button
        And I should see the text `Will any of the witnesses require a spoken or sign language interpreter at the hearing?`
        When I click the `Continue` button

        And I click the `Samuel 5` label
        And I wait for 1 seconds
        And I select `Spoken language interpreter` for the `What kind of interpreter does Samuel 5 need?` field
        And I select `Sign language interpreter` for the `What kind of interpreter does Samuel 5 need?` field

        And I click the `test1 6` label
        And I wait for 1 seconds
        And I select `Spoken language interpreter` for the `What kind of interpreter does test1 6 need?` field

        And I click the `test12 7` label
        And I wait for 1 seconds
        And I select `Sign language interpreter` for the `What kind of interpreter does test12 7 need?` field
        When I click the `Continue` button
        And I should see the text `Spoken language`
        When I click the `Continue` button
        And I should see the text `Sign language`

        When I click the `Continue` button
        And I should see the text `Spoken language`

        When I click the `Continue` button
        And I should see the text `Sign language`

        When I click the `Continue` button
        And I should see the text `Spoken language`

        When I click the `Continue` button
        And I select `Acholi` for the `Spoken language` field
        And I click the `Continue` button
        And I select `Lipspeaker` for the `Sign language` field
        And I click the `Continue` button
        And I select `Akan` for the `Spoken language` field
        And I click the `Continue` button
        And I select `Makaton` for the `Sign language` field
        And I click the `Continue` button
        And I click the `Continue` button
        Then I select `No` for the `Do you need a hearing loop?` field
        When I click the `Continue` button

        Then I should see the text `Additional requests`
        And I should see the text `You can request additional adjustments based on the appellant's personal circumstances. The Tribunal will review the information you provide and decide whether a request can be granted.`
        When I click the `Continue` button
        And I select `No` for the `Is there anything you'd like the Tribunal to consider when deciding if a video call is suitable?` field
        When I click the `Continue` button
        And I select `No` for the `Does the appellant have any physical or mental health issues that may impact them on the day?` field
        When I click the `Continue` button
        And I should see the text `Has the appellant had any past experiences that may impact them on the day?`

        When  I click the `Continue` button
        And I should see the text `Do you have multimedia evidence?`
        When I click the `Continue` button
        And I should see the text `Does the appellant need a single-sex court?`

        When I click the `Continue` button
        And I select `All male` for the `What type of court do they need?` field
        When I type `The appellant is fearful of female` for the `Explain in detail why the appellant needs a single-sex court.` field
        When I click the `Continue` button

        And I select `No` for the `Does the appellant need an in camera court?` field
        When I click the `Continue` button
        And I select `No` for the `Is there anything else you would like to request?` field
        When I click the `Continue` button
        Then I should see the text `Hearing dates to avoid`
        When I click the `Continue` button
        Then I should see the text `Are there any additional instructions for the hearing?`
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

        And within the `Witness details` collection's fifth item, I should see `test1` in the `Given names` field
        And within the `Witness details` collection's fifth item, I should see `6` in the `Family name` field
        And within the `Witness details` collection's fifth item, I should see `test12` in the `Given names` field
        And within the `Witness details` collection's fifth item, I should see `7` in the `Family name` field

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

        And within the `Which spoken language interpreter is needed for Samuel 5?` collection's first item, I should see `Acholi` in the `Spoken language` field
        And within the `Which sign language is needed for Samuel 5?` collection's first item, I should see `Lipspeaker` in the `Sign language` field

        And within the `Which spoken language interpreter is needed for test1 6?` collection's first item, I should see `Akan` in the `Spoken language` field
        And within the `Which sign language is needed for test12 7?` collection's first item, I should see `Makaton` in the `Sign language` field

        And I should see `Yes` in the `Do you need a hearing room with step-free access?` field
        And I should see `No` in the `Do you need a hearing loop?` field

        And I should see `No` in the `Is there anything you'd like the Tribunal to consider when deciding if a video call is suitable?` field


        And I should see `No` in the `Does the appellant have any physical or mental health issues that may impact them on the day?` field
        And I should see `Yes` in the `Has the appellant had any past experiences that may impact them on the day?` field
        And I should see `The appellant is fearful of the law` in the `Explain in detail how any past experiences may affect them on the day?` field
        And I should see `Yes` in the `Do you have multimedia evidence?` field
        And I should see `The appellant has a video recording on a memory stick which needs to be played on a computer` in the `You should provide the equipment to play this evidence. If this is not possible, explain why and what equipment you'll need to play it.` field
        And I should see `Yes` in the `Does the appellant need a single-sex court?` field
        And I should see `All male` in the `What type of court do they need?` field
        And I should see `The appellant is fearful of men` in the `Explain in detail why the appellant needs a single-sex court.` field
        And I should see `No` in the `Does the appellant need an in camera court?` field
        And I should see `No` in the `Is there anything else you would like to request?` field
        And I should see the `Dates to avoid` field
        And I should see `15 Oct 2023` in the `Date` field
        And I should see `New Year's Eve` in the `Reason` field
        And I should see `No` in the `Are there any additional instructions for the hearing?` field

        When I click the `Submit` button


        Then I should see the text `You've updated the hearing requirements`
        And I should see the text `Do this next`


        When I click the `Close and Return to case details` button if present


        Then I should see an alert confirming the case `has been updated with event: Update hearing requirements`


        When I goto the `Hearing and appointment` tab
        Then I should see the `Hearing requirements` field
        And I should see `Yes` in the `Will the appellant attend the hearing?` field
        And I should see `Yes` in the `Will the appellant give oral evidence at the hearing?` field
        And I should see `Yes` in the `Will any witnesses attend the hearing?` field
        And I should see `7` in the `How many witnesses will attend?` field

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

        And within the `Witness details` collection's fifth item, I should see `test1` in the `Given names` field
        And within the `Witness details` collection's fifth item, I should see `6` in the `Family name` field
        And within the `Witness details` collection's fifth item, I should see `test12` in the `Given names` field
        And within the `Witness details` collection's fifth item, I should see `7` in the `Family name` field

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

        And I should see `Acholi` in the fourth `Spoken language` field
        And I should see `Lipspeaker` in the fourth `Sign language` field

        And I should see `Telugu` in the fourth `Spoken language` field
        And I should see `Makaton` in the fourth `Sign language` field



        And I should see `Yes` in the `Do you need a hearing room with step-free access?` field
        And I should see `Yes` in the `Do you need a hearing loop?` field
        And I should see `Yes` in the `Is there anything you'd like the Tribunal to consider when deciding if a video call is suitable?` field

        # And I should not see the agreed additional adjustments no path
        And I should see the text `Hearing requirements`
        And I should see the text `Requests for additional adjustments`
        And I should see the text `Record of requirements and requests`
        And within the `Requirements and requests` collection's first item, I should see `-Gonzlez-hearing-requirements.PDF` in the `Document` field
        And within the `Requirements and requests` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field


        #update-hearing-adjustments (placeholder)
        # This flow requires testing for the field display changes
        When I select the `Update hearing adjustments` Next step
        And I should see the `Update hearing adjustments` page
        And I should see `3 hours` in the `Length` field
        And I click the `Continue` button
        And I click the `Granted` button
        And I type `Remote hearing requirement will be reviewed` for the `Remote hearing` field
        And I click the `Continue` button
        And I click the `Granted` button
        And I type `Physical or mental health conditions will be reviewed` for the `Adjustments to accommodate vulnerabilities` field
        And I click the `Continue` button
        And I click the `Granted` button
        And I type `Multimedia equipment requirement will be reviewed` for the `Multimedia equipment` field
        And I click the `Continue` button
        And I click the `Granted` button
        And I type `Single sex court requirement will be reviewed` for the `Single-sex court` field
        And I click the `Continue` button
        And I click the `Granted` button
        And I type `Private hearing requirement will be reviewed` for the `In camera court` field
        And I click the `Continue` button
        And I click the `Granted` button
        And I type `Additional adjustments requirement will be reviewed` for the `Other adjustments` field
        And I click the `Continue` button
        And I should see the text `What type of hearing is required?`
        And I should see the text `In Person`
        And I should see the text `Not in Attendance`
        And I should see the text `On the Papers`
        And I should see the text `Telephone`
        And I should see the text `Video`
        And I click the `In Person` button
        And I click the `Continue` button
        And I select `Yes` for the `Are there any additional instructions for the hearing?` field
        And I type `Adding Additional instructions for the test` for the `Additional Instructions` field
        And I click the `Continue` button
        Then I am on the `Check your answers` page
        And I should see `3 hours` for the `Length` field
        And I should see `Granted` for the `Remote hearing decision` field
        And I should see `Remote hearing requirement will be reviewed` for the `Remote hearing` field

        And I should see `Granted` for the `Vulnerabilities decision` field
        And I should see `Physical or mental health conditions will be reviewed` for the `Adjustments to accommodate vulnerabilities` field

        And I should see `Granted` for the `Multimedia decision` field
        And I should see `Multimedia equipment requirement will be reviewed` for the `Multimedia equipment` field

        And I should see `Granted` for the `Single-sex court decision` field
        And I should see `Single sex court requirement will be reviewed` for the `Single-sex court` field

        And I should see `Granted` for the `In camera court decision` field
        And I should see `Private hearing requirement will be reviewed` for the `In camera court` field

        And I should see `Granted` for the `Other adjustments decision` field
        And I should see `Additional adjustments requirement will be reviewed` for the `Other adjustments` field

        And I should see `In Person` for the `What type of hearing is required?` field

        And I should see `Yes` for the `Are there any additional instructions for the hearing?` field
        And I should see `Adding Additional instructions for the test` for the `Additional Instructions` field

        And I click the `Update` button
        And I click the `Close and Return to case details` button