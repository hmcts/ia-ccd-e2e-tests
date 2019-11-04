Feature: Address details are validated

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I complete the `Tell us about your client` page
    And I complete the `Home office details` page
    And I complete the `Basic details` page

  @regression @start-appeal @alternate @RIA-732
  Scenario: Legal rep indicates there is no fixed address for the appellant

    Given I am on the `Your client's address` page
    And the `Continue` button is disabled

    When I select `Yes` for the `Does the appellant have a fixed address?` field
    Then I should not see the text `We will use the address of your legal practice.`
    And the `Continue` button is disabled

    When I select `No` for the `Does the appellant have a fixed address?` field
    Then I should see the text `We will use the address of your legal practice.`
    And the `Continue` button is enabled

  @regression @start-appeal @alternate @RIA-672
  Scenario: Empty Building and street field is not allowed

    Given I am on the `Your client's address` page
    When I select `Yes` for the `Does the appellant have a fixed address?` field
    And I click the `I can't enter a UK postcode` link
    And I type `11 Downing Street` for the `Building and Street` field
    Then the `Continue` button is enabled
    When I clear the `Building and Street` field
    Then the `Continue` button is disabled
