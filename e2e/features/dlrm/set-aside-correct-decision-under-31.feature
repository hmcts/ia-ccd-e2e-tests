Feature: Update Tribunal Decision for Decided and FTPA Decided cases

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial EA appeal type without remission and with hearing fee and pay now
    And I wait for 10 seconds
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    And I pay for and submit my appeal by Card
    # And I pay for and submit my appeal by Card for a non PA appeal type
    And I wait for 15 seconds
    And I switch to be a `Case Officer`
    And I wait for 2 seconds
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Org User Rep A`
    And I wait for 2 seconds
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`
    And I wait for 2 seconds
    And I request respondent review
    And I add the appeal response
    And I request hearing requirements
    And I wait for 5 seconds
    And I switch to be a `Legal Org User Rep A`
    And I wait for 2 seconds
    And I submit hearing requirements with all yes when in country
    
    And I switch to be a `Case Officer`
    And I wait for 2 seconds
    And I record agreed hearing requirements yes path
    And I switch to be a `Admin Officer`
    And I wait for 2 seconds
    And I list the case
    And I switch to be a `Case Officer`
    And I wait for 2 seconds
    And I create case summary
    And I generate the hearing bundle
    And I wait for 30 seconds
    And I refresh the page
    And I wait for 4 seconds

    When I select the `Start decision and reasons` Next step
    Then I should see the text `Start decision and reasons`

    When I type `some introduction` for the `Introduction (Optional)` field
    And I click the `Continue` button
    Then I should see the text `Add the appellant's case summary`

    When I type `some case summary` for the `Appellant's case summary (Optional)` field
    And I click the `Continue` button
    Then I should see the text `Do both parties agree the immigration history?`

    When I select `Yes` for the `Do both parties agree the immigration history?` field
    When I type `some agreed immigration history` for the `Agreed immigration history (Optional)` field
    And I click the `Continue` button
    Then I see the text `Do both parties agree the schedule of issues?`

    When I select `Yes` for the `Do both parties agree the schedule of issues?` field
    When I type `some schedule of issues` for the `The appellant's schedule of issues (Optional)` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `some introduction` in the `Introduction` field
    When I click the `Save` button
    Then I should see the text `You have started the decision and reasons process`
    And I should see the text `The judge can now download and complete the decision and reasons document.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    And I prepare decision and reasons
    And I send decision and reasons
    When I switch to be a `Legal Org User Rep A`
    Then I wait for 2 seconds
    
    When I click the `Applications` tab
    And I select the `Make an application` Next step
    Then I should see the `Type of application` page
    And The page is accessible
    And I should see the option `Set aside a decision` for the `Type of application` field
    When I select `Set aside a decision` for the `Type of application` field
    And I click the `Continue` button
    Then I should see the `Explain your application` page
    And The page is accessible
    And I should see the text `Set aside a decision`
    When I type `Test reason for  Set aside a decision` for the `Explain why the decision should be set aside.` field
    And I add an item to the `Supporting evidence (Optional)` collection
    And within the `Supporting evidence (Optional)` collection's first item, I upload `{@Evidence1.pdf}` for the field without a label
    And I wait for 3 seconds
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And The page is accessible
    And I should see `Set aside a decision` in the `Type of application` field
    And I should see `Test reason for  Set aside a decision` in the `Explain why the decision should be set aside.` field
    And I should see `Evidence1.pdf` for the `Supporting evidence` field
    When I click the `Submit` button
    And The page is accessible
    Then I should see the text `You've made an application`
    And I should see the text `What happens next`
    And I should see the text `The Tribunal will consider your application as soon as possible. All parties will be notified when a decision has been made. you can review any applications you've made in the application tab.`
    When I click the `Close and Return to case details` button if present

    Then I apply for appellant FTPA
    And I switch to be a `Judge`
    When I select the `Decide FTPA application` Next step
    And I should see the text `Decide FTPA application`
    And I should see the text `Applicant`
    Then I validate the options displayed for `Who made the application?` field
      | options     |
      | Appellant   |
      | Home Office |
    And I select `Appellant` for the `Who made the application?` field
    And The page is accessible
    And I click the `Continue` button
    And I should see the text `Decision`
    Then I validate the options displayed for `The outcome of the application` field
      | options                                             |
      | Permission granted                                  |
      | Permission partially granted                        |
      | Permission refused                                  |
      | Application not admitted                            |
      | Review decision under rule 35 - Resident Judge only |
      | Dispose of application under rule 31                |
      | Dispose of application under rule 32                |
    And I select `Permission granted` for the `The outcome of the application` field
    And I click the `Continue` button
    And I should see the text `Decide FTPA application`
    And The page is accessible
    And I should see the text `FTPA Decision and Reasons`
    When I upload `{@FTPADecisionAndReasons.pdf}` for the document field without a label
    And I click the `Continue` button
    And The page is accessible
    And I click the `Yes` label
    And I should see the text `List any objections to the draft Notice from either party (Optional)`
    And I click the `Continue` button
    And The page is accessible
    And I should see the text `Notes for the Upper Tribunal`
    And I click the `There is a point of special difficulty or importance` label
    And I click the `There are special reasons, such as the need to request the First-tier Tribunal to provide observations on the grounds of appeal` label
    And I click the `It's clear at this stage that the issue is likely to be used for giving country guidance` label
    And I click the `Continue` button
    And The page is accessible
    And I should see the text `Check your answers`
    And I click the `Submit` button
    And I should see the text `You've recorded the First-tier permission to appeal decision`
    And I click the `Close and Return to case details` button
    

  @set-aside-dlrm @RIA-8157 @appeal-nightly-test @dlrm @appeal-nightly-test @appeal-nightly-test-retry1
  Scenario Outline: Correct decision error under rule 31
    And I wait for 2 seconds
    When I select the `Update Tribunal decision` Next step
    Then I should see the text `Update Tribunal decision`
    And I should see the text `Reason for updating the decision`
    Then I validate the options displayed for `What is the reason for updating the decision?` field
      | options                                             |
      | Correct decision error under rule 31                |
      | Review decision under rule 32 - Resident Judge only |
    And I select `Correct decision error under rule 31` for the `What is the reason for updating the decision?` field
    And I click the `Continue` button
    And I should see the text `Update Tribunal decision`
    And The page is accessible
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
    And I should see the text `Do you want to upload a corrected Decision and Reasons document?`
    And The page is accessible
    Then I validate the options displayed for `Do you want to upload a corrected Decision and Reasons document?` field
      | options |
      | Yes     |
      | No      |
    And I select `Yes` for the `Do you want to upload a corrected Decision and Reasons document?` field
    And I type `Test Summary Changes` for the `Summarise the changes made in the corrected Decision and Reasons document` field
    And I upload `{@SignedDecisionNoticeReheard.pdf}` for the `Decision and Reasons document` field
    And I wait for 3 seconds
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Correct decision error under rule 31` in the `What is the reason for updating the decision?` field
    And I should see `Yes, change decision to Dismissed` in the `Do you want to change the decision?` field
    And I should see `Yes` in the `Do you want to upload a corrected Decision and Reasons document?` field
    And I should see `Test Summary Changes` in the `Summarise the changes made in the corrected Decision and Reasons document` field
    And I should see `Decision-and-reasons-AMENDED.pdf` in the `Decision and Reasons document` field
    Examples:
      | case_state   |
      # | Decided      |
      | FTPA decided |

