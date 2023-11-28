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
    And within the `Upload Home Office bundle` collection's first item, I upload `{@Evidence1.pdf}` for the `Document` field
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
    And I should see the text `If you don't think it is ready, you should direct the appellant to answer clarifying questions or attend a case management appointment.`

    When I click the `directions tab` link
    Then I should see the `Direct the appellant to answer clarifying questions` link
    When I click the `Direct the appellant to answer clarifying questions` link
    Then I should see the text `Direct the appellant to answer clarifying questions`
    When I add an item to the `Questions` collection
    And within the `Questions` collection's first item, I type `Question 1` for the `Question` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `{$TODAY+28|D MMM YYYY}` for the `By what date must they comply?` answer
    When I click the `Submit` button
    Then I should see the text `The appellant will be directed to answer the questions. You will be notified when they are ready to review.`
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see the text `The appellant has been directed to answer clarifying questions. You will be notified when their answers are ready to review.`

    When I click the `Directions` tab
    Then I should see the `Directions` field
    And within the `Directions` collection's first item, I should see `You need to answer some questions about your appeal.` for the `Explanation` field
    And within the `Directions` collection's first item, I should see `Appellant` for the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+28|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field
    And within the `Directions` collection's first item, I should see `Question 1` in the `Question` field

    When the appellant submits clarifying answers
    And I click the `Appeal` tab
    And I refresh the page
    Then I should see the `Clarifying Questions and Answers` field
    And within the `Clarifying Questions and Answers` collection's first item, I should see `Question 1` for the `Question` field
    And within the `Clarifying Questions and Answers` collection's first item, I should see `Answer 1` for the `Answer` field


