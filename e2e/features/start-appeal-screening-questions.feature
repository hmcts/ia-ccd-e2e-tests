Feature: Start an appeal application screening questions

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case

  @regression @start-appeal @alternate @RIA-226
  Scenario: All screening questions must be agreed to before continuing

    Given I am on the `Tell us about your client` page
    And the `Continue` button is disabled
    When I click the `My client is living in the UK` label
    And I click the `My client is not in detention` label
    Then the `Continue` button is disabled
    And I click the `My client is not appealing an EU Settlement Scheme decision` label
    Then the `Continue` button is enabled
    And I click the `My client is living in the UK` label
    Then the `Continue` button is disabled
