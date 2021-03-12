Feature: Case history viewer tab


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

@case-history-tab @RIA-1427
Scenario: View case history

  When I click the `Case history` tab
  And I click the `Build your case` link
  And I click the `Pay and submit` link
  And I click the `Start your appeal` link

  Then I switch to be a `Case Officer`
  And I click the `Case history` tab
  And I click the `Upload respondent evidence` link
  And I click the `Request respondent evidence` link
