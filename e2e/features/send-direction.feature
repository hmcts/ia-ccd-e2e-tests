Feature: Send direction action

  Background:
    Given I am signed in as a `Case Officer`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal

  @send-direction @RIA-694
  Scenario: Send a direction

    When I select the `Send direction` Next step
    Then I am on the `Send direction` page
    When I type `Do the thing` for the `Explain the direction you are issuing` field
    And I select `Legal representative` for the `Who are you giving the direction to?` field
    And I type `31-12-2018` for the `By what date must they comply?` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Do the thing` for the `Explain the direction you are issuing` answer
    And I should see `Legal representative` for the `Who are you giving the direction to?` answer
    And I should see `31 Dec 2018` for the `By what date must they comply?` answer

    When I click the `Send direction` button
    Then I should see the text `You have sent a direction`
    Then I should see the text `What happens next`
    Then I should see the text `You can see the status of the direction in the directions tab`

    When I click the `directions tab` link
    Then I should see the `Directions` field
    And Within the first `Directions` collection item, I should see `Do the thing` for the `Explanation` field
    And Within the first `Directions` collection item, I should see `Legal representative` for the `Parties` field
    And Within the first `Directions` collection item, I should see `31 Dec 2018` for the `Date due` field
    And Within the first `Directions` collection item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

    When I click the `Send a new direction` link
    Then I am on the `Send direction` page
