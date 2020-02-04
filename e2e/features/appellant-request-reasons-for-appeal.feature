Feature: Request reasons for appeal

  @aip-case-progression
  Scenario: A Case officer can request the appellant gives their reasons for appeal
    Given An appellant has submitted an appeal
    And I am signed in as a `Case Officer`
    And I am viewing the appellant's case
    And I request respondent evidence
    And I switch to be a `Home Office APC`
    And I click the `upload the Home Office bundle` link
    And I am on the `Upload Home Office bundle` page
    And I add an item to the `Upload Home Office bundle` collection
    And within the `Upload Home Office bundle` collection's first item, I upload `{@Evidence1.pdf}` for the `Document` field
    And within the `Upload Home Office bundle` collection's first item, I type `This is the respondent evidence` for the `Describe the document` field
    And I click the `Continue` button
    And I am on the `Check your answers` page
    And I click the `Upload` button
    And I should see the text `You've uploaded the Home Office bundle`

    When I switch to be a `Case Officer`
    Then I should only see the `caseOfficer_awaitingRespondentEvidence_postUpload` case progress image
    When I click the `direct the appellant to submit their Appeal Reasons` link
    And I click the `Submit` button
    Then I should see the text `The appellant has been directed to submit their Appeal Reasons. You will be notified when it is ready to review.`
