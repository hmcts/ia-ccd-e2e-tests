Feature: Request hearing requirements

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
    And I request respondent review
    And I add the appeal response

  @regression @create-direction @RIA-385
  Scenario: Request respondent review

    When I select the `Request hearing requirements` Next step
    Then I am on the `Request hearing requirements` page
    When I click the `Send direction` button
    Then I should see an alert confirming the case `has been updated with event: Request hearing requirements`

    When I click the `Directions` tab
    Then I should see the `Directions` page
    And within the `Directions` collection's first item, I should see `Your appeal is going to a hearing.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `The case officer will review your hearing requirements and try to accommodate them.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `If you do not supply your hearing requirements within 5 days` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` for the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+5|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field
