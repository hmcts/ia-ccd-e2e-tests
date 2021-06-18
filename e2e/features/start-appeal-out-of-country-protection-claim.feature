Feature: Out of country appeal with no sponsor

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case

  @start-appeal-out-of-country-protection-claim @RIA-3861
  Scenario: Select decision type protection claim

    And I save my out of country appeal with decision type `refusalOfProtection`
    And I submit my appeal

    When I switch to be a `Case Officer`
    And I click the `Overview` tab

    And I switch to be a `Legal Rep`
    And I click the `Overview` tab
    And I should see `Yes` for the `Out of country` field
    And I should see `{$TODAY-7|D MMM YYYY}` for the `Departure date` field

    When I click the `Appeal` tab
    And I should see `Yes` for the `Out of country` field
    And I should see `A decision to refuse a protection or human rights claim where your client may only apply after leaving the UK` for the `Out of country decision` field

    When I click the `Appellant` tab
    Then I should see `Afghanistan` for the `Address` field

