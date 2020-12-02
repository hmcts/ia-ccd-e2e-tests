Feature: Basic details are validated

  @regression @start-appeal @alternate @RIA-683 @migrate-to-unit-tests
  Scenario: Empty basic details fields are not allowed

    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I complete the `Tell us about your client` page
    And I complete the `Home Office details` page
    And I complete the `Upload the Notice of Decision` page
    And I complete the `Basic details` form

    When I clear the `Given names` field
    Then the `Continue` button is disabled
    When I type `José` for the `Given names` field
    Then the `Continue` button is enabled

    When I clear the `Family name` field
    Then the `Continue` button is disabled
    When I type `González` for the `Family name` field
    Then the `Continue` button is enabled

    When I clear the `Date of birth` field
    Then the `Continue` button is disabled
    When I type `31-12-1999` for the `Date of birth` field
    Then the `Continue` button is enabled

    When I type `-12-1999` for the `Date of birth` field
    Then the `Continue` button is disabled
    When I type `31-12-1999` for the `Date of birth` field
    Then the `Continue` button is enabled

    When I type `31--1999` for the `Date of birth` field
    Then the `Continue` button is disabled
    When I type `31-12-1999` for the `Date of birth` field
    Then the `Continue` button is enabled

    When I type `31-12-` for the `Date of birth` field
    Then the `Continue` button is disabled
    When I type `31-12-1999` for the `Date of birth` field
    Then the `Continue` button is enabled
