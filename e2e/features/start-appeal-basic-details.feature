Feature: Basic details are validated

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I complete the `Tell us about your client` page
    And I complete the `Home Office reference` page

  @start-appeal @alternate @RIA-683 @migrate-to-unit-tests
  Scenario: Empty Given names is not allowed

    Given I complete the `Basic details` form
    When I clear the `Given names` field
    Then the `Continue` button is disabled
    When I type `José` for the `Given names` field
    Then the `Continue` button is enabled

  @start-appeal @alternate @RIA-684 @migrate-to-unit-tests
  Scenario: Empty Last name is not allowed

    Given I complete the `Basic details` form
    When I clear the `Last name` field
    Then the `Continue` button is disabled
    When I type `González` for the `Last name` field
    Then the `Continue` button is enabled

  @start-appeal @alternate @RIA-654 @migrate-to-unit-tests
  Scenario: Empty Date of birth is not allowed

    Given I complete the `Basic details` form
    When I clear the `Date of birth` field
    Then the `Continue` button is disabled
    When I type `31-12-1999` for the `Date of birth` field
    Then the `Continue` button is enabled

  @start-appeal @alternate @RIA-654 @migrate-to-unit-tests
  Scenario: Empty Date of birth *day* is not allowed

    Given I complete the `Basic details` form
    When I type `-12-1999` for the `Date of birth` field
    Then the `Continue` button is disabled
    When I type `31-12-1999` for the `Date of birth` field
    Then the `Continue` button is enabled

  @start-appeal @alternate @RIA-654 @migrate-to-unit-tests
  Scenario: Empty Date of birth *month* is not allowed

    Given I complete the `Basic details` form
    When I type `31--1999` for the `Date of birth` field
    Then the `Continue` button is disabled
    When I type `31-12-1999` for the `Date of birth` field
    Then the `Continue` button is enabled

  @start-appeal @alternate @RIA-654 @migrate-to-unit-tests
  Scenario: Empty Date of birth *year* is not allowed

    Given I complete the `Basic details` form
    When I type `31-12-` for the `Date of birth` field
    Then the `Continue` button is disabled
    When I type `31-12-1999` for the `Date of birth` field
    Then the `Continue` button is enabled

  @start-appeal @alternate @RIA-624 @migrate-to-unit-tests
  Scenario: Empty Nationality is not allowed

    Given I complete the `Basic details` form
    Then the `Continue` button is enabled
    When I remove the first item from the `Nationality` collection
    Then the `Continue` button is disabled
    When I add an item to the `Nationality` collection
    When Within the first `Nationality` collection item, I select `Finland` for the `Nationality` field
    Then the `Continue` button is enabled

  @start-appeal @alternate @RIA-624 @migrate-to-unit-tests
  Scenario: Unselected Nationality is not allowed

    Given I complete the `Basic details` form
    When Within the first `Nationality` collection item, I select `--Select a value--` for the `Nationality` field
    Then the `Continue` button is disabled
    When Within the first `Nationality` collection item, I select `Finland` for the `Nationality` field
    Then the `Continue` button is enabled
