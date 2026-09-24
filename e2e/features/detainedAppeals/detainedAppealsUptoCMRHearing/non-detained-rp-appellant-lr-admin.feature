Feature: Progress Internal LR NonDetained RP Appeal upto CMR Hearing

  Background:
    Given I am signed in as a `Admin Officer`
    And I create a new case
    # And I save my initial aip internal RP appeal for nonPayment without hearing for an Immigration removal centre detention facility
    And I save my initial lr internal RP nondetained appeal for nonPayment without hearing
    And I submit my nonpayment appeal
    And I wait for 10 seconds
    And I switch to be a `Case Officer`
    And I wait for 2 seconds
    And I request home office data
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Admin Officer`
    And I wait for 2 seconds
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`
    And I wait for 2 seconds
    And I request respondent review
    And I add the appeal response
    And I request Force case - hearing reqs
    And I wait for 5 seconds
    And I switch to be a `Admin Officer`
    And I wait for 2 seconds
    And I submit hearing requirements with all yes when in country
    And I switch to be a `Case Officer`
    And I wait for 2 seconds
    And I record agreed hearing requirements yes path
    And I switch to be a `Admin Officer`
    And I wait for 2 seconds



  @aipInternalDetained-rp-case @detained-cases-upto-cmr-hearing
  Scenario: Progress Internal LR NonDetained RP Appeal upto CMR Hearing

    ##Hearing Request
    And I switch to be a `Admin Officer`
    And I wait for 3 seconds
    When I goto the `Hearings` tab
    And I wait for 8 seconds
    And I click the `Request a hearing` button
    And I wait for 3 seconds
    And I should see the text `Hearing requirements`
    And I should see the text `Any reasonable adjustments on this page will be included in the hearing request.`
    When I click the `Continue` button
    And I wait for 3 seconds
    And I should see the text `Do you require any additional facilities?`
    When I click the `Continue` button
    And I click the `Case Management Review` button
    And I click the `Continue` button
    And I should see the text `Participant attendance`
    And I select how each of the 6 participants will attend the hearing
    And I click the `Continue` button
    And I add the `Glasgow Tribunals Centre` hearing location
    And I click the `Continue` button
    And I should see the text `Do you want a specific judge`
    And I select No for specific judge question with `Tribunal` judge type
    And I click the `Continue` button
    And I should see the text `Do you require a panel for this hearing?`
    And I click the `Continue` button
    And I should see the text `Length, date and priority level of hearing`
    And I click the `Continue` button
    And I should see the text `Will this hearing need to be linked to other hearings?`
    And I click the `Continue` button
    And I should see the text `Enter any additional instructions for the hearing`
    And I click the `Continue` button
    And I should see the text `Check your answers before sending your request`
    And I click the `Submit request` button
    And I should see the text `Hearing request submitted`
    And I click the `view the status of this hearing in the hearings tab` link
