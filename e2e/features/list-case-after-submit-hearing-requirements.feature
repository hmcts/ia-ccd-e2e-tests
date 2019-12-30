Feature: List case and edit case listing after Submit hearing requirements journey


  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Rep`
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`
    And I request respondent review
    And I add the appeal response
    And I request appellant review
    And I request hearing requirements

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab

    When I select the `Submit hearing requirements` Next step
    Then I should see the text `Submit hearing requirements`
    And I should see the text `If the appellant needs interpreter services, step-free access or a hearing loop, these will be provided.`
    And I should see the text `You'll also be able to request additional adjustments based on the appellant's personal circumstances. The tribunal will review these and decide whether a request can be granted.`


  @RIA-2011 @list-case-after-submit-hearing-req
  Scenario: Submit hearing requirements with 'Yes' options selected

    When I click the `Continue` button
    Then I select `Yes` for the `Will the appellant attend the hearing?` field

    When I click the `Continue` button
    Then I select `Yes` for the `Will the appellant give oral evidence at the hearing?` field

    When I click the `Continue` button
    And I select `Yes` for the `Will any witnesses attend the hearing?` field
    Then I see the text `Witness details`
    And the `Continue` button is disabled

    When I click the `Add new` button
    And I type `Jenny Button` for the `Name` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    And I select `Yes` for the `Do you need interpreter services at the hearing?` field
    Then I see the text `Interpreter details`
    And the `Continue` button is disabled

    When I click the `Add new` button
    And I select `Zulu` for the `Language` field
    And I type `Kwabe` for the `Dialect` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    Then I select `Yes` for the `Do you need a hearing room with step-free access?` field

    When I click the `Continue` button
    Then I select `Yes` for the `Do you need a hearing loop?` field

    When I click the `Continue` button
    Then I should see the text `Additional requests`
    And I should see the text `You can request additional adjustments based on the appellant's personal circumstances. The Tribunal will review the information you provide and decide whether a request can be granted.`

    When I click the `Continue` button
    And I select `Yes` for the `Does the appellant have any physical or mental health issues that may impact them during the hearing?` field
    Then the `Continue` button is disabled
    When I type `The appellant is deaf in one ear` for the `Explain in detail how any physical or mental health issues may affect them during the hearing.` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    And I select `Yes` for the `Has the appellant had any past experiences that may impact them during the hearing?` field
    Then the `Continue` button is disabled
    When I type `The appellant is fearful of the law` for the `Explain in detail how any past experiences may affect them during the hearing.` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    And I select `Yes` for the `Do you have multimedia evidence?` field
    Then the `Continue` button is disabled
    When I type `The appellant has a video recording on a memory stick which needs to be played on a computer` for the `You should provide the equipment to play this evidence. If this is not possible, explain why and what equipment you'll need to play it.` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    And I select `Yes` for the `Does the appellant need a single-sex court?` field

    When I click the `Continue` button
    And I select `All female` for the `What type of court do they need?` field
    Then the `Continue` button is disabled
    When I type `The appellant is fearful of men` for the `Explain in detail why the appellant needs a single-sex court.` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    And I select `Yes` for the `Does the appellant need an in camera court?` field
    Then the `Continue` button is disabled
    When I type `The appellant is afraid of the general public` for the `Explain in detail why the appellant needs a private hearing.` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    And I select `Yes` for the `Is there anything else you would like to request?` field
    Then the `Continue` button is disabled
    When I type `The appellant would like fresh orange juice and doughnuts` for the `Provide details of any additional requests and why they are necessary.` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    Then I should see the text `Hearing dates to avoid`
    And I should see the text `Tell us if there are any dates that the appellant or their on-day representation cannot attend a hearing. You must explain why the case cannot be heard on these dates.`
    And I should see the text `Dates to avoid (Optional)`
    When I click the `Add new` button
    Then I type `31-12-2019` for the `Date (Optional)` field
    Then I type `New Year's Eve` for the `Reason (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page

    When I click the `Submit` button
    Then I should see the text `You've submitted your hearing requirements`
    And I should see the text `What happens next`
    And I should see the text `The Tribunal will review your hearing requirements and any additional requests for adjustments.`
    And I should see the text `We'll notify you when the hearing is listed. You'll then be able to review the hearing requirements.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Submit hearing requirements`

    When I switch to be a `Admin Officer`
    And I click the `Hearing` tab
    Then I should see the hearing requirements yes path for nonHoUsers

    When I click the `Overview` tab
    Then I should only see the `caseOfficer_listing` case progress image

    And I should see the text `Do this next`
    And I should see the text `The agreed hearing requirements and dates to avoid are available to view in the Hearing tab.`
    And I should see the text `When the case has been listed in Aria, you should list the case here.`
    And I click the `list the case here` link

    Then I am on the `List the case` page
    And I should see the option `Manchester` for the `Hearing centre` field
    And I should see the option `Taylor House` for the `Hearing centre` field
    And I should see the option `Newport` for the `Hearing centre` field
    And I should see the option `Bradford` for the `Hearing centre` field
    And I should see the option `North Shields` for the `Hearing centre` field
    And I should see the option `Birmingham` for the `Hearing centre` field
    And I should see the option `Hatton Cross` for the `Hearing centre` field
    And I should see the option `Glasgow` for the `Hearing centre` field
    And I should see the option `30 minutes` for the `Length of hearing` field
    And I should see the option `1 hour` for the `Length of hearing` field
    And I should see the option `1 hour 30 minutes` for the `Length of hearing` field
    And I should see the option `2 hours` for the `Length of hearing` field
    And I should see the option `2 hours 30 minutes` for the `Length of hearing` field
    And I should see the option `3 hours` for the `Length of hearing` field
    And I should see the option `3 hours 30 minutes` for the `Length of hearing` field
    And I should see the option `4 hours` for the `Length of hearing` field
    And I should see the option `4 hours 30 minutes` for the `Length of hearing` field
    And I should see the option `5 hours` for the `Length of hearing` field
    And I should see the option `5 hours 30 minutes` for the `Length of hearing` field
    And I should see the option `6 hours` for the `Length of hearing` field

    When I type `LP/12345/2019` for the `Listing reference` field
    And I select `6 hours` for the `Length of hearing` field
    And I select `{$TODAY+14|DD-MM-YYYY} 10:30:00` for the `Hearing date and time` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `LP/12345/2019` for the `Listing reference` field
    And I should see `Taylor House` for the `Hearing centre` field
    And I should see `6 hours` for the `Length of hearing` field
    And I should see `{$TODAY+14|D MMM YYYY}, 10:30:00 AM` for the `Hearing date and time` field
    When I click the `List case` button
    Then I should see the text `You have listed the case`
    And I should see the text `What happens next`
    And I should see the text `The hearing notice will be sent to all parties.`
    And I should see the text `You don't need to do any more on this case.`
    And I click the `Close and Return to case details` button

    # edit case listing
    When I select the `Edit case listing` Next step
    Then I am on the `Edit case listing` page
    And I select `Manchester` for the `Hearing centre` field
    And I select `3 hours` for the `Length of hearing` field
    And I select `{$TODAY+14|DD-MM-YYYY} 12:30:00` for the `Hearing date and time` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Manchester` for the `Hearing centre` field
    And I should see `3 hours` for the `Length of hearing` field
    And I should see `{$TODAY+14|D MMM YYYY}, 12:30:00 PM` for the `Hearing date and time` field
    When I click the `List case` button
    Then I should see the text `The case has been re-listed`
    And I should see the text `What happens next`
    And I should see the text `A new hearing notice has been generated. All parties will be notified by email.`
    And I click the `Close and Return to case details` button




