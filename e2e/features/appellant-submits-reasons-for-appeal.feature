Feature: Submit reasons for appeal

  @aip-case-progression
  Scenario: A Case officer can view and request the respondent views the reasons for appeal
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
    And I switch to be a `Case Officer`
    And I click the `direct the appellant to submit their Appeal Reasons` link
    And I am on the `Request Appeal Reasons` page
    And I click the `Continue` button
    And I am on the `Check your answers` page
    And I click the `Submit` button
    And I should see the text `You have sent a direction`
    And the appellant submits their reasons for appeal

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should only see the `caseOfficer_caseUnderReview` case progress image

    When I click the `the documents tab` link
    Then I should see the appellants reasons for appeal

    When I click the `Overview` tab
    And I click the `direct the respondent to review it` link
    Then I am on the `Request respondent review` page
    And I should see `You must now review this case.` in the `Explain the direction you are issuing` field
    And I should see `You have 14 days to review` in the `Explain the direction you are issuing` field
    And I should see `You must explain whether the appellant's appeal argument makes a valid case` in the `Explain the direction you are issuing` field
    And I should see `Respondent` for the `Who are you giving the direction to?` field
    And I should see `{$TODAY+14}` for the `By what date must they comply?` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `You must now review this case.` in the `Explain the direction you are issuing` field
    And I should see `You have 14 days to review` in the `Explain the direction you are issuing` field
    And I should see `You must explain whether the appellant's appeal argument makes a valid case` in the `Explain the direction you are issuing` field
    And I should see `Respondent` for the `Who are you giving the direction to?` field
    And I should see `{$TODAY+14|D MMM YYYY}` for the `By what date must they comply?` field

    When I click the `Send direction` button
    Then I should see the text `You have sent a direction`
    Then I should see the text `What happens next`
    Then I should see the text `Wait for the respondent to complete the direction`



