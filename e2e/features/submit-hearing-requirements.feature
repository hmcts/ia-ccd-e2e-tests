Feature: Submit hearing requirements


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
    And I request hearing requirements

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab

    Then I should not see any case progress images
    And I should not see the text `Do this next`
    And I should see the case details
    And I should not see the hearing details
    And I should see the legal representative details

    And I should see the option `Upload additional evidence` for the `Next step` field
    And I should see the option `Submit hearing requirements` for the `Next step` field
    And I should not see the option `Send direction` for the `Next step` field
    And I should not see the option `Change the direction due date` for the `Next step` field
    And I should not see the option `List the case` for the `Next step` field
    And I should not see the option `Add case note` for the `Next step` field
    And I should not see the option `Record an application` for the `Next step` field

    When I click the `Appeal` tab
    Then I should see the appeal details
    And I should see the submission details

    When I click the `Appellant` tab
    Then I should see the appellant's details
    And I should see the legal representative's details

    When I select the `Submit hearing requirements` Next step
    Then I should see the text `Submit hearing requirements`
    And I should see the text `If the appellant needs interpreter services, step-free access or a hearing loop, these will be provided.`
    And I should see the text `You'll also be able to request additional adjustments based on the appellant's personal circumstances. The tribunal will review these and decide whether a request can be granted.`


  @submit-hearing-requirements-no-path @RIA-436-2087
  Scenario: Submit hearing requirements with 'No' options selected


    When I click the `Continue` button
    Then I select `No` for the `Will the appellant attend the hearing?` field

    When I click the `Continue` button
    Then I select `No` for the `Will the appellant give oral evidence at the hearing?` field

    When I click the `Continue` button
    Then I select `No` for the `Will any witnesses attend the hearing?` field

    When I click the `Continue` button
    Then I select `No` for the `Do you need interpreter services at the hearing?` field

    When I click the `Continue` button
    Then I select `No` for the `Do you need a hearing room with step-free access?` field

    When I click the `Continue` button
    Then I select `No` for the `Do you need a hearing loop?` field

    When I click the `Continue` button
    Then I should see the text `Additional requests`
    And I should see the text `You can request additional adjustments based on the appellant's personal circumstances. The Tribunal will review the information you provide and decide whether a request can be granted.`

    When I click the `Continue` button
    Then I select `No` for the `Does the appellant have any physical or mental health issues that may impact them during the hearing?` field

    When I click the `Continue` button
    Then I select `No` for the `Has the appellant had any past experiences that may impact them during the hearing?` field

    When I click the `Continue` button
    Then I select `No` for the `Do you have multimedia evidence?` field

    When I click the `Continue` button
    Then I select `No` for the `Does the appellant need a single-sex court?` field

    When I click the `Continue` button
    Then I select `No` for the `Does the appellant need an in camera court?` field

    When I click the `Continue` button
    Then I select `No` for the `Is there anything else you would like to request?` field

    When I click the `Continue` button
    Then I should see the text `Hearing dates to avoid`
    And I should see the text `Tell us if there are any dates that the appellant or their on-day representation cannot attend a hearing. You must explain why the case cannot be heard on these dates.`
    And I should see the text `Dates to avoid (Optional)`

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `No` in the `Will the appellant attend the hearing?` field
    And I should see `No` in the `Will the appellant give oral evidence at the hearing?` field
    And I should see `No` in the `Will any witnesses attend the hearing?` field
    And I should see `No` in the `Do you need interpreter services at the hearing?` field
    And I should see `No` in the `Do you need a hearing room with step-free access?` field
    And I should see `No` in the `Do you need a hearing loop?` field
    And I should see `No` in the `Does the appellant have any physical or mental health issues that may impact them during the hearing?` field
    And I should see `No` in the `Has the appellant had any past experiences that may impact them during the hearing?` field
    And I should see `No` in the `Do you have multimedia evidence?` field
    And I should see `No` in the `Does the appellant need a single-sex court?` field
    And I should see `No` in the `Does the appellant need an in camera court?` field
    And I should see `No` in the `Is there anything else you would like to request?` field
    And I should see the `Dates to avoid` field

    When I click the `Submit` button
    Then I should see the text `You've submitted your hearing requirements`
    And I should see the text `What happens next`
    And I should see the text `The Tribunal will review your hearing requirements and any additional requests for adjustments.`
    And I should see the text `We'll notify you when the hearing is listed. You'll then be able to review the hearing requirements.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Submit hearing requirements`



  @submit-hearing-requirements-yes-path @RIA-436-2087
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
    And I should see `Yes` in the `Will the appellant attend the hearing?` field
    And I should see `Yes` in the `Will the appellant give oral evidence at the hearing?` field
    And I should see `Yes` in the `Will any witnesses attend the hearing?` field
    And I should see `Jenny Button` in the `Witness details` field
    And I should see `Yes` in the `Do you need interpreter services at the hearing?` field
    And I should see `Zulu` in the `Language` field
    And I should see `Kwabe` in the `Dialect` field
    And I should see `Yes` in the `Do you need a hearing room with step-free access?` field
    And I should see `Yes` in the `Do you need a hearing loop?` field
    And I should see `Yes` in the `Does the appellant have any physical or mental health issues that may impact them during the hearing?` field
    And I should see `The appellant is deaf in one ear` in the `Explain in detail how any physical or mental health issues may affect them during the hearing.` field
    And I should see `Yes` in the `Has the appellant had any past experiences that may impact them during the hearing?` field
    And I should see `The appellant is fearful of the law` in the `Explain in detail how any past experiences may affect them during the hearing.` field
    And I should see `Yes` in the `Do you have multimedia evidence?` field
    And I should see `The appellant has a video recording on a memory stick which needs to be played on a computer` in the `You should provide the equipment to play this evidence. If this is not possible, explain why and what equipment you'll need to play it.` field
    And I should see `Yes` in the `Does the appellant need a single-sex court?` field
    And I should see `All female` in the `What type of court do they need?` field
    And I should see `The appellant is fearful of men` in the `Explain in detail why the appellant needs a single-sex court.` field
    And I should see `Yes` in the `Does the appellant need an in camera court?` field
    And I should see `The appellant is afraid of the general public` in the `Explain in detail why the appellant needs a private hearing.` field
    And I should see `Yes` in the `Is there anything else you would like to request?` field
    And I should see `The appellant would like fresh orange juice and doughnuts` in the `Provide details of any additional requests and why they are necessary.` field
    And I should see the `Dates to avoid` field
    And I should see `31 Dec 2019` in the `Date` field
    And I should see `New Year's Eve` in the `Reason` field

    When I click the `Submit` button
    Then I should see the text `You've submitted your hearing requirements`
    And I should see the text `What happens next`
    And I should see the text `The Tribunal will review your hearing requirements and any additional requests for adjustments.`
    And I should see the text `We'll notify you when the hearing is listed. You'll then be able to review the hearing requirements.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Submit hearing requirements`