Feature: Send direction action

  @send-direction @RIA-908
  Scenario: Overview tab shows case details

    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I click the `Overview` tab
    And The Appeal reference number field should contain a value of length 13
    And I should see `{$TODAY|D MMM YYYY}` in the `Created Date` field
    And I should see `The refusal of a protection claim` for the `Decision type` field
    And I should see `José González` for the `Appellant name` field
    And Within the first `Nationality` collection item, I should see `Finland` for the `Nationality` field
    And I should see `31 Dec 1999` for the `Date of birth` field

    When I switch to be a `Case Officer`
    And I click the `Overview` tab
    And The Appeal reference number field should contain a value of length 13
    And I should see `{$TODAY|D MMM YYYY}` in the `Created Date` field
    And I should see `The refusal of a protection claim` for the `Decision type` field
    And I should see `José González` for the `Appellant name` field
    And Within the first `Nationality` collection item, I should see `Finland` for the `Nationality` field
    And I should see `31 Dec 1999` for the `Date of birth` field
