Feature: Creating a case shows imported jurisdiction and case type

  @create-case
  Scenario: Creating a case shows imported jurisdiction and case type
    Given I am signed in as a `Legal Rep`
    When I click the `Create Case` link
#    Then I wait for 1 second
    Then I should see the `Create Case` page
#    Then I should see `Immigration & Asylum` for the `Jurisdiction` field
#    Then I should see `IA Asylum Case` for the `Case type` field
#    Then I should see `Start your appeal` for the `Event` field
    Then I should see the `Start` button
