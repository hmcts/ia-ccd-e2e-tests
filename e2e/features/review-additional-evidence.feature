Feature: Review Additional Evidence

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I click the `Overview` tab
    When I select the `Request Home Office data` Next step
    And I am on the `Match appellant details` page
    And I should see the option `No Match` for the `Make a selection` field
    And I select `No Match` for the `Make a selection` field
    And I click the `Continue` button
    And I click the `Request Home Office data` button
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Org User Rep A`
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`
    And I request respondent review
    And I add the appeal response

  @RIA-4747 @RIA-4747-Legal-rep
  Scenario: Additional evidence submitted by a Legal Rep

    When I switch to be a `Legal Org User Rep A`
    And I upload additional evidence

    And I switch to be a `Case Officer`
    And I select the `Mark evidence as reviewed` Next step
    And I click the `Mark as reviewed` button
    And I should see the text `What happens next`

  @RIA-4747 @RIA-4747-HO
  Scenario: Additional evidence submitted by a Legal Rep

    When I switch to be a `Home Office LART`
    And I select the `Upload additional evidence` Next step

    When I add an item to the `Additional evidence` collection
    And within the `Additional evidence` collection's first item, I upload `{@HomeOfficeEvidence.pdf}` for the `Document` field
    And within the `Additional evidence` collection's first item, I type `This is the additional Home Office evidence` for the `Why it was late` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page

    When I click the `Upload` button
    And  I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    And I switch to be a `Case Officer`
    And I select the `Mark evidence as reviewed` Next step
    And I click the `Mark as reviewed` button
    And I should see the text `What happens next`
