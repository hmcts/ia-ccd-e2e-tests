Feature: Pay for appeal (Make a payment) after failed PBA payment (EA appeal type)

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case

    And I save my initial EA appeal type without remission and with hearing fee and pay now
    And I click the `Overview` tab

  @RIA-4468-pay-for-appeal @RIA-4468-pay-for-appeal-ea @RIA-4468-pay-for-appeal-ea-successful @RIA-4468 @RIA-4679
  Scenario: Pay for appeal (Make a payment) successful after initial failed PBA payment (EA appeal type)

    When I click the `pay for and submit your appeal` link
    Then I should see the `Select PBA number` page
    And I should see the text `The fee for an appeal with a hearing is £140`
    And I should see the text `Can’t see your Payment by Account number?`
    And I should see the `MyHMCTSsupport@justice.gov.uk` link
    And I should see the `edit your appeal` link
    And I select `PBA0087412` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button

    And I agree to the declaration
    And I click the `Continue` button

    When I click the `Pay and submit now` button
    Then I should see the image `paymentFailed.png`
    And I should see the text `Do this next`
    And I should see the text `Call 01633 652 125 (option 3) or email MiddleOffice.DDServices@liberata.com to try to resolve the payment issue.`
    And I should see the text `If this is successful, follow the instructions on the overview tab to pay for the appeal using Payment by Account.`
    And I should see the text `If you want to pay by card, you can change the payment method to card. The Tribunal will then contact you with payment instructions.`
    And I should see the `change the payment method` link
    And I should see the text `Payment failed`
    And I should see the text `Payment reference number`
    And I should see the text `RC-1590-6786-1063-9996`
    And I should see the text `Payment by Account number`
    And I should see the text `PBA0087412`
    And I should see the text `Fee`
    And I should see the text `£140`
    And I should see the text `Reason for failed payment`
    And I should see the text `Your account is deleted`
    And I wait for 30 seconds
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    When I click the `Overview` tab
    Then I should only see the `progress_legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the text `Your appeal has been submitted but the payment has failed. There are two ways you can pay for the appeal.`
    And I should see the text `You must pay the fee within 14 days of submitting the appeal or the Tribunal may end the appeal.`
    And I should see the `make a payment using Payment by Account` link
    And I should see the `change the payment method to card` link
    And I should not see the text `You have submitted your appeal. A Tribunal Caseworker will now review your appeal.`

    When I click the `Appeal` tab
    Then I should see `Refusal of application under the EEA regulations` for the `Type of appeal` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay using Payment by Account` for the `Payment method` field

    When I click the `Overview` tab
    And I click the `make a payment using Payment by Account` link
    Then I am on the `Make a payment` page
    And I should see the text `The fee for an appeal with a hearing is £140`
    And I should see the text `Can’t see your Payment by Account number?`
    And I should see the `MyHMCTSsupport@justice.gov.uk` link
    And I select `PBA0087412` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button

    When I click the `Pay now` button
    Then I should see the text `Your appeal has been paid for and submitted`
    And I should see the text `What happens next`
    And I should see the text `You will receive an email confirming that this appeal has been submitted successfully.`
    And I should see the text `Payment successful`
    And I should see the text `Payment reference number`
    And I should see the text `RC-1590-6786-1063-9996`
    And I should see the text `Payment by Account number`
    And I should see the text `PBA0087412`
    And I should see the text `Fee`
    And I should see the text `£140`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    When I click the `Overview` tab
    Then I should only see the `progress_legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the overview for a paid appeal

    When I click the `Appeal` tab
    Then I should see `Refusal of application under the EEA regulations` for the `Type of appeal` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay using Payment by Account` for the `Payment method` field

  @RIA-4468-pay-for-appeal @RIA-4468-pay-for-appeal-ea @RIA-4468-pay-for-appeal-ea-failed @RIA-4468 @RIA-4679
  Scenario: Pay for appeal (Make a payment) fails after initial failed PBA payment (EA appeal type)

    When I click the `pay for and submit your appeal` link
    Then I should see the `Select PBA number` page
    And I should see the text `The fee for an appeal with a hearing is £140`
    And I should see the text `Can’t see your Payment by Account number?`
    And I should see the `MyHMCTSsupport@justice.gov.uk` link
    And I should see the `edit your appeal` link
    And I select `PBA0087412` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button

    And I agree to the declaration
    And I click the `Continue` button

    When I click the `Pay and submit now` button
    Then I should see the image `paymentFailed.png`
    And I should see the text `Do this next`
    And I should see the text `Call 01633 652 125 (option 3) or email MiddleOffice.DDServices@liberata.com to try to resolve the payment issue.`
    And I should see the text `If this is successful, follow the instructions on the overview tab to pay for the appeal using Payment by Account.`
    And I should see the text `If you want to pay by card, you can change the payment method to card. The Tribunal will then contact you with payment instructions.`
    And I should see the `change the payment method` link
    And I should see the text `Payment failed`
    And I should see the text `Payment reference number`
    And I should see the text `RC-1590-6786-1063-9996`
    And I should see the text `Payment by Account number`
    And I should see the text `PBA0087412`
    And I should see the text `Fee`
    And I should see the text `£140`
    And I should see the text `Reason for failed payment`
    And I should see the text `Your account is deleted`
    And I wait for 30 seconds
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    When I click the `Overview` tab
    Then I should only see the `progress_legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the text `Your appeal has been submitted but the payment has failed. There are two ways you can pay for the appeal.`
    And I should see the text `You must pay the fee within 14 days of submitting the appeal or the Tribunal may end the appeal.`
    And I should see the `make a payment using Payment by Account` link
    And I should see the `change the payment method to card` link
    And I should not see the text `You have submitted your appeal. A Tribunal Caseworker will now review your appeal.`

    When I click the `Appeal` tab
    Then I should see `Refusal of application under the EEA regulations` for the `Type of appeal` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay using Payment by Account` for the `Payment method` field

    When I click the `Overview` tab
    And I click the `make a payment using Payment by Account` link
    Then I am on the `Make a payment` page
    And I should see the text `The fee for an appeal with a hearing is £140`
    And I should see the text `Can’t see your Payment by Account number?`
    And I should see the `MyHMCTSsupport@justice.gov.uk` link
    And I select `PBA0087412` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button

    When I click the `Pay now` button
    Then I should see the image `paymentFailed.png`
    And I should see the text `Do this next`
    And I should see the text `Call 01633 652 125 (option 3) or email MiddleOffice.DDServices@liberata.com to try to resolve the payment issue.`
    And I should see the text `If this is successful, follow the instructions on the overview tab to pay for the appeal using Payment by Account.`
    And I should see the text `If you want to pay by card, you can change the payment method to card. The Tribunal will then contact you with payment instructions.`
    And I should see the `change the payment method` link
    And I should see the text `Payment failed`
    And I should see the text `Payment reference number`
    And I should see the text `RC-1590-6786-1063-9996`
    And I should see the text `Payment by Account number`
    And I should see the text `PBA0087412`
    And I should see the text `Fee`
    And I should see the text `£140`
    And I should see the text `Reason for failed payment`
    And I should see the text `Your account is deleted`
    And I wait for 30 seconds
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    When I click the `Overview` tab
    Then I should only see the `progress_legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the text `Your appeal has been submitted but the payment has failed. There are two ways you can pay for the appeal.`
    And I should see the text `You must pay the fee within 14 days of submitting the appeal or the Tribunal may end the appeal.`
    And I should see the `make a payment using Payment by Account` link
    And I should see the `change the payment method to card` link
    And I should not see the text `You have submitted your appeal. A Tribunal Caseworker will now review your appeal.`

    When I click the `Appeal` tab
    Then I should see `Refusal of application under the EEA regulations` for the `Type of appeal` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay using Payment by Account` for the `Payment method` field
