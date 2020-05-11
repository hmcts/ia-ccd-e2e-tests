Feature: Review time extension

  @aip-case-progression
  Scenario: A Case officer can review an appellants time extension
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
    And the appellant submits a time extension

    When I click the `Close and Return to case details` button
    Then I should see the text `The appellant has requested a time extension.`

    When I click the `Applications` tab
    Then I should see the `Review a time extension application` link

    When I click the `Review a time extension application` link
    Then I can review the appellants time extension

    When I refuse the time extension
    Then I am on the `Check your answers` page
    And I should see `Application refused` in the `Decision` field
    And I should see `decision reason` in the `Reason for decision` field

    When I click the `Submit` button
    Then I should see the text `has been updated with event: Review time extension`
    And I should see `31 Dec 2018` for the `By what date must they comply?` answer


