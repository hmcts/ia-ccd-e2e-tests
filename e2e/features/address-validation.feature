Feature: Address details are validated

  Background:
    Given I am signed in as a Legal Rep
    And I create a new case
    And I complete the Home Office reference page
    And I complete the Basic details page

  @create-case @alternate @RIA-688
  Scenario: Unanswered fixed address question is not allowed

    Given I do nothing
    Then the Continue button is disabled
    When I select No for the Does the appellant have a fixed address? field
    Then the Continue button is enabled

  @create-case @alternate @RIA-732
  Scenario: Legal rep indicates there is no fixed address for the appellant

    When I select Yes for the Does the appellant have a fixed address? field
    When I should not see the text We will use the address of your legal practice.

    When I select No for the Does the appellant have a fixed address? field
    When I should see the text We will use the address of your legal practice.
