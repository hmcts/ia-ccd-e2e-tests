Feature: Appeal submission PDF

  @overview-tab @RIA-769 @toggled-off
  Scenario: Appeal submission PDF is in documents tab

    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal

    When I click the `Documents` tab
    Then I should see the `Documents` page
    And I should see the `Legal representative documents` field
    And within the `Legal representative documents` collection's first item, I should see `-Gonzlez-appeal-form.PDF` in the `Document` field
    And within the `Legal representative documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
