Feature: Create user


  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case


  @create-user
  Scenario: Create a case up to a point

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

    #### New functionality

    And I switch to be a `Legal Rep`
    And I submit hearing requirements

    #### End new functionality

    And I switch to be a `Admin Officer`
    And I list the case
    And I switch to be a `Case Officer`
    #And I create case summary
    #And I generate the hearing bundle
    #And I start decision and reasons
    #And I generate decision and reasons
    #And I send decision and reasons


