Feature: Generate hearing ready bundle


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
    And I request hearing requirements
    And I list the case
    And I create case summary

  @generate-hearing-ready-bundle @RIA-941
  Scenario: Generate hearing ready bundle
    When I click the `Documents` tab
    Then I should see the `Documents` page

    When I select the `Generate hearing bundle` Next step
    Then I should see the `Generate hearing bundle` page
    And I should see the `Generate` button

    When I click the `Generate` button
    And I click the `Documents` tab
    Then I should see the `Documents` page
    And within the `Hearing documents` collection's first item, I should see `-González-hearing-bundle.PDF` in the `Document` field
    And within the `Hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
