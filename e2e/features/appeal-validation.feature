Feature: Other Appeal Numbers are validated

  Background:
    Given I am signed in as a Legal Rep
    And I create a new case
    And I complete the screening questions page
    And I complete the Home Office reference page
    And I complete the Basic details page
    And I complete the Your client's address page
    And I complete the Why is your client appealing? page
    And I complete the New matters page

  @create-case @alternate @RIA-635
  Scenario Outline: Invalid appeal reference

    Given I am on the Has your client appealed against any other UK immigration decisions? page
    And I select Yes for the Other appeals field
    And I click the Continue button
    And I am on the Has your client appealed against any other UK immigration decisions? page
    And I click the Add new button
    When Within the Appeal number collection, I type <invalidAppealReference> for the first Appeal number field
    And I click the Continue button
    Then I should see an error saying The data entered is not valid for this type of field, please delete and re-enter using only valid data

  Examples:
  | invalidAppealReference |
  | RT/12345/2014          |
  | PA/1234x/2014          |
  | PA/1234x/2014          |
  | PA/123456/2014         |
  | PA/123456/201          |
  | PA/123456/20143        |
