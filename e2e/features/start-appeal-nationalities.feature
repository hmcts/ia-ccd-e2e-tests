Feature: Nationalities

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I complete the `Tell us about your client` page
    And I complete the `Home office details` page
    And I complete the `Upload the Notice of Decision` page

  @regression @start-appeal @alternate @RIA-585 @migrate-to-unit-tests
  Scenario: The Nationalities list contains all ISO countries

    Given I am on the `Basic details` page
    When I add an item to the `Nationality` collection
    Then I see a list of all nationalities
