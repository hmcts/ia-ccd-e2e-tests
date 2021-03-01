Feature: Out of country appeal late submission

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case

  @start-appeal-out-of-country-late-refusalOfHumanRights @RIA-3954
  Scenario: Select refusal of human rights for decision type for late appeal

    And I save my out of country `late` appeal with decision type `refusalOfHumanRights`
    And I submit my late appeal

    When I switch to be a `Case Officer`
    And I click the `Overview` tab

    And I switch to be a `Legal Rep`
    And I click the `Overview` tab
    And I should see `Yes` for the `Out of country` field
    And I should see `GWF1234567` for the `Global Web form` field
    And I should see `{$TODAY-30|D MMM YYYY}` for the `Date of entry clearance decision` field

    When I click the `Appeal` tab
    And I should see `Yes` for the `Out of country` field
    And I should see `A decision to refuse a human rights claim for entry clearance` for the `Out of country decision` field

    When I click the `Appellant` tab
    Then I should see `Afghanistan` for the `Address` field

  @start-appeal-out-of-country-late-refusalOfProtection @RIA-3954
  Scenario: Select refusal of human rights for decision type for late appeal

    And I save my out of country `late` appeal with decision type `refusalOfProtection`
    And I submit my late appeal

    When I switch to be a `Case Officer`
    And I click the `Overview` tab

    And I switch to be a `Legal Rep`
    And I click the `Overview` tab
    And I should see `Yes` for the `Out of country` field
    And I should see `{$TODAY-30|D MMM YYYY}` for the `Departure date` field

    When I click the `Appeal` tab
    And I should see `Yes` for the `Out of country` field
    And I should see `A decision to refuse a human rights or protection claim, or deprive you of British citizenship, where you can only apply after your client has left the country` for the `Out of country decision` field

    When I click the `Appellant` tab
    Then I should see `Afghanistan` for the `Address` field

  @start-appeal-out-of-country-late-removalOfClient @RIA-3954
  Scenario: Select refusal of human rights for decision type for late appeal

    And I save my out of country `late` appeal with decision type `removalOfClient`
    And I submit my late appeal

    When I switch to be a `Case Officer`
    And I click the `Overview` tab

    And I switch to be a `Legal Rep`
    And I click the `Overview` tab
    And I should see `Yes` for the `Out of country` field

    When I click the `Appeal` tab
    And I should see `Yes` for the `Out of country` field
    And I should see `A decision to remove your client under the Immigration (European Economic Area) Regulations 2016` for the `Out of country decision` field

    When I click the `Appellant` tab
    Then I should see `Afghanistan` for the `Address` field
