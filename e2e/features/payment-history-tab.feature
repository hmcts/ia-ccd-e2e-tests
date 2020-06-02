Feature: Payment history tab


  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal


  @RIA-3057
  Scenario: Payment history tab visible to Case Officer, Admin Officer & Legal Rep

    And I select the `Submit your appeal` Next step
    And I agree to the declaration
    And I click the `Continue` button
    And I click the `Submit` button
    And I click the `Close and Return to case details` button
    And I click the `Payment history` tab
    Then I should see the `Payment history` page
    And I should see the text `Processed payments`

    # Case Officer
    When I switch to be a `Case Officer`
    And I click the `Payment history` tab
    Then I should see the `Payment history` page
    And I should see the text `Processed payments`

    # Admin Officer
    When I switch to be a `Admin Officer`
    And I click the `Payment history` tab
    Then I should see the `Payment history` page
    And I should see the text `Processed payments`

