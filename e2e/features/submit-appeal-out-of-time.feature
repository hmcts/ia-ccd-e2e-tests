Feature: Submit appeal application

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal with out of time decision letter

  @regression @submit-appeal-with-document-and-reason @RIA-369
  Scenario: Submit an out of time appeal application

    When I select the `Submit your appeal` Next step
    Then I am on the `Submit your appeal` page
    And I should see the text `You've missed the deadline for appealing.`
    And I should see the text `You can ask for permission to appeal outside of the deadline.`
    And I should see the text `Explain why you believe your late appeal should be allowed to proceed.`
    And I type `I was on holiday` for the `You can upload a document or fill out the box below. (Optional)` field
    And I upload `{@SupportForLateSubmission.pdf}` for the document field without a label
    And I click the `Continue` button
    And I agree to the declaration
    And I click the `Continue` button
    And I click the `Submit` button
    And I should see the image `outOfTimeConfirmation.png`
    And I should see the text `You have submitted this appeal beyond the deadline. The Tribunal Case Officer will decide if it can proceed. You'll get an email telling you whether your appeal can go ahead`
    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Submit your appeal`

    When I click the `Appeal` tab
    And I should see `Yes` for the `Was the appeal submission late?` field
    And I should see `I was on holiday` for the `Reasons for late appeal submission` field
    And I should see `SupportForLateSubmission.pdf` for the `Late submission supporting document` field

  @regression @submit-appeal-with-document-but-no-reason @RIA-369
  Scenario: Submit an out of time appeal application

    When I select the `Submit your appeal` Next step
    Then I am on the `Submit your appeal` page
    And I should see the text `You've missed the deadline for appealing.`
    And I should see the text `You can ask for permission to appeal outside of the deadline.`
    And I should see the text `Explain why you believe your late appeal should be allowed to proceed.`
    And I upload `{@SupportForLateSubmission.pdf}` for the document field without a label
    And I click the `Continue` button
    And I agree to the declaration
    And I click the `Continue` button
    And I click the `Submit` button
    And I should see the image `outOfTimeConfirmation.png`
    And I should see the text `You have submitted this appeal beyond the deadline. The Tribunal Case Officer will decide if it can proceed. You'll get an email telling you whether your appeal can go ahead`
    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Submit your appeal`

    When I click the `Appeal` tab
    And I should see `Yes` for the `Was the appeal submission late?` field
    And I should see `SupportForLateSubmission.pdf` for the `Late submission supporting document` field

  @regression @submit-appeal-with-reason-but-no-document @RIA-369
  Scenario: Submit an out of time appeal application

    When I select the `Submit your appeal` Next step
    Then I am on the `Submit your appeal` page
    And I should see the text `You've missed the deadline for appealing.`
    And I should see the text `You can ask for permission to appeal outside of the deadline.`
    And I should see the text `Explain why you believe your late appeal should be allowed to proceed.`
    And I type `I was on holiday` for the `You can upload a document or fill out the box below. (Optional)` field
    And I click the `Continue` button
    And I agree to the declaration
    And I click the `Continue` button
    And I click the `Submit` button
    And I should see the image `outOfTimeConfirmation.png`
    And I should see the text `You have submitted this appeal beyond the deadline. The Tribunal Case Officer will decide if it can proceed. You'll get an email telling you whether your appeal can go ahead`
    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Submit your appeal`

    When I click the `Appeal` tab
    And I should see `Yes` for the `Was the appeal submission late?` field
    And I should see `I was on holiday` for the `Reasons for late appeal submission` field

  @regression @submit-appeal-with-no-reason-and-no-document @RIA-986
  Scenario: Submit an out of time appeal application

    When I select the `Submit your appeal` Next step
    Then I am on the `Submit your appeal` page
    And I should see the text `You've missed the deadline for appealing.`
    And I should see the text `You can ask for permission to appeal outside of the deadline.`
    And I should see the text `Explain why you believe your late appeal should be allowed to proceed.`
    And I type `I was on holiday` for the `You can upload a document or fill out the box below. (Optional)` field
    And I click the `Continue` button
    And I agree to the declaration
    And I click the `Continue` button
    And I click the `Submit` button
    And I should see the image `outOfTimeConfirmation.png`
    And I should see the text `You have submitted this appeal beyond the deadline. The Tribunal Case Officer will decide if it can proceed. You'll get an email telling you whether your appeal can go ahead`

    When I switch to be a `Case Officer`
    And I click the `Overview` tab

    Then I should see the `caseOfficer_outOfTimeBox` image
    And I should see the `caseOfficer_appealSubmitted` image

    When I click the `Appeal` tab
    Then I should see `Yes` for the `Was the appeal submission late?` field
