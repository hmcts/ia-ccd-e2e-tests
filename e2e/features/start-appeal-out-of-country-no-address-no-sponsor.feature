Feature: Out of country appeal with no address and no sponsor

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case


  @start-appeal-out-of-country-no-address-no-sponsor @RIA-4050
  Scenario: Select refusal of human rights for decision type

    And I save my out of country `now` appeal with decision type `refusalOfHumanRights` with address `No` and with sponsor `No`
    And I submit my appeal

    When I switch to be a `Case Officer`
    And I click the `Overview` tab

    And I switch to be a `Legal Org User Rep A`
    And I click the `Overview` tab
    And I should see `Yes` for the `Out of country` field
    And I should see `GWF1234567` for the `Global Web form` field
    And I should see `{$TODAY|D MMM YYYY}` for the `Date of entry clearance decision` field

    When I click the `Appeal` tab
    And I should see `Yes` for the `Out of country` field
    And I should see `A decision either 1) to refuse a human rights claim made following an application for entry clearance or 2) to refuse a permit to enter the UK under the Immigration (European Economic Area) Regulation 2016` for the `Out of country decision` field

    When I click the `Appellant` tab
    And I should see `No` for the `Does the appellant have a sponsor?` field
    And I should see `No` for the `Does your client have a correspondence address outside the UK?` field


