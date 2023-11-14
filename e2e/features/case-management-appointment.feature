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
    Then I should see the `Direct the appellant to submit requirements for a case management appointment` link
    When I click the `Direct the appellant to submit requirements for a case management appointment` link
    Then I should see the text `Direct the appellant to submit requirements for a case management appointment`
    When I type `Reasons for CMA` for the `Reasons for appointment` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Reasons for CMA` for the `Reasons for appointment` answer
    And I should see `{$TODAY+7|D MMM YYYY}` for the `By what date must they comply?` answer
    When I click the `Send direction` button
    Then I should see the text `The appellant will be directed to submit requirements for a case management appointment. You will be notified when they are ready to review.`
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see the text `The appellant will be directed to submit requirements for a case management appointment. You will be notified when they are ready to review.`

    When I click the `Directions` tab
    Then I should see the `Directions` field
    And within the `Directions` collection's first item, I should see `You need to attend a case management appointment. This is a meeting with a Tribunal Caseworker to talk about your appeal. A Home Office representative may also be at the meeting.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Reasons for CMA` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Appellant` for the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+7|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

