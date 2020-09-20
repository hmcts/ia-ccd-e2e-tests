Feature: Submit appeal application failed payment (PA, EA and HU appeal types)

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case

    When I save my initial PA appeal type with hearing fee
    And I click the `Overview` tab

  @successful-payment-sanity-check @RIA-3082
  Scenario: Submit an appeal application with a successful payment (PA appeal type)

    When I click the `pay and submit your appeal` link
    Then I should see the `Pay and submit` page
    And I should see the text `The fee for an appeal with a hearing is £140`
    And I should see the text `Can’t see your Payment by Account number?`
    And I should see the `MyHMCTSsupport@justice.gov.uk` link
    And I should see the `edit your appeal` link
    And I select `PBA0087535` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button

    And I agree to the declaration
    And I click the `Continue` button

    When I click the `Pay and submit now` button
    Then I should see the text `Your appeal has been paid for and submitted`
    And I should see the text `What happens next`
    And I should see the text `You will receive an email confirming that this appeal has been submitted successfully.`
    And I should see the text `Payment successful`
    And I should see the text `Payment reference number`
    And I should see the text `RC-1590-6786-1063-9996`
    And I should see the text `Payment by Account number`
    And I should see the text `PBA0087535`
    And I should see the text `Fee`
    And I should see the text `£140`
    And I click the `Close and Return to case details` button

    When I click the `Overview` tab
    Then I should only see the `legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the text `You have submitted your appeal. A Tribunal Caseworker will now review your appeal.`

    When I click the `Appeal` tab
    Then I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field

  @account-on-hold-pa-appeal-type @failed-payment-account-on-hold @RIA-3082
  Scenario: Submit an appeal application with a successful payment (PA appeal type)

    When I click the `pay and submit your appeal` link
    Then I should see the `Pay and submit` page
    And I should see the text `The fee for an appeal with a hearing is £140`
    And I should see the text `Can’t see your Payment by Account number?`
    And I should see the `MyHMCTSsupport@justice.gov.uk` link
    And I should see the `edit your appeal` link
    And I select `PBA0087442` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button

    And I agree to the declaration
    And I click the `Continue` button

    When I click the `Pay and submit now` button
    Then I should see the image `paymentFailed.png`
    And I should see the text `Do this next`
    And I should see the text `Call 01633 652 125 (option 3) or email MiddleOffice.DDServices@liberata.com to try to resolve the payment issue.`
    And I should see the text `If you need to submit the appeal urgently, you can edit your appeal and change the payment method.`
    And I should see the `edit your appeal` link
    And I should see the text `Payment failed`
    And I should see the text `Payment reference number`
    And I should see the text `RC-1590-6786-1063-9996`
    And I should see the text `Payment by account number`
    And I should see the text `PBA0087442`
    And I should see the text `Fee`
    And I should see the text `£140`
    And I should see the text `Reason for failed payment`
    And I should see the text `Your account is on hold`
    And I click the `Close and Return to case details` button

    And I should see the `pay and submit your appeal` link

    When I click the `Appeal` tab
    Then I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field

  @account-on-deleted-pa-appeal-type @failed-payment-account-on-deleted @RIA-3082
  Scenario: Submit an appeal application with a successful payment (PA appeal type)

    When I click the `pay and submit your appeal` link
    Then I should see the `Pay and submit` page
    And I should see the text `The fee for an appeal with a hearing is £140`
    And I should see the text `Can’t see your Payment by Account number?`
    And I should see the `MyHMCTSsupport@justice.gov.uk` link
    And I should see the `edit your appeal` link
    And I select `PBA0087240` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button

    And I agree to the declaration
    And I click the `Continue` button

    When I click the `Pay and submit now` button
    Then I should see the image `paymentFailed.png`
    And I should see the text `Do this next`
    And I should see the text `Call 01633 652 125 (option 3) or email MiddleOffice.DDServices@liberata.com to try to resolve the payment issue.`
    And I should see the text `If you need to submit the appeal urgently, you can edit your appeal and change the payment method.`
    And I should see the `edit your appeal` link
    And I should see the text `Payment failed`
    And I should see the text `Payment reference number`
    And I should see the text `RC-1590-6786-1063-9996`
    And I should see the text `Payment by account number`
    And I should see the text `PBA0087240`
    And I should see the text `Fee`
    And I should see the text `£140`
    And I should see the text `Reason for failed payment`
    And I should see the text `Your account is deleted`
    And I click the `Close and Return to case details` button

    And I should see the `pay and submit your appeal` link

    When I click the `Appeal` tab
    Then I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
