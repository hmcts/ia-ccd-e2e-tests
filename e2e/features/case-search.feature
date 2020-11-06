Feature: Case search

  @case-search @RIA-1478
  Scenario: Case search contains correct columns for Legal Rep

    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal with `88 Greville Road, Cambridge` address and `CB1 3QL` postcode
    When I click the `Search` link
    Then I should see the `HMCTS reference` field
    And I should see the `Appellant name` field
    And I should see the `Date of birth` field
    And I should see the `Post code` field
    And I should see the `Legal representative reference` field
    And I should see the `Home Office Reference/Case ID` field
    When I filter the cases by `CB1 3QL` postcode
    Then I should see the text `HMCTS reference`
    And I should see the text `Appellant name`
    And I should see the text `Status`
    And I should see the text `Hearing date`
    And I wait for 10 seconds
    And I should see the `DRAFT` link

  @case-search @RIA-1478
  Scenario: Case search contains correct columns for Case Officer

    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal with `88 Greville Road, Cambridge` address and `CB1 3QL` postcode
    And I submit my appeal
    And I switch to be a `Case Officer`

    When I click the `Search` link
    Then I should see the `HMCTS reference` field
    And I should see the `Appellant name` field
    And I should see the `Date of birth` field
    And I should see the `Post code` field
    And I should see the `Legal representative reference` field
    And I should see the `Home Office Reference/Case ID` field

    When  I filter the cases by `CB1 3QL` postcode
    Then I should see the text `HMCTS reference`
    And I should see the text `Appellant name`
    And I should see the text `Status`
    And I should see the text `Hearing date`
    And I should not see the `DRAFT` link

  @case-search @RIA-1478
  Scenario: Case search contains correct columns for Admin Officer

    Given I am signed in as a `Admin Officer`
    Then I should see the `HMCTS reference` field
    And I should see the `Appellant name` field
    And I should see the `Date of birth` field
    And I should see the `Post code` field
    And I should see the `Legal representative reference` field
    And I should see the `Home Office Reference/Case ID` field

  @case-search @RIA-1478
  Scenario: Case search contains correct filters for Legal Rep

    Given I am signed in as a `Legal Rep`
    When I click the `Search` link
    And I should see the option `Immigration & Asylum` for the `Jurisdiction*` field
    And I should see the `Jurisdiction*` field
    And I should see the `Case type*` field
    And I should not see the `State` field
    And I should see the `Hearing centre` field
    And I should see the option `Manchester` for the `Hearing centre` field
    And I should see the option `Taylor House` for the `Hearing centre` field
    And I should see the option `Newport` for the `Hearing centre` field
    And I should see the option `Bradford` for the `Hearing centre` field
    And I should see the option `North Shields` for the `Hearing centre` field
    And I should see the option `Birmingham` for the `Hearing centre` field
    And I should see the option `Hatton Cross` for the `Hearing centre` field
    And I should see the option `Glasgow` for the `Hearing centre` field
    Then I should see the `HMCTS reference` field
    And I should see the `Appellant name` field
    And I should see the `Date of birth` field
    And I should see the `Post code` field
    And I should see the `Legal representative reference` field
    And I should see the `Home Office Reference/Case ID` field

  @case-search @RIA-1478
  Scenario: Case search contains correct filters for Case Officer

    Given I am signed in as a `Case Officer`
    When I click the `Search` link
    And I should see the option `Immigration & Asylum` for the `Jurisdiction*` field
    And I should see the `Jurisdiction*` field
    And I should see the `Case type*` field
    And I should not see the `State` field
    And I should see the `Hearing centre` field
    And I should see the option `Manchester` for the `Hearing centre` field
    And I should see the option `Taylor House` for the `Hearing centre` field
    And I should see the option `Newport` for the `Hearing centre` field
    And I should see the option `Bradford` for the `Hearing centre` field
    And I should see the option `North Shields` for the `Hearing centre` field
    And I should see the option `Birmingham` for the `Hearing centre` field
    And I should see the option `Hatton Cross` for the `Hearing centre` field
    And I should see the option `Glasgow` for the `Hearing centre` field
    Then I should see the `HMCTS reference` field
    And I should see the `Appellant name` field
    And I should see the `Date of birth` field
    And I should see the `Post code` field
    And I should see the `Legal representative reference` field
    And I should see the `Home Office Reference/Case ID` field

  @case-search @RIA-1478
  Scenario: Case search contains correct filters for Admin Officer

    Given I am signed in as a `Admin Officer`
    When I click the `Search` link
    And I should see the option `Immigration & Asylum` for the `Jurisdiction*` field
    And I should see the `Jurisdiction*` field
    And I should see the `Case type*` field
    And I should not see the `State` field
    And I should see the `Hearing centre` field
    And I should see the option `Manchester` for the `Hearing centre` field
    And I should see the option `Taylor House` for the `Hearing centre` field
    And I should see the option `Newport` for the `Hearing centre` field
    And I should see the option `Bradford` for the `Hearing centre` field
    And I should see the option `North Shields` for the `Hearing centre` field
    And I should see the option `Birmingham` for the `Hearing centre` field
    And I should see the option `Hatton Cross` for the `Hearing centre` field
    And I should see the option `Glasgow` for the `Hearing centre` field
    Then I should see the `HMCTS reference` field
    And I should see the `Appellant name` field
    And I should see the `Date of birth` field
    And I should see the `Post code` field
    And I should see the `Legal representative reference` field
    And I should see the `Home Office Reference/Case ID` field

  @case-search @RIA-1478
  Scenario: Case search contains correct filters for Home Office user

    Given I am signed in as a `Home Office APC`
    When I click the `Search` link
    And I should see the option `Immigration & Asylum` for the `Jurisdiction*` field
    And I should see the `Jurisdiction*` field
    And I should see the `Case type*` field
    And I should not see the `State` field
    And I should see the `Hearing centre` field
    And I should see the option `Manchester` for the `Hearing centre` field
    And I should see the option `Taylor House` for the `Hearing centre` field
    And I should see the option `Newport` for the `Hearing centre` field
    And I should see the option `Bradford` for the `Hearing centre` field
    And I should see the option `North Shields` for the `Hearing centre` field
    And I should see the option `Birmingham` for the `Hearing centre` field
    And I should see the option `Hatton Cross` for the `Hearing centre` field
    And I should see the option `Glasgow` for the `Hearing centre` field
    And I should see the `HMCTS reference` field
    And I should see the `Appeal start date` field
    And I should see the `Appellant name` field
