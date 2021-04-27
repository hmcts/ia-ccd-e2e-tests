Feature: Edit case listing and change the hearing centre to Belfast


  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I switch to be a `Home Office APC`
    And I upload Home Office bundle
    And I switch to be a `Case Officer`
    And I request case building
    And I switch to be a `Legal Org User Rep A`
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`
    And I request respondent review
    And I add the appeal response
    And I request hearing requirements
    And I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all yes when in country
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path
    And I switch to be a `Admin Officer`
    And I list the case

  @edit-hearing-centre-to-belfast @RIA-3810
  Scenario: Edit hearing centre to Belfast

    When I switch to be a `Admin Officer`
    Then I select the `Edit case listing` Next step
    And I am on the `Edit case listing` page
    And I select `Belfast` for the `Hearing centre` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Belfast` in the `Hearing centre` field
    And I click the `List case` button

    And I should see the text `The case has been re-listed`

    Then I click the `Close and Return to case details` button
    And I should see an alert confirming the case `has been updated with event: Edit case listing`

    Then I click the `Hearing and appointment` tab
    And I should see `Belfast` for the `Hearing centre` field


