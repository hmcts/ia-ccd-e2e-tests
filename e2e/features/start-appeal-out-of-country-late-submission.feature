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
    And I should see `A decision either 1) to refuse a human rights claim made following an application for entry clearance or 2) to refuse a permit to enter the UK under the Immigration (European Economic Area) Regulation 2016` for the `Out of country decision` field

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
    And I should see `A decision to refuse a protection or human rights claim where your client may only apply after leaving the UK` for the `Out of country decision` field

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
    And I should see `A decision either 1) to remove your client from the UK under the Immigration (European Economic Area) Regulations 2016, where they are currently outside the UK or 2) to deprive your client of British citizenship, where they are currently outside the UK` for the `Out of country decision` field

    When I click the `Appellant` tab
    Then I should see `Afghanistan` for the `Address` field
