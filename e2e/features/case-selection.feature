Feature: Creating a case shows imported jurisdiction and case type

  @regression @create-case
  Scenario: Creating a case shows imported jurisdiction and case type
    Given I am signed in as a `Legal Rep`
    When I click the `Create case` link
    Then I should see the `Create Case` page
    And I wait for Create Case fields to load
    Then I should see `Immigration & Asylum` for the `Jurisdiction` field
    Then I should see `Appeal` in the `Case type` field
    Then I should see `Start your appeal` for the `Event` field
    Then I should see the `Start` button
