Feature: Submit appeal application

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal

  @submit-appeal @RIA-515
  Scenario: Submit an appeal application

    When I select the `Submit your appeal` Next step
    Then I am on the `Submit your appeal` page
    And the `Continue` button is disabled

    And I should not see the text `You've missed the deadline for appealing.`
    And I should not see the text `You can ask for permission to appeal outside of the deadline.`
    And I should not see the text `Explain why you believe your late appeal should be allowed to proceed.`
    And I should not see the `You can upload a document or fill out the box below. (Optional)` field

    When I agree to the declaration
    And I click the `Continue` button
    And I click the `Submit` button
    Then I should see the text `Your appeal has been submitted`
    And I should see the text `What happens next`
    And I should see the text `You will receive an email confirming that this appeal has been submitted successfully.`

    And I should not see the image `outOfTimeConfirmation.png`
    And I should not see the text `You have submitted this appeal beyond the deadline.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Submit your appeal`
    And I see the open case

    When I click the `Case details` tab
    Then the `Reference number` field should be 13 characters long
    And I should see `Taylor House` for the `Hearing centre` field
