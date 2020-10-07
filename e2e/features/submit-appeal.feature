Feature: Submit appeal application

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal

  @regression @submit-appeal @RIA-515 @RIA-3486
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
    #And I see the open case

    When I click the `Appellant` tab
    Then I should see the appellant's details
    And I should see the legal representative's details

    When I click the `Appeal` tab
    Then I should see the appeal details
    And I should see the submission details

    When I click the `Overview` tab
    Then I should see the case details
    And I should see the legal representative details

  @ho-validation @RIA-3271
  Scenario: Home office validation tab for appeal submitted

    And I submit my appeal
    And I switch to be a `Case Officer`
    When I click the `Overview` tab
    Then I should see the text `You must review the appeal data and cross reference it with Home Office data in the Validation tab. If the appeal looks valid, you must tell the respondent to supply their evidence.`
    When I click the `Validation` tab
    Then I should see the text `Appeal validation`
    And I should see the text `Review the appeal application form data and cross reference it with Home Office data. If the appeal looks valid, you must tell the respondent to supply their evidence.`
    And I should see the text `Request respondent evidence`
    And I should see the text `The first column of information is sourced from the appeal application form, the second column of information is from Home Office records`
