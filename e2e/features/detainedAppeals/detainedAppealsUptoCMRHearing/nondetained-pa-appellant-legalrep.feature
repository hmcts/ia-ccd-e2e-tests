Feature: Progress non Detained PA Appeal upto CMR Hearing

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial EA appeal type without remission and with hearing fee and pay now
    And I go to the overview page for the stored case
    Then I should be on the overview page
    And I pay for and submit my appeal by PBA
    And I switch to be a `Case Officer`
    And I wait for 2 seconds
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Org User Rep A`
    And I wait for 2 seconds
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`
    And I wait for 2 seconds
    And I request respondent review
    And I add the appeal response
    And I request Force case - hearing reqs
    And I wait for 5 seconds
    And I switch to be a `Legal Org User Rep A`
    And I wait for 2 seconds
    And I submit hearing requirements with all yes when in country
    And I switch to be a `Case Officer`
    And I wait for 2 seconds
    And I record agreed hearing requirements yes path



  @detained-rp-case @detained-cases-upto-cmr-hearing
  Scenario: Progress non Detained PA Appeal upto CMR Hearing

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
