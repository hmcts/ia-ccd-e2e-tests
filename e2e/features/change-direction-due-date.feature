Feature: Send direction action

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`

  @send-direction @RIA-602
  Scenario: Change a direction due date

    Then I should not see the `Change the direction due date` link

    When I select the `Send direction` Next step
    Then I am on the `Send direction` page
    When I type `Do the thing` for the `Explain the direction you are issuing` field
    And I select `Legal representative` for the `Who are you giving the direction to?` field
    And I type `31-12-2018` for the `By what date must they comply?` field
    And I click the `Continue` button
    And I click the `Send direction` button

    When I click the `directions tab` link
    Then I should see the `Change the direction due date` link
    Then I should see the `Directions` field
    And within the `Directions` collection's first item, I should see `Do the thing` for the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` for the `Parties` field
    And within the `Directions` collection's first item, I should see `31 Dec 2018` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

    When I click the `Change the direction due date` link
    Then I am on the `Change the direction due date` page
    Then I should see the text `Important message`
    Then I should see the text `You must ONLY edit the part of this page labelled 'By what date must they comply?'`
    When I type `I am not supposed to change this` for the `Explanation` field
    And I type `Both` for the `Parties` field
    And I type `31-12-2022` for the `By what date must they comply?` field
    And I click the `Continue` button

    When I click the `Update direction` button
    Then I should see the text `You have changed the due date`
    Then I should see the text `What happens next`
    Then I should see the text `You can see the status of the direction in the directions tab`

    When I click the `directions tab` link
    Then I should see the `Change the direction due date` link
    Then I should see the `Directions` field
    And within the `Directions` collection's first item, I should see `Do the thing` for the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` for the `Parties` field
    And within the `Directions` collection's first item, I should see `31 Dec 2022` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field
