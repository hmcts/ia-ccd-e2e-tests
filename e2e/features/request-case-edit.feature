Feature: Request case edit

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

  @regression @edit-case @RIA-611
  Scenario: Request case edit

    When I click the `Overview` tab
    Then I should see the image `caseOfficer_caseUnderReview.png`

    And I select the `Request case edit` Next step
    Then I am on the `Request case edit` page
    And the `Explain the direction you are issuing` field should be empty
    And I should see `Legal representative` for the `Who are you giving the direction to?` field
    And the `By what date must they comply?` field should be empty

    When I type `Your case argument needs to be changed. Please make changes and resubmit.` for the `Explain the direction you are issuing` field
    And I type `{$TODAY+14}` for the `By what date must they comply?` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Your case argument needs to be changed. Please make changes and resubmit.` in the `Explain the direction you are issuing` field
    And I should see `Legal representative` for the `Who are you giving the direction to?` field
    And I should see `{$TODAY+14|D MMM YYYY}` for the `By what date must they comply?` field

    When I click the `Send direction` button
    Then I should see the text `You have sent a direction`
    Then I should see the text `What happens next`
    Then I should see the text `The appellant now needs to edit the case in the way you have directed.`
    Then I should see the text `The appellant should then submit their case again for you to review.`

    When I click the `Close and Return to case details` button if present
    And I click the `Directions` tab
    Then I should see the `Directions` field
    And within the `Directions` collection's first item, I should see `Your case argument needs to be changed. Please make changes and resubmit.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` for the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+14|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

    When I click the `Overview` tab
    Then I should see the image `caseOfficer_caseBuilding.png`
