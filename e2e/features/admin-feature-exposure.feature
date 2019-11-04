Feature: Admin officer has reduced functionality


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

  @regression @RIA-1627
  Scenario: Admin officer has reduced functionality

    Given I switch to be a `Admin Officer`
    When I click the `Case notes` tab
    Then I should not see the `Add case note` link

    When I click the `Directions` tab
    Then I should not see the `Send new direction` link
    And I should not see the `Change the direction due date` link

    When I click the `Documents` tab
    Then I should not see the `Upload additional evidence` link
