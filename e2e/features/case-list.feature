Feature: Case list

  @regression @case-list @RIA-583 @RIA-902 @RIA-608
  Scenario: Case list contains correct columns for Legal Rep

    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal with `88 Greville Road, Cambridge` address and `CB1 3QL` postcode
    When I click the `Case List` link
    And  I filter the cases by `CB1 3QL` postcode
    Then I should see the text `HMCTS reference`
    And I should see the text `Appellant name`
    And I should see the text `Status`
    And I should see the text `Hearing date`
    And I wait for 10 seconds
    And I should see the `DRAFT` link

  @regression @case-list @RIA-583 @RIA-902 @RIA-608
  Scenario: Case list contains correct columns for Case Officer

    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal with `88 Greville Road, Cambridge` address and `CB1 3QL` postcode
    And I submit my appeal
    And I switch to be a `Case Officer`
    When I click the `Case List` link
    And  I filter the cases by `CB1 3QL` postcode
    Then I should see the `HMCTS reference` field
    And I should see the `Appellant name` field
    And I should see the `Date of birth` field
    And I should see the `Post code` field
    And I should see the `Legal representative reference` field
    And I should see the `Home Office reference` field
    And I should see the text `Status`
    And I should see the text `Hearing date`
    And I should see the text `Appellant name`
    And I should not see the `DRAFT` link

  @regression @case-list @RIA-1611
  Scenario: Case list contains correct columns for Admin Officer

    Given I am signed in as a `Admin Officer`
    Then I should see the `HMCTS reference` field
    And I should see the `Appellant name` field
    And I should see the `Date of birth` field
    And I should see the `Post code` field
    And I should see the `Legal representative reference` field
    And I should see the `Home Office reference` field

  @regression @case-list @RIA-609 @RIA-1380 @wip
  Scenario: Case list contains correct filters for Legal Rep

    Given I am signed in as a `Legal Rep`
    When I go to the `Case List`
    And I should see the option `Immigration & Asylum` for the `Jurisdiction` field
    And I should see the `Jurisdiction` field
    And I should see the `Case type` field
    And I should see the option `Appeal` prefix for the `Case type` field
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
    And I should see the option `Decision` for the `State` field
    And I should see the option `Decided` for the `State` field
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
    And I should see the `Home Office reference` field
    And I should see the text `Appellant name`

  @regression @case-list @RIA-609 @RIA-1380
  Scenario: Case list contains correct filters for Case Officer

    Given I am signed in as a `Case Officer`
    When I go to the `Case List`
    And I should see the option `Immigration & Asylum` for the `Jurisdiction` field
    And I should see the `Jurisdiction` field
    And I should see the `Case type` field
    And I should see the option `Appeal` prefix for the `Case type` field
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
    And I should see the option `Decision` for the `State` field
    And I should see the option `Decided` for the `State` field
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
    And I should see the `Home Office reference` field

  @regression @case-list @RIA-1611 @RIA-1380
  Scenario: Case list contains correct filters for Admin Officer

    Given I am signed in as a `Admin Officer`
    When I go to the `Case List`
    And I should see the option `Immigration & Asylum` for the `Jurisdiction` field
    And I should see the `Jurisdiction` field
    And I should see the `Case type` field
    And I should see the option `Appeal` prefix for the `Case type` field
    And I should see the `State` field
    And I should see the option `Any` for the `State` field
    And I should see the option `Listing` for the `State` field
    And I should see the option `Prepare for hearing` for the `State` field
    And I should see the option `Decision` for the `State` field
    And I should see the option `Decided` for the `State` field
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
    And I should see the `Home Office reference` field
