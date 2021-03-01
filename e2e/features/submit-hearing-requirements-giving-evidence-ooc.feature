Feature: Submit & update hearing requirements - Giving evidence from outside the UK (out of country appeal)

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my out of country `now` appeal with decision type `refusalOfHumanRights` with address `No` and with sponsor `No`
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Org User Rep A`
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`
    And I request respondent review
    And I add the appeal response
    And I request hearing requirements

  @RIA-3825 @RIA-3825-out-of-country-no @ooc-submit-hearing-requirements-giving-evidence-no-path
  Scenario: Submit & update hearing requirements - Giving evidence from outside the UK (out of country appeal)

    And I switch to be a `Legal Org User Rep A`

    # Submit hearing requirements
    When I click the `submit the appellant's hearing requirements` link
    Then I should see the text `Submit hearing requirements`
    And I should see the text `If the appellant needs interpreter services, step-free access or a hearing loop, these will be provided.`
    And I should see the text `You'll also be able to request additional adjustments based on the appellant's personal circumstances. The tribunal will review these and decide whether a request can be granted.`

    When I click the `Continue` button
    Then I select `No` for the `Will the appellant or anyone else be giving oral evidence from outside the United Kingdom?` field

    When I click the `Continue` button
    Then I select `No` for the `Will any witnesses attend the hearing?` field

    When I click the `Continue` button
    Then I select `No` for the `Do you need interpreter services on the day?` field

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
    And I should see `No` in the `Will the appellant or anyone else be giving oral evidence from outside the United Kingdom?` field
    And I should not see the `Will the appellant attend the hearing?` field
    And I should not see the `Will the appellant give oral evidence at the hearing?` field
    And I should see `No` in the `Will any witnesses attend the hearing?` field
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

    When I click the `Hearing and appointment` tab
    Then I should see the `Hearing and appointment` page
    And I should see the `Requirements and requests` field
    And within the `Requirements and requests` collection's first item, I should see `-Gonzlez-hearing-requirements.PDF` in the `Document` field
    And within the `Requirements and requests` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And I should see `No` in the `Will the appellant or anyone else be giving oral evidence from outside the United Kingdom?` field
    And I should not see the `Will the appellant attend the hearing?` field
    And I should not see the `Will the appellant give oral evidence at the hearing?` field
    And I should see `No` in the `Will any witnesses attend the hearing?` field
    And I should see `No` in the `Do you need interpreter services on the day?` field
    And I should see `No` in the `Do you need a hearing room with step-free access?` field
    And I should see `No` in the `Do you need a hearing loop?` field
    And I should see `No` in the `Is there anything you'd like the Tribunal to consider when deciding if a video call is suitable?` field
    And I should not see the agreed additional adjustments yes path
    And I should see the text `Hearing requirements`
    And I should see the text `Requests for additional adjustments`
    And I should see the text `Record of requirements and requests`

    # Review hearing requirements (placeholder)
    # This flow requires testing for the field display changes
    When I switch to be a `Case Officer`
    And I click the `review and submit` link
    And I should see the `Hearing requirements` page
    And I select `6 hours` for the `Length` field
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `6 hours` for the `Length` field
    And I click the `Submit` button
    And I click the `Close and Return to case details` button

    # Update hearing requirements
    And I switch to be a `Admin Officer`
    And I list the case

    And I switch to be a `Case Officer
    And I select the `Update hearing requirements` Next step
    Then I should see the text `Update hearing requirements`
    And I should see the text `If the appellant needs interpreter services, step-free access or a hearing loop, these will be provided.`
    And I should see the text `You'll also be able to request additional adjustments based on the appellant's personal circumstances. The tribunal will review these and decide whether a request can be granted.`

    When I click the `Continue` button
    Then I select `Yes` for the `Will the appellant or anyone else be giving oral evidence from outside the United Kingdom?` field

    When I click the `Continue` button
    Then I select `No` for the `Will any witnesses attend the hearing?` field

    When I click the `Continue` button
    Then I select `No` for the `Do you need interpreter services on the day?` field

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
    And I should see `Yes` in the `Will the appellant or anyone else be giving oral evidence from outside the United Kingdom?` field
    And I should not see the `Will the appellant attend the hearing?` field
    And I should not see the `Will the appellant give oral evidence at the hearing?` field
    And I should see `No` in the `Will any witnesses attend the hearing?` field
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

    When I click the `Update` button
    Then I should see the text `You've updated the hearing requirements`
    And I should see the text `Do this next`
    And I should see the text `You must now update the hearing adjustments or confirm they haven't changed.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Update hearing requirements`

    When I click the `Hearing and appointment` tab
    Then I should see the `Hearing and appointment` page
    And I should see the `Requirements and requests` field
    And within the `Requirements and requests` collection's first item, I should see `-Gonzlez-hearing-requirements.PDF` in the `Document` field
    And within the `Requirements and requests` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Requirements and requests` collection's second item, I should see `-Gonzlez-hearing-requirements.PDF` in the `Document` field
    And within the `Requirements and requests` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    # Update hearing adjustments (placeholder)
    # This flow requires testing for the field display changes
    When I select the `Update hearing adjustments` Next step
    Then I am on the `Update hearing adjustments` page
    And I select `6 hours` for the `Length` field
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Update` button
    And I click the `Close and Return to case details` button

