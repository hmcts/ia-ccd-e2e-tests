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

  @create-case @alternate @RIA-654
  Scenario: Empty Date of birth is not allowed

    Given I complete the Basic details form
    When I clear the Date of birth field
    Then the Continue button is disabled
    When I type 31-12-1999 for the Date of birth field
    Then the Continue button is enabled

  @create-case @alternate @RIA-654
  Scenario: Empty Date of birth *day* is not allowed

    Given I complete the Basic details form
    When I type -12-1999 for the Date of birth field
    Then the Continue button is disabled
    When I type 31-12-1999 for the Date of birth field
    Then the Continue button is enabled

  @create-case @alternate @RIA-654
  Scenario: Empty Date of birth *month* is not allowed

    Given I complete the Basic details form
    When I type 31--1999 for the Date of birth field
    Then the Continue button is disabled
    When I type 31-12-1999 for the Date of birth field
    Then the Continue button is enabled

  @create-case @alternate @RIA-654
  Scenario: Empty Date of birth *year* is not allowed

    Given I complete the Basic details form
    When I type 31-12- for the Date of birth field
    Then the Continue button is disabled
    When I type 31-12-1999 for the Date of birth field
    Then the Continue button is enabled
