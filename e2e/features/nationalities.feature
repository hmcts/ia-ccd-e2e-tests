Feature: Nationalities

  Background:
    Given I am signed in as a Legal Rep
    And I create a new case

  @RIA-585
  Scenario: The Nationalities list contains all ISO countries

    Given I am on the Basic details page
    When I add a new item to the Nationality collection
    Then I see a list of all nationalities
