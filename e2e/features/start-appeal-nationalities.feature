Feature: Nationalities

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I complete the `Tell us about your client` page
    And I complete the `Home Office details` page
    And I complete the `Upload the Notice of Decision` page
    And I complete the `Basic details` page

  @regression @start-appeal @alternate @RIA-585 @migrate-to-unit-tests
  Scenario: The Nationalities list contains all ISO countries

    Given I am on the `What is the appellant's nationality?` page
    When I select `Has a nationality` for the `Nationality` field
    When I add an item to the `Nationality` collection
    Then I see a list of all nationalities

  @regression @RIA-2010
  Scenario: The appellant is stateless

    Given I am on the `What is the appellant's nationality?` page
    When I select `Stateless` for the `Nationality` field
    And I click the `Continue` button
    And I am on the `Appellant's address` page
