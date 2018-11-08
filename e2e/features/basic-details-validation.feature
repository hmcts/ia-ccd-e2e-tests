Feature: Basic details are validated

  Background:
    Given I am signed in as a Legal Rep
    And I create a new case
    And I complete the Home Office reference page

  @create-case @alternate @RIA-683
  Scenario: Empty Given names is not allowed

    Given I complete the Basic details form
    When I clear the Given names field
    Then the Continue button is disabled
    When I type José for the Given names field
    Then the Continue button is enabled

  @create-case @alternate @RIA-684
  Scenario: Empty Last name is not allowed

    Given I complete the Basic details form
    When I clear the Last name field
    Then the Continue button is disabled
    When I type González for the Last name field
    Then the Continue button is enabled
