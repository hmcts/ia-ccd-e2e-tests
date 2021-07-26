Feature: Appeal submission PDF

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal

  @overview-tab @RIA-769 @toggled-off
  Scenario: Appeal submission PDF is in documents tab

    When I click the `Documents` tab

    And I should see the `Appellant documents` field
    And within the `Appellant documents` collection's first item, I should see `-Gonzlez-appeal-form.PDF` in the `Document` field
    And within the `Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
