Feature: Request respondent evidence

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Rep`
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`

  @create-direction @RIA-435
  Scenario: Request respondent review

    When I select the `Request respondent review` Next step
    Then I am on the `Request respondent review` page
    And I should see `You must now review this case.` in the `Explain the direction you are issuing` field
    And I should see `You have 14 days to review` in the `Explain the direction you are issuing` field
    And I should see `You must explain whether the appellant's appeal argument makes a valid case` in the `Explain the direction you are issuing` field
    And I should see `Respondent` for the `Who are you giving the direction to?` field
    And I should see `{$TODAY+14}` for the `By what date must they comply?` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `You must now review this case.` in the `Explain the direction you are issuing` field
    And I should see `You have 14 days to review` in the `Explain the direction you are issuing` field
    And I should see `You must explain whether the appellant's appeal argument makes a valid case` in the `Explain the direction you are issuing` field
    And I should see `Respondent` for the `Who are you giving the direction to?` field
    And I should see `{$TODAY+14|D MMM YYYY}` for the `By what date must they comply?` field

    When I click the `Send direction` button
    Then I should see the text `You have sent a direction`
    Then I should see the text `What happens next`
    Then I should see the text `Wait for the respondent to complete the direction`

    When I click the `Close and Return to case details` button
    And I click the `Directions` tab
    Then I should see the `Directions` page
    And within the `Directions` collection's first item, I should see `You must now review this case.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `You have 14 days to review` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `You must explain whether the appellant's appeal argument makes a valid case` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Respondent` for the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+14|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

  @create-direction @RIA-435
  Scenario: Request respondent review with changes to default values

    When I select the `Request respondent review` Next step
    Then I am on the `Request respondent review` page
    When I type `Something else` for the `Explain the direction you are issuing` field
    When I type `31-12-2020` for the `By what date must they comply?` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Something else` for the `Explain the direction you are issuing` field
    And I should see `Respondent` for the `Who are you giving the direction to?` field
    And I should see `31 Dec 2020` for the `By what date must they comply?` field

    When I click the `Send direction` button
    Then I should see the text `You have sent a direction`

    When I click the `Close and Return to case details` button
    And I click the `Directions` tab
    Then I should see the `Directions` page
    And within the `Directions` collection's first item, I should see `Something else` for the `Explanation` field
    And within the `Directions` collection's first item, I should see `Respondent` for the `Parties` field
    And within the `Directions` collection's first item, I should see `31 Dec 2020` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field
