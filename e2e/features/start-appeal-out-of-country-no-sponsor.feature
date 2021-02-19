Feature: Out of country appeal with no sponsor

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case


  @start-appeal-out-of-country-no-sponsor @RIA-2110
  Scenario: Select refusal of human rights for decision type

    And I save my out of country appeal with decision type `refusalOfHumanRights`
    And I submit my appeal

    When I switch to be a `Case Officer`
    And I click the `Overview` tab

    And I switch to be a `Legal Rep`
    And I click the `Overview` tab
    And I should see `Yes` for the `Out of country` field
    And I should see `GWF1234567` for the `Global Web form` field
    And I should see `{$TODAY|D MMM YYYY}` for the `Date of entry clearance decision` field

    When I click the `Appeal` tab
    And I should see `Yes` for the `Out of country` field
    And I should see `A decision to refuse a human rights claim for entry clearance` for the `Out of country decision` field

    When I click the `Appellant` tab
    Then I should see `Afghanistan` for the `Address` field


