Feature: Allocate a case

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`

  @RWA-137
  Scenario: Allocate a case to me

    When I select the `Allocate the case` Next step
    Then I am on the `Allocate the case` page
    When I select `Allocate to me` for the `Allocation type` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Allocate to me` for the `Allocation type` answer

    When I click the `Submit` button
    Then I should see the text `You have allocated the case`
    Then I should see the text `What happens next`
    Then I should see the text `The tasks for this case will now appear in your task list.`
