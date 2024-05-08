Feature: Set Aside Decide FTPA Application for AiP

  Background:
    Given I am signed in as a `Judge`
    When I go to the `Case List`
    And I type `Random User` for the `Appellant name` field
    And  I filter the cases by `FTPA submitted` state
    And I wait for 2 seconds
    And  I click case at row 1 and navigate to case view page

  @set-aside-dlrm-aip @RIA-8622 @dlrm-1
  Scenario Outline: Rule31/Rule32 decisions for AiP
    When I select the `Decide FTPA application` Next step
    And I should see the text `Decide FTPA application`
    And I should see the text `Applicant`
    And I select `Appellant` for the `Who made the application?` field
    And I click the `Continue` button
    And I should see the text `Decision`
    And I select <decision> for the `The outcome of the application` field
    And I click the `Continue` button
    And I should see the text `Reasoning`
    And I type `Test reason for application` for the `Explain why the application should be disposed` field
    And I click the `Continue` button
    And I should see the text `Check your answers`
    And I should see the text <decision>
    And I should see the text `Test reason for application`
    And I click the `Submit` button
    And I should see the text `What happens next`
    And I should see the text `A Judge will update the decision`
    And I click the `Close and Return to case details` button
    And I should see the text `The appeal was removed from the FTPA process. See the details in the FTPA tab.`
    And I should see the text `When you are ready, update the appeal decision.`
    And I switch to be a `Case Officer`
    And I should see the text `An application for permission to appeal to the Upper Tribunal was removed from the FTPA process and Judge will decide it separately.`
    And I switch to be a `Admin Officer`
    And I should see the text `An application for permission to appeal to the Upper Tribunal was removed from the FTPA process and Judge will decide it separately.`
    And I switch to be a `Home Office Generic`
    And I should see the text `An application for permission to appeal to the Upper Tribunal was removed from the FTPA process and Judge will decide it separately.`
    Examples:
      | decision                             |
      | Dispose of application under rule 31 |
      | Dispose of application under rule 32 |

  @set-aside-dlrm-aip @RIA-8622 @dlrm
  Scenario: Rule35 decision for AiP
    When I select the `Decide FTPA application` Next step
    And I should see the text `Decide FTPA application`
    And I should see the text `Applicant`
    And I select `Appellant` for the `Who made the application?` field
    And I click the `Continue` button
    And I should see the text `Decision`
    And I select `Review decision under rule 35 - Resident Judge only` for the `The outcome of the application` field
    And I click the `Continue` button
    And I should see the text `Objections`
    And I should see the text `List any objections to the draft Notice from either party (Optional)`
    And I type `No Objections` for the `List any objections to the draft Notice from either party (Optional)` field
    And I add an item to the Notice communication (Optional) collection
    And within the `Notice communication` collection's first item, I upload `{@FTPANoticeOfCommunication.pdf}` for the Document (Optional) field
    And within the `Notice communication` collection's first item, I type `This is the ftpa notice of communication` for the Describe the document (Optional) field
    And I wait for 5 seconds

    And I click the `Continue` button
    And I should see the text `Final rule 35 notice`
    And I should see the text `Upload final rule 35 notice`
    When I upload `{@SignedDecisionNoticeReheard.pdf}` for the `Upload rule 35 notice` field
    And I wait for 5 seconds
    And I click the `Continue` button
    And I should see the text `Listing instructions`
    And I type `Test Judge` for the `Enter the name of a judge to exclude (Optional)` field
    And I type `Additional Test Instructions` for the `Enter any additional instructions (Optional)` field
    And I click the `Continue` button
    And I should see the text `Check your answers`
    And I click the `Submit` button
    And I should see the text `You've recorded the First-tier permission to appeal decision`
    And I click the `Close and Return to case details` button
    When I click the `Documents` tab
    Then I should see the `Set aside documents` field
    And within the `Set aside documents` collection's first item, I should see SignedDecisionNoticeReheard.pdf in the `Document` field
    And within the `Set aside documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And I wait for 5 seconds
    And I should see the `FTPA` tab
    When I click the `FTPA` tab
    And within the `Application` collection's first item, I should see `Appellant` in the `Applicant` field
    And within the `Application` collection's first item, I should see `Review decision under rule 35` for the `The outcome of the application` field
    And within the `Application` collection's first item, I should see SignedDecisionNoticeReheard.pdf in the `Rule 35 notice` field
    And within the `Application` collection's first item, I should see `No Objections` for the `Objections to set aside` field
    And within the `Notice communication` collection's first item, I should see FTPANoticeOfCommunication.pdf for the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` for the `Describe the document` field
    And within the `Application` collection's first item, I should see `Additional Test Instructions` in the `Listing instructions` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Decision date` field

