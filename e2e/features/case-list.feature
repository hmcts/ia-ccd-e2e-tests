Feature: Case list

  @case-list @RIA-583 @RIA-902 @RIA-608
  Scenario: Case list contains correct columns for Legal Rep

    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    When I click the `Case List` link
    And I filter the cases by todays date
    Then I should see the text `Reference number`
    And I should see the text `Appellant name`
    And I should see the text `Status`
    And I should see the text `Appeal start date`
    And I should see the `DRAFT` link

  @case-list @RIA-583 @RIA-902 @RIA-608
  Scenario: Case list contains correct columns for Case Officer

    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    When I click the `Case List` link
    And I filter the cases by todays date
    Then I should see the text `Reference number`
    And I should see the text `Appellant name`
    And I should see the text `Status`
    And I should see the text `Appeal start date`
    And I should not see the `DRAFT` link
