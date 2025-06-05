Feature: Make a payment paylater pa after appeal submitted state (successful and failed payments)

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case

  @successful-payment-for-PA-appeal-type-with-hearing-fee @RIA-3163-PA @RIA-3163
  Scenario: Make a successful payment for PA appeal type with hearing fee after appeal submitted state (PBA0087412)

    And I save my initial PA appeal type with no remission and with hearing fee and pay later
    And I submit my nonpayment appeal

    When I select the `Make a payment` Next step
    Then I should see the `Make a payment` page
    And I should see the text `The fee for an appeal with a hearing is £140`
    And I should see the text `Can’t see your Payment by Account number?`
    And I should see the `MyHMCTSsupport@justice.gov.uk` link
    And I select `PBA0087412` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button

    When I click the `Pay now` button
    Then I should see the text `You have paid for the appeal`
    And I should see the text `What happens next`
    And I should see the text `You will receive a notification to confirm the payment has been made.`
    And I should see the text `Payment successful`
    And I should see the text `Payment reference number`
    And I should see the text `Payment by Account number`
    And I should see the text `PBA0087412`
    And I should see the text `Fee`
    And I should see the text `£140`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Make a payment`

    And I click the `Appeal` tab
    And I should see the `Appeal details` page
    Then I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` for the `Grounds of appeal` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I click the `Overview` tab
    Then I should only see the `progress_legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the overview for a paid appeal

    When I switch to be a `Case Officer`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I switch to be a `Admin Officer`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I switch to be a `Judge`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I switch to be a `Home Office APC`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I switch to be a `Home Office LART`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I switch to be a `Home Office POU`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I switch to be a `Home Office Generic`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

  @successful-payment-for-PA-appeal-type-without-hearing-fee @RIA-3163-PA @RIA-3163
  Scenario: Make a successful payment for PA appeal type without hearing fee after appeal submitted state (PBA0087412)

    And I save my initial PA appeal type with no remission and without hearing fee and pay later
    And I submit my nonpayment appeal

    When I select the `Make a payment` Next step
    Then I should see the `Make a payment` page
    And I should see the text `The fee for an appeal without a hearing is £80`
    And I should see the text `Can’t see your Payment by Account number?`
    And I should see the `MyHMCTSsupport@justice.gov.uk` link
    And I select `PBA0087412` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button

    When I click the `Pay now` button
    Then I should see the text `You have paid for the appeal`
    And I should see the text `What happens next`
    And I should see the text `You will receive a notification to confirm the payment has been made.`
    And I should see the text `Payment successful`
    And I should see the text `Payment reference number`
    And I should see the text `Payment by Account number`
    And I should see the text `PBA0087412`
    And I should see the text `Fee`
    And I should see the text `£80`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Make a payment`

    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` for the `Grounds of appeal` field
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I click the `Overview` tab
    Then I should only see the `progress_legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the overview for a paid appeal

    When I switch to be a `Case Officer`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I switch to be a `Admin Officer`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I switch to be a `Judge`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I switch to be a `Home Office APC`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I switch to be a `Home Office LART`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I switch to be a `Home Office POU`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I switch to be a `Home Office Generic`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field


  @failed-payment-account-deleted-for-PA-appeal-type-with-hearing-fee @RIA-3163-PA @RIA-3163
  Scenario: Failed payment for PA appeal type with hearing fee after appeal submitted state - account deleted (PBA0087412)

    And I save my initial PA appeal type with no remission and with hearing fee and pay later
    And I submit my nonpayment appeal

    When I select the `Make a payment` Next step
    Then I should see the `Make a payment` page
    And I should see the text `The fee for an appeal with a hearing is £140`
    And I should see the text `Can’t see your Payment by Account number?`
    And I should see the `MyHMCTSsupport@justice.gov.uk` link
    And I select `PBA0087412` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button

    When I click the `Pay now` button
    Then I should see the image `paymentFailed.png`
    And I should see the text `Do this next`
    And I should see the text `Call 01633 652 125 (option 3) or email MiddleOffice.DDServices@liberata.com to try to resolve the payment issue.`
    And I should see the text `Payment failed`
    And I should see the text `Payment reference number`
    And I should see the text `RC-1590-6786-1063-9996`
    And I should see the text `Payment by account number`
    And I should see the text `PBA0087412`
    And I should see the text `Fee`
    And I should see the text `£140`
    And I should see the text `Reason for failed payment`
    And I should see the text `Your account is deleted`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Make a payment`

    And I click the `Appeal` tab
    And I should see the `Appeal details` page
    Then I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` for the `Grounds of appeal` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I click the `Overview` tab
    Then I should only see the `progress_legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the overview for a paid appeal

    When I switch to be a `Case Officer`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I switch to be a `Admin Officer`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I switch to be a `Judge`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I switch to be a `Home Office APC`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I switch to be a `Home Office LART`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I switch to be a `Home Office POU`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I switch to be a `Home Office Generic`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

  @failed-payment-account-on-hold-for-PA-appeal-type-with-hearing-fee @RIA-3163-PA @RIA-3163
  Scenario: Failed payment for PA appeal type with hearing fee after appeal submitted state - account on hold (PBA0087442)

    And I save my initial PA appeal type with no remission and with hearing fee and pay later
    And I submit my nonpayment appeal

    When I select the `Make a payment` Next step
    Then I should see the `Make a payment` page
    And I should see the text `The fee for an appeal with a hearing is £140`
    And I should see the text `Can’t see your Payment by Account number?`
    And I should see the `MyHMCTSsupport@justice.gov.uk` link
    And I select `PBA0087442` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button

    When I click the `Pay now` button
    Then I should see the image `paymentFailed.png`
    And I should see the text `Do this next`
    And I should see the text `Call 01633 652 125 (option 3) or email MiddleOffice.DDServices@liberata.com to try to resolve the payment issue.`
    And I should see the text `Payment failed`
    And I should see the text `Payment reference number`
    And I should see the text `RC-1590-6786-1063-9996`
    And I should see the text `Payment by account number`
    And I should see the text `PBA0087442`
    And I should see the text `Fee`
    And I should see the text `£140`
    And I should see the text `Reason for failed payment`
    And I should see the text `Your account is on hold`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Make a payment`

    And I click the `Appeal` tab
    And I should see the `Appeal details` page
    Then I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` for the `Grounds of appeal` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I click the `Overview` tab
    Then I should only see the `progress_legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the overview for a paid appeal

    When I switch to be a `Case Officer`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I switch to be a `Admin Officer`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I switch to be a `Judge`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I switch to be a `Home Office APC`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I switch to be a `Home Office LART`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I switch to be a `Home Office POU`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

    When I switch to be a `Home Office Generic`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Payment method` field

  @pay-later-avoid-pay-twice @RIA-3409
  Scenario: Make a successful payment for PA appeal type with hearing fee after appeal submitted state (PBA0087412)

    And I save my initial PA appeal type with no remission and with hearing fee and pay later
    And I submit my nonpayment appeal

    When I select the `Make a payment` Next step
    Then I should see the `Make a payment` page
    And I should see the text `The fee for an appeal with a hearing is £140`
    And I should see the text `Can’t see your Payment by Account number?`
    And I should see the `MyHMCTSsupport@justice.gov.uk` link
    And I select `PBA0087412` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button

    When I click the `Pay now` button
    Then I should see the text `You have paid for the appeal`
    And I should see the text `What happens next`
    And I should see the text `You will receive a notification to confirm the payment has been made.`
    And I should see the text `Payment successful`
    And I should see the text `Payment reference number`
    And I should see the text `Payment by Account number`
    And I should see the text `PBA0087412`
    And I should see the text `Fee`
    And I should see the text `£140`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    When I select the `Make a payment` Next step
    Then I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `You have already paid for this appeal.`
