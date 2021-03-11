Feature: Generate skeleton bundle


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

  @regression @generate-skeleton-bundle @RIA-481
  Scenario: Generate skeleton bundle
    When I select the `Submit your case` Next step
    And I am on the `Submit your case` page
    And I click the `Submit` button
    And I click the `Close and Return to case details` button
    And I click the `Documents` tab

    And within the `Legal representative documents` collection's first item, I should see `-González-appeal-skeleton-argument.PDF` in the `Document` field
    And within the `Legal representative documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
