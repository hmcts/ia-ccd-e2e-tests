Feature: Home Office reference number is validated

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I complete the `Tell us about your client` page

  @regression @start-appeal @alternate @RIA-597 @migrate-to-unit-tests
  Scenario: Invalid home office reference is not allowed

    Given I am on the `Home office details` page
    When I type `A` for the `Home Office reference` field
    And I type `31-10-2018` for the `Enter the date the decision letter was sent` field
    And I click the `Continue` button
    Then I should see an error saying `The data entered is not valid for this type of field.`
    And the `Continue` button is disabled

    When I type `123` for the `Home Office reference` field
    And I click the `Continue` button
    Then I should see an error saying `The data entered is not valid for this type of field.`
    And the `Continue` button is disabled

    When I type `A123` for the `Home Office reference` field
    And I click the `Continue` button
    Then I should see an error saying `The data entered is not valid for this type of field.`
    And the `Continue` button is disabled

    When I type `A123456001` for the `Home Office reference` field
    And I click the `Continue` button
    Then I should see an error saying `The data entered is not valid for this type of field.`
    And the `Continue` button is disabled

    When I type `A123456/` for the `Home Office reference` field
    And I click the `Continue` button
    Then I should see an error saying `The data entered is not valid for this type of field.`
    And the `Continue` button is disabled

    When I type `123456/001` for the `Home Office reference` field
    And I click the `Continue` button
    Then I should see an error saying `The data entered is not valid for this type of field.`
    And the `Continue` button is disabled

    When I type `A123456/1234` for the `Home Office reference` field
    And I click the `Continue` button
    Then I should see an error saying `The data entered is not valid for this type of field.`
    And the `Continue` button is disabled

    When I type `A12345678/1234` for the `Home Office reference` field
    And I click the `Continue` button
    Then I should see an error saying `The data entered is not valid for this type of field.`
    And the `Continue` button is disabled

  @regression @start-appeal @alternate @RIA-597 @migrate-to-unit-tests
  Scenario: Valid home office reference is allowed

    Given I am on the `Home office details` page
    When I type `A123456` for the `Home Office reference` field
    And I type `31-10-2018` for the `Enter the date the decision letter was sent` field
    And I click the `Continue` button
    Then I am on the `Basic details` page

    Given I click the `Previous` button
    And I am on the `Home office details` page
    When I type `X123456` for the `Home Office reference` field
    And I click the `Continue` button
    Then I am on the `Basic details` page

    Given I click the `Previous` button
    And I am on the `Home office details` page
    When I type `A123456/001` for the `Home Office reference` field
    And I click the `Continue` button
    Then I am on the `Basic details` page

    Given I click the `Previous` button
    And I am on the `Home office details` page
    When I type `X123456/1` for the `Home Office reference` field
    And I click the `Continue` button
    Then I am on the `Basic details` page

    Given I click the `Previous` button
    And I am on the `Home office details` page
    When I type `X123456/12` for the `Home Office reference` field
    And I click the `Continue` button
    Then I am on the `Basic details` page

    Given I click the `Previous` button
    And I am on the `Home office details` page
    When I type `X123456/123` for the `Home Office reference` field
    And I click the `Continue` button
    Then I am on the `Basic details` page

    Given I click the `Previous` button
    And I am on the `Home office details` page
    When I type `X1234567/1` for the `Home Office reference` field
    And I click the `Continue` button
    Then I am on the `Basic details` page

    Given I click the `Previous` button
    And I am on the `Home office details` page
    When I type `X1234567/12` for the `Home Office reference` field
    And I click the `Continue` button
    Then I am on the `Basic details` page

    Given I click the `Previous` button
    And I am on the `Home office details` page
    When I type `X1234567/123` for the `Home Office reference` field
    And I click the `Continue` button
    Then I am on the `Basic details` page