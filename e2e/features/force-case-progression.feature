Feature: Force case progression

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence

  @RIA-2774
  Scenario: Awaiting respondent evidence to Case building

    When I select the `Request case building` Next step
    Then I am on the `Request case building` page
    When I click the `Continue` button
    Then I am on the `Request case building` page
    Then I should see the text `Reasons to force the case progression`
    And the `Continue` button is disabled
    When I type `some reasons to force the case progression` for the `Reasons to force the case progression` field
    Then the `Continue` button is enabled
    When I click the `Continue` button
    Then I should see the text `Check your answers`
    When I click the `Send direction` button
    Then I should see the text `You have sent a direction`
    When I click the `Close and Return to case details` button
    When I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `Force case from Awaiting Respondent Evidence to Case Building` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `some reasons to force the case progression` for the `Case note` field




