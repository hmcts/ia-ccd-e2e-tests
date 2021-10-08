Feature: Submit appeal application

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    Then I wait for 20 seconds
    And I create a new case
    And I save my initial PA appeal type without remission and with hearing fee and pay now
    And I wait for 5 seconds

  @xbrowsertest
  Scenario: Submit an appeal application

    When I click the `pay for and submit your appeal` link
    And I select `PBA0088063` for the `Select a Payment by Account number from the list` field
    And I wait for 5 seconds
    And I click the `Continue` button
    And I agree to the declaration
    And I click the `Continue` button
    When I click the `Pay and submit now` button
    Then I should see the text `Your appeal has been paid for and submitted`

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
