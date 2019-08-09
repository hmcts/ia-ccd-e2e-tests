Feature: End appeal

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`

  @end-appeal @RIA-823
  Scenario: End appeal

    When I select the `End appeal` Next step

    Then I am on the `End appeal` page
    And I should see the text `This appeal has ended. Record the outcome and reasons below.`
    And the `Continue` button is disabled

    When I select `Struck out` for the `Outcome of the appeal` field
    And I type `some end appeal reason` for the `Reasons for this outcome` field

    Then the `Continue` button is enabled

    When I click the `Continue` button

    Then I am on the `End appeal` page
    And I should see the text `Record who approve this outcome.`
    And the `Continue` button is disabled

    When I select `Judge` for the `Approved by` field
    And I type `John Doe` for the `Name of approver` field

    Then the `Continue` button is enabled

    When I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Struck out` for the `Outcome of the appeal` answer
    And I should see `some end appeal reason` for the `Reasons for this outcome` answer
    And I should see `Judge` for the `Approved by` answer
    And I should see `John Doe` for the `Name of approver` answer

    When I click the `End appeal` button

    Then I should see the text `You have ended the appeal`
    And I should see the text `What happens next`
    And I should see the text `A notification has been sent to all parties.`

    When I click the `Close and Return to case details` button

    Then I should see an alert confirming the case `has been updated with event: End appeal`

