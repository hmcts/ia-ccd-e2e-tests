Feature: Submit Appeal out of time payment for EA and HU and PA

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case

  @successful-payment-for-EA-appeal-type-pay-now-with-hearing-fee-out-of-time @RIA-3471-EA-PAY-NOW @RIA-3471 @RIA-3014
  Scenario: Make a successful payment for EA appeal type pay now with hearing fee and out of time

    And I save my initial EA appeal type with no remission and pay now with hearing fee and out of time

    When I select the `Pay and submit` Next step
    Then I should see the `Pay and submit` page
    And I should see the text `The fee for an appeal with a hearing is £140`
    And I should see the text `Can’t see your Payment by Account number?`
    And I should see the `MyHMCTSsupport@justice.gov.uk` link
    And I select `PBA0087535` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button
    And I should see the text `You've missed the deadline for appealing.`
    And I should see the text `You can ask for permission to appeal outside of the deadline.`
    And I should see the text `Explain why you believe your late appeal should be allowed to proceed.`
    And I type `I was on holiday` for the `You can upload a document or fill out the box below. (Optional)` field
    And I upload `{@SupportForLateSubmission.pdf}` for the document field without a label
    And I click the `Continue` button
    And I agree to the declaration
    And I click the `Continue` button

    When I click the `Pay and submit now` button
    And I should see the image `outOfTimePaidConfirmation.png`
    And I should see the text `What happens next`
    And I should see the text `A Tribunal Caseworker will review the reasons your appeal was out of time and you will be notified if it can proceed.`
    And I should see the text `Payment successful`
    And I should see the text `Payment reference number`
    And I should see the text `Payment by Account number`
    And I should see the text `PBA0087535`
    And I should see the text `Fee`
    And I should see the text `£140`
    And I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Pay and submit`

  @successful-payment-for-HU-appeal-type-pay-now-with-hearing-fee-out-of-time @RIA-3471-HU-PAY-NOW @RIA-3471
  Scenario: Make a successful payment for HU appeal type pay now with hearing fee and out of time

    And I save my initial HU appeal type with no remission and pay now with hearing fee and out of time

    When I select the `Pay and submit` Next step
    Then I should see the `Pay and submit` page
    And I should see the text `The fee for an appeal with a hearing is £140`
    And I should see the text `Can’t see your Payment by Account number?`
    And I should see the `MyHMCTSsupport@justice.gov.uk` link
    And I select `PBA0087535` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button
    And I should see the text `You've missed the deadline for appealing.`
    And I should see the text `You can ask for permission to appeal outside of the deadline.`
    And I should see the text `Explain why you believe your late appeal should be allowed to proceed.`
    And I type `I was on holiday` for the `You can upload a document or fill out the box below. (Optional)` field
    And I upload `{@SupportForLateSubmission.pdf}` for the document field without a label
    And I click the `Continue` button
    And I agree to the declaration
    And I click the `Continue` button

    When I click the `Pay and submit now` button
    And I should see the image `outOfTimePaidConfirmation.png`
    And I should see the text `What happens next`
    And I should see the text `A Tribunal Caseworker will review the reasons your appeal was out of time and you will be notified if it can proceed.`
    And I should see the text `Payment successful`
    And I should see the text `Payment reference number`
    And I should see the text `Payment by Account number`
    And I should see the text `PBA0087535`
    And I should see the text `Fee`
    And I should see the text `£140`
    And I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Pay and submit`

  @successful-payment-for-PA-appeal-type-pay-now-with-hearing-fee-out-of-time @RIA-3471-PA-PAY-NOW @RIA-3471 @RIA-3014
  Scenario: Make a successful payment for PA appeal type pay now with hearing fee and out of time

    And I save my initial PA appeal type with no remission and pay now with hearing fee and out of time

    When I select the `Pay and submit` Next step
    Then I should see the `Pay and submit` page
    And I should see the text `The fee for an appeal with a hearing is £140`
    And I should see the text `Can’t see your Payment by Account number?`
    And I should see the `MyHMCTSsupport@justice.gov.uk` link
    And I select `PBA0087535` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button
    And I should see the text `You've missed the deadline for appealing.`
    And I should see the text `You can ask for permission to appeal outside of the deadline.`
    And I should see the text `Explain why you believe your late appeal should be allowed to proceed.`
    And I type `I was on holiday` for the `You can upload a document or fill out the box below. (Optional)` field
    And I upload `{@SupportForLateSubmission.pdf}` for the document field without a label
    And I click the `Continue` button
    And I agree to the declaration
    And I click the `Continue` button

    When I click the `Pay and submit now` button
    And I should see the image `outOfTimePaidConfirmation.png`
    And I should see the text `What happens next`
    And I should see the text `A Tribunal Caseworker will review the reasons your appeal was out of time and you will be notified if it can proceed.`
    And I should see the text `Payment successful`
    And I should see the text `Payment reference number`
    And I should see the text `Payment by Account number`
    And I should see the text `PBA0087535`
    And I should see the text `Fee`
    And I should see the text `£140`
    And I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Pay and submit`

  @submit-appeal-with-paylater-payment-for-PA-appeal-type-with-hearing-fee-out-of-time @RIA-3471-PA-PAY-LATER @RIA-3471 @RIA-3014
  Scenario: Make a successful payment for PA appeal type with hearing fee and out of time

    And I save my initial PA appeal type with no remission and pay later with hearing fee and out of time
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
    And I should see the image `outOfTimeConfirmation.svg`
    And I should see the text `What happens next`
    And I should see the text `You still have to pay for this appeal. You can do this by selecting Make a payment from the dropdown on the`
    And I should see the text `Once you have paid for the appeal, a Tribunal Caseworker will review the reasons your appeal was out of time and you will be notified if it can proceed.`
    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Submit your appeal`

    When I click the `Appeal` tab
    And I should see `Yes` for the `Was the appeal submission late?` field
    And I should see `I was on holiday` for the `Reasons for late appeal submission` field
    And I should see `SupportForLateSubmission.pdf` for the `Late submission supporting document` field

  @submit-appeal-with-offline-payment-for-EA-appeal-type-with-hearing-fee-out-of-time @RIA-3471-EA-OFFLINE @RIA-3471 @RIA-3014
  Scenario: Make a successful payment for EA appeal type with hearing fee and out of time

    And I save my initial EA appeal type with no remission and pay offline with hearing fee and out of time
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
    And I should see the image `outOfTimeConfirmation.svg`
    And I should see the text `You still have to pay for this appeal. You will soon receive a notification with instructions on how to pay by card online. You need to pay within 14 days of receiving the notification or the Tribunal will end the appeal.`
    And I should see the text `Once you have paid for the appeal, a Tribunal Caseworker will review the reasons your appeal was out of time and you will be notified if it can proceed.`
    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Submit your appeal`

    When I click the `Appeal` tab
    And I should see `Yes` for the `Was the appeal submission late?` field
    And I should see `I was on holiday` for the `Reasons for late appeal submission` field
    And I should see `SupportForLateSubmission.pdf` for the `Late submission supporting document` field

  @submit-appeal-with-offline-payment-for-HU-appeal-type-with-hearing-fee-out-of-time @RIA-3471-HU-OFFLINE @RIA-3471 @RIA-3014
  Scenario: Make a successful payment for HU appeal type with hearing fee and out of time

    And I save my initial HU appeal type with no remission and pay offline with hearing fee and out of time
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
    And I should see the image `outOfTimeConfirmation.svg`
    And I should see the text `You still have to pay for this appeal. You will soon receive a notification with instructions on how to pay by card online. You need to pay within 14 days of receiving the notification or the Tribunal will end the appeal.`
    And I should see the text `Once you have paid for the appeal, a Tribunal Caseworker will review the reasons your appeal was out of time and you will be notified if it can proceed.`
    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Submit your appeal`

    When I click the `Appeal` tab
    And I should see `Yes` for the `Was the appeal submission late?` field
    And I should see `I was on holiday` for the `Reasons for late appeal submission` field
    And I should see `SupportForLateSubmission.pdf` for the `Late submission supporting document` field

  @submit-appeal-with-offline-payment-for-PA-appeal-type-with-hearing-fee-out-of-time @RIA-3471-PA-OFFLINE @RIA-3471 @RIA-3014
  Scenario: Make a successful payment for PA appeal type with hearing fee and out of time

    And I save my initial PA appeal type with no remission and pay offline with hearing fee and out of time
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
    And I should see the image `outOfTimeConfirmation.svg`
    And I should see the text `What happens next`
    And I should see the text `You still have to pay for this appeal. You will soon receive a notification with instructions on how to pay by card online.`
    And I should see the text `Once you have paid for the appeal, a Tribunal Caseworker will review the reasons your appeal was out of time and you will be notified if it can proceed.`
    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Submit your appeal`

    When I click the `Appeal` tab
    And I should see `Yes` for the `Was the appeal submission late?` field
    And I should see `I was on holiday` for the `Reasons for late appeal submission` field
    And I should see `SupportForLateSubmission.pdf` for the `Late submission supporting document` field
