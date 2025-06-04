Feature: Send direction action

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`

  @regression @send-direction @RIA-602 @RIA-723 @RIA-2240
  Scenario: Change a direction due date case officer
    
    Then I should not see the `Change a direction due date` link
    When I select the `Send direction` Next step

    Then I am on the `Send direction` page

    When I type `Do the thing` for the `Explain the direction you are issuing` field
    And I select `Legal representative` for the `Who are you giving the direction to?` field
    And I type `{$TODAY+8|DD MM YYYY}` for the `By what date must they comply?` field
    And I click the `Continue` button
    And I click the `Send direction` button
    And I click the `directions tab` link

    Then I should see the `Change a direction due date` link
    And I should see the `Directions` field
    And within the `Directions` collection's first item, I should see `Do the thing` for the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` for the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+8|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

    When I click the `Change a direction due date` link

    Then I am on the `Change a direction due date` page
    And I should see the text `Select the direction that needs updating.`

    When I type `Direction 1` for the `Direction to be updated` field
    And I click the `Continue` button

    Then I should see the text `Enter the new due date.`

    When I type `31-12-2022` for the `Date due` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Direction 1` in the `Direction to be updated` field
    And I should see `Do the thing` in the `Explanation` field
    And I should see `Legal representative` in the `Parties` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Date sent` field
    And I should see `31 Dec 2022` in the `Date due` field

    When I click the `Send direction` button
    Then I should see the text `You have changed the due date`
    And I should see the text `What happens next`
    And I should see the text `The party has been notified of their time extension. You can see the status of the direction in the directions tab`

    When I click the `directions tab` link

    Then I should see the `Change a direction due date` link
    And I should see the `Directions` field
    And within the `Directions` collection's first item, I should see `Do the thing` for the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` for the `Parties` field
    And within the `Directions` collection's first item, I should see `31 Dec 2022` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

    And within the `Previous dates` collection's first item, I should see `{$TODAY+8|D MMM YYYY}` for the `Date due` field
    And within the `Previous dates` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

  @regression @send-direction @RIA-602 @RIA-723 @RIA-2240
  Scenario: Change a direction due date judge
    
    Then I should not see the `Change a direction due date` link

    When I select the `Send direction` Next step

    Then I am on the `Send direction` page

    When I type `Do the thing` for the `Explain the direction you are issuing` field
    And I select `Legal representative` for the `Who are you giving the direction to?` field
    And I type `{$TODAY+8|DD MM YYYY}` for the `By what date must they comply?` field
    And I click the `Continue` button
    And I click the `Send direction` button
    
    And I switch to be a `Judge`
    And I click the `Directions` tab

    Then I should see the `Change a direction due date` link
    And I should see the `Directions` field
    And within the `Directions` collection's first item, I should see `Do the thing` for the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` for the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+8|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

    

    When I click the `Change a direction due date` link

    Then I am on the `Change a direction due date` page
    And I should see the text `Select the direction that needs updating.`

    When I type `Direction 1` for the `Direction to be updated` field
    And I click the `Continue` button

    Then I should see the text `Enter the new due date.`

    When I type `31-12-2022` for the `Date due` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Direction 1` in the `Direction to be updated` field
    And I should see `Do the thing` in the `Explanation` field
    And I should see `Legal representative` in the `Parties` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Date sent` field
    And I should see `31 Dec 2022` in the `Date due` field

    When I click the `Send direction` button
    Then I should see the text `You have changed the due date`
    And I should see the text `What happens next`
    And I should see the text `The party has been notified of their time extension. You can see the status of the direction in the directions tab`

    When I click the `directions tab` link

    Then I should see the `Change a direction due date` link
    And I should see the `Directions` field
    And within the `Directions` collection's first item, I should see `Do the thing` for the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` for the `Parties` field
    And within the `Directions` collection's first item, I should see `31 Dec 2022` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

    And within the `Previous dates` collection's first item, I should see `{$TODAY+8|D MMM YYYY}` for the `Date due` field
    And within the `Previous dates` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field
