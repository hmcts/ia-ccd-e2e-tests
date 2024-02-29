Feature: Set Aside Decide FTPA Application for AiP

  Background:
    Given I am signed in as a `Judge`
    When I go to the `Case List`

  @set-aside-dlrm @RIA-8157 @dlrm
  Scenario Outline: Correct decision error under rule 31
    When  I filter the cases by `<case_state>` state
    And I wait for 2 seconds
    And  I click case at row 1 and navigate to case view page
    When I select the `Update Tribunal decision` Next step
    Then I should see the text `Update Tribunal decision`
    And I should see the text `Reason for updating the decision`
    Then I validate the options displayed for `What is the reason for updating the decision?` field
      | options                                             |
      | Correct decision error under rule 31                |
      | Review decision under rule 32 - Resident Judge only |
    And I select `Correct decision error under rule 31` for the `What is the reason for updating the decision?` field
    And I click the `Continue` button
    And I should see the text `Decision`
    And I should see the text `Current decision`
    And I wait for 3 seconds
    # Then I validate the options displayed for `Do you want to change the decision?` field
    #   | options                           |
    #   | Yes, change decision to Dismissed |
    #   | No                                |
    And I click the `Yes, change decision to Dismissed` label
    # And I select `Yes, change decision to Dismissed` for the `Do you want to change the decision?` field
    And I click the `Continue` button
    And I should see the text `Decision and Reasons document`
    And I should see the text `Do you want to upload a corrected Decisions and Reasons document?`
    Then I validate the options displayed for `Do you want to upload a corrected Decisions and Reasons document?` field
      | options |
      | Yes     |
      | No      |
    And I select `Yes` for the `Do you want to upload a corrected Decisions and Reasons document?` field
    And I type `Test Summary Changes` for the `Summarise the changes made in the corrected Decisions and Reasons document` field
    And I upload `{@SignedDecisionNoticeReheard.pdf}` for the `Upload Decision and Reasons document` field
    And I wait for 3 seconds
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Correct decision error under rule 31` in the `What is the reason for updating the decision?` field
    And I should see `Yes, change decision to Dismissed` in the `Do you want to change the decision?` field
    And I should see `Yes` in the `Do you want to upload a corrected Decisions and Reasons document?` field
    And I should see `Test Summary Changes` in the `Summarise the changes made in the corrected Decisions and Reasons document` field
    And I should see `Decision-and-reasons-AMENDED.pdf` in the `Upload Decision and Reasons document` field
    Examples:
      | case_state   |
      | Decided      |
      | FTPA decided |

