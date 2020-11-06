Feature: Home Office Reference/Case ID number is validated

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I complete the `Tell us about your client` page

  @regression @start-appeal @alternate @RIA-597 @migrate-to-unit-tests @RIA-3389
  Scenario: Invalid home office reference is not allowed

    Given I am on the `Home Office details` page
    When I type `A123456001` for the `Home Office Reference/Case ID` field
    And I type `31-10-2018` for the `Enter the date the decision letter was sent` field
    And I click the `Continue` button
    Then I am on the `Basic details` page
