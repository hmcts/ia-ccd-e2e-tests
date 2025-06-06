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
    And within the `Upload Home Office bundle` collection's first item, I upload `{@Evidence1.pdf}` for the `Document` document field
    And within the `Upload Home Office bundle` collection's first item, I type `This is the respondent evidence` for the `Describe the document` field
    And I click the `Continue` button
    And I am on the `Check your answers` page
    And I click the `Upload` button
    And I should see the text `You've uploaded the Home Office bundle`
    When I switch to be a `Case Officer`
    Then I should only see the `caseOfficer_awaitingRespondentEvidence_postUpload` case progress image
    When I click the `direct the appellant to submit their Appeal Reasons` link
    Then I am on the `Request Appeal Reasons` page
    And I should see `You must now tell us why you think the Home Office decision to refuse your claim is wrong.` in the `Explain the direction you are issuing` field
    And I should see `Appellant` for the `Who are you giving the direction to?` field
    And I should see `{$TODAY+28}` for the `By what date must they comply?` field
    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `You must now tell us why you think the Home Office decision to refuse your claim is wrong.` in the `Explain the direction you are issuing` field
    And I should see `Appellant` for the `Who are you giving the direction to?` field
    And I should see `{$TODAY+28|D MMM YYYY}` for the `By what date must they comply?` field
    When I click the `Submit` button
    Then I should see the text `You have sent a direction`
    And I should see the text `What happens next`
    And I should see the text `The appellant will be directed to submit their Appeal Reasons. You will be notified when it is ready to review.`
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see the text `The appellant has been directed to submit their Appeal Reasons. You will be notified when it is ready to review.`
    When I click the `Directions` tab
    And within the `Directions` collection's first item, I should see `You must now tell us why you think the Home Office decision to refuse your claim is wrong.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Appellant` in the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+28|D MMM YYYY} in the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY} in the `Date sent` field
