Feature: Submit appeal application

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case

  @regression @submit-appeal @RIA-515 @RIA-3006
  Scenario: Submit an appeal application

    When I save my initial appeal
    And I select the `Submit your appeal` Next step
    Then I am on the `Submit your appeal` page
    And the `Continue` button is disabled

    And I should see the text `Make a payment`
    And I should see the text `The fee for this type of appeal with a hearing is`
    And I should see the text `When do you intend to pay for this appeal?`

    When I click the `Pay and submit the appeal now` label
    Then the `Continue` button is enabled

    When I click the `Submit the appeal now and pay within 14 days` label
    Then the `Continue` button is still enabled
    And I click the `Continue` button

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

  @regression @submit-appeal @submit-appeal-no-fee-DC @RIA-3006
  Scenario: Submit an appeal application with no fee DC

    When I save my initial appeal no fee with DeprivationCitizenship
    And I select the `Submit your appeal` Next step
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
    Then I should see the appeal details for DeprivationCitizenship
    And I should see the submission details

    When I click the `Overview` tab
    Then I should see the case details with DeprivationCitizenship type
    And I should see the legal representative details

  @regression @submit-appeal @submit-appeal-no-fee-RP @RIA-3006
  Scenario: Submit an appeal application with no fee RP

    When I save my initial appeal no fee with RevocationProtection
    And I select the `Submit your appeal` Next step
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
    Then I should see the appeal details for RevocationProtection
    And I should see the submission details

    When I click the `Overview` tab
    Then I should see the case details with RevocationProtection type
    And I should see the legal representative details
