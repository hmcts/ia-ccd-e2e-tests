Feature: Overview tab

  @regression @overview-tab @RIA-908
  Scenario: Overview tab shows case details

    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I click the `Overview` tab
    And I should see the `Overview` page
    And the `Appeal reference` field should be 13 characters long
#    the check below is blocked by CCD bug: https://tools.hmcts.net/jira/browse/RIA-980
#    And I should see `{$TODAY|D MMM YYYY}` in the `Created Date` field
    And I should see `The refusal of a protection claim` for the `Type of appeal` field
    And I should see `José González` for the `Appellant` field
    And within the `Appellant nationalities` collection's first item, I should see `Finland` for the `Nationality` field
    And I should see `31 Dec 1999` for the `Date of birth` field

    When I switch to be a `Case Officer`
    And I click the `Overview` tab
    And I should see the `Overview` page
    And the `Appeal reference` field should be 13 characters long
#    the check below is blocked by CCD bug: https://tools.hmcts.net/jira/browse/RIA-980
#    And I should see `{$TODAY|D MMM YYYY}` in the `Created Date` field
    And I should see `The refusal of a protection claim` for the `Type of appeal` field
    And I should see `José González` for the `Appellant` field
    And within the `Appellant nationalities` collection's first item, I should see `Finland` for the `Nationality` field
    And I should see `31 Dec 1999` for the `Date of birth` field
