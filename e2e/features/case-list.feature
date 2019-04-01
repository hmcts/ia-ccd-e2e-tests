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
    And I wait for 10 seconds
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

  @case-list @RIA-609
  Scenario: Case list contains correct filters for Legal Rep

    Given I am signed in as a `Legal Rep`
    When I go to the `Case List`
    And I should see the option `Immigration & Asylum` for the `Jurisdiction` field
    And I should see the `Jurisdiction` field
    And I should see the `Case type` field
    And I should see the option `IA Asylum Case` prefix for the `Case type` field
    And I should see the `State` field
    And I should see the option `Any` for the `State` field
    And I should see the option `Appeal started` for the `State` field
    And I should see the option `Appeal submitted` for the `State` field
    And I should see the option `Awaiting respondent evidence` for the `State` field
    And I should see the option `Case building` for the `State` field
    And I should see the option `Case under review` for the `State` field
    And I should see the option `Respondent review` for the `State` field
    And I should see the option `Submit hearing requirements` for the `State` field
    And I should see the option `Listing` for the `State` field
    And I should see the option `Prepare for hearing` for the `State` field
    And I should see the option `Final bundling` for the `State` field
    And I should see the option `Pre hearing` for the `State` field
    And I should see the option `Hearing and outcome` for the `State` field
    And I should see the option `Decided` for the `State` field
    And I should see the `Hearing centre` field
    And I should see the option `Manchester` for the `Hearing centre` field
    And I should see the option `Taylor House` for the `Hearing centre` field
    And I should see the `Reference number` field
    And I should see the `Appeal start date` field
    And I should see the `Appellant name` field

  @case-list @RIA-609
  Scenario: Case list contains correct filters for Case Officer

    Given I am signed in as a `Case Officer`
    When I go to the `Case List`
    And I should see the option `Immigration & Asylum` for the `Jurisdiction` field
    And I should see the `Jurisdiction` field
    And I should see the `Case type` field
    And I should see the option `IA Asylum Case` prefix for the `Case type` field
    And I should see the `State` field
    And I should see the option `Any` for the `State` field
    And I should not see the option `Appeal started` for the `State` field
    And I should see the option `Appeal submitted` for the `State` field
    And I should see the option `Awaiting respondent evidence` for the `State` field
    And I should see the option `Case building` for the `State` field
    And I should see the option `Case under review` for the `State` field
    And I should see the option `Respondent review` for the `State` field
    And I should see the option `Submit hearing requirements` for the `State` field
    And I should see the option `Listing` for the `State` field
    And I should see the option `Prepare for hearing` for the `State` field
    And I should see the option `Final bundling` for the `State` field
    And I should see the option `Pre hearing` for the `State` field
    And I should see the option `Hearing and outcome` for the `State` field
    And I should see the option `Decided` for the `State` field
    And I should see the `Hearing centre` field
    And I should see the option `Manchester` for the `Hearing centre` field
    And I should see the option `Taylor House` for the `Hearing centre` field
    And I should see the `Reference number` field
    And I should see the `Appeal start date` field
    And I should see the `Appellant name` field
