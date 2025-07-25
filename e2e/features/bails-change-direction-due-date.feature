Feature: Bails Change Direction Due Date
  Background:
    Given I am signed in as a `Legal Org User Rep A Bails`
    And I create a new bail application
    And I save my initial application as a `Legal Rep` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative
    And I submit my bail application as a `Legal Rep`
    And I should see the text `What happens next`
    And I switch to be a `Admin Officer Bails`
    And I send a direction to the `Legal representative`

  @RIA-5772 @bails-change-direction-due-date @bails-change-direction-due-date-AO @bails-full @bails-regression @bail-nightly-test
  Scenario: Change a direction due date as an Admin Officer
    When I select the `Change direction due date` Next step
    Then I am on the `Select direction` page
    And The page is accessible
    When I select `Direction 1` for the `Direction` field
    And I click the `Continue` button
    Then I am on the `Change the date` page
    And The page is accessible
    When I type `{$TODAY+4|DD MM YYYY}` for the `Date Due` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And The page is accessible
    And I should see `Direction 1` in the `Direction` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Date Sent` field
    And I should see `{$TODAY+4|D MMM YYYY}` in the `Date Due` field
    When I click the `Change bail direction due date` button
    Then I should see the text `You have changed the direction due date`
    And I should see the text `All parties will be notified that the direction due date has changed. You can see the status of the direction in the directions tab.`
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    When I click the `Directions` tab
    And within the `Directions` collection's first item, I should see `{$TODAY+4|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field
    And within the `Previous dates` collection's first item, I should see `{$TODAY+2|D MMM YYYY}` for the `Date due` field
    And within the `Previous dates` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

  @RIA-5772 @bails-change-direction-due-date @bails-change-direction-due-date-judge @bails-full
  Scenario: Change a direction due date as a Judge
    When I switch to be a `Judge Bails`
    And I select the `Change direction due date` Next step
    Then I am on the `Select direction` page
    And The page is accessible
    When I select `Direction 1` for the `Direction` field
    And I click the `Continue` button
    Then I am on the `Change the date` page
    And The page is accessible
    When I type `{$TODAY+4|DD MM YYYY}` for the `Date Due` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And The page is accessible
    And I should see `Direction 1` in the `Direction` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Date Sent` field
    And I should see `{$TODAY+4|D MMM YYYY}` in the `Date Due` field
    When I click the `Change bail direction due date` button
    Then I should see the text `You have changed the direction due date`
    And I should see the text `All parties will be notified that the direction due date has changed. You can see the status of the direction in the directions tab.`
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    When I click the `Directions` tab
    And within the `Directions` collection's first item, I should see `{$TODAY+4|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field
    And within the `Previous dates` collection's first item, I should see `{$TODAY+2|D MMM YYYY}` for the `Date due` field
    And within the `Previous dates` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

