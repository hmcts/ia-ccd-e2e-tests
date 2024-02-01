Feature: Set Aside Decide FTPA Application

  Background:
    Given I am signed in as a `Judge`
    When I go to the `Case List`
    And  I filter the cases by `FTPA submitted` state
    And I wait for 2 seconds
    And  I click case at row 1 and navigate to case view page


  @set-aside-dlrm @RIA-8101 @dlrm
  Scenario: Remove Leadership judge FTPA Decision event and rename Resident judge FTPA Decision event
    Then I should see the option `Decide FTPA application` for the `Next step` field
    And I should not see the option `Leadership judge FTPA Decision` for the `Next step` field
    And I should not see the option `Resident judge FTPA decision` for the `Next step` field
    And I should see the text `Do this next`
    And I should see the text `Review the application for permission to appeal in the FTPA tab. When you are ready, record the application decision.`
    And I should see the text `If the application should be treated in a different way`
    And I should see the text `You can remove the case from the FTPA process when recording the application decision. A Judge will then update the Tribunal decision.`
    And I should see the text `If you are pursuing a rule 35 decision to be set aside`
    And I should see the text `This can only be done by a Resident Judge. You must send the Notice of Intention to Set Aside to both parties offline and await any objections before recording the application decision.`

  @set-aside-dlrm @RIA-8102 @dlrm
  Scenario: Decide FTPA application event screen
    When I select the `Decide FTPA application` Next step
    And I should see the text `Decide FTPA application`
    And I should see the text `Applicant`
    Then I validate the options displayed for `Who made the application?` field
      | options     |
      | Appellant   |
      | Home Office |
    And I select `Appellant` for the `Who made the application?` field
    And I click the `Continue` button
    And I should see the text `Decision`
    Then I validate the options displayed for `The outcome of the application` field
      | options                                             |
      | Permission granted                                  |
      | Permission partially granted                        |
      | Permission refused                                  |
      | Application not admitted                            |
      | Withdrawn                                           |
      | Review decision under rule 35 - Resident Judge only |
      | Dispose of application under rule 31                |
      | Dispose of application under rule 32                |
    And I select `Permission granted` for the `The outcome of the application` field
    And I click the `Continue` button
    And I should see the text `Decide FTPA application`
    When I upload `{@FTPADecisionAndReasons.pdf}` for the document field without a label
    And I click the `Continue` button
    And I click the `Yes` label
    And I should see the text `List any objections to the draft Notice from either party (Optional)`
    And I click the `Continue` button
    And I should see the text `Notes for the Upper Tribunal`
    And I click the `There is a point of special difficulty or importance` label
    And I click the `There are special reasons, such as the need to request the First-tier Tribunal to provide observations on the grounds of appeal` label
    And I click the `It's clear at this stage that the issue is likely to be used for giving country guidance` label
    And I click the `Continue` button
    And I should see the text `Check your answers`
    And I click the `Submit` button
    And I should see the text `You've recorded the First-tier permission to appeal decision`
    And I click the `Close and Return to case details` button
