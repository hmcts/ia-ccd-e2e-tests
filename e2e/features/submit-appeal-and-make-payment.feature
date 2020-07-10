Feature: Leadership judge record the appellant decision and reasons

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case

  @successful-payment-for-EA-appeal-type-with-hearing-fee @RIA-3163-EA @RIA-3163
  Scenario: Make a successful payment for EA appeal type with hearing fee

    And I save my initial EA appeal type with hearing fee
    And I submit my appeal
    And I click the `Close and Return to case details` button

    Then I click the `Overview` tab
    And I should see the `Overview` page
    Then I should only see the `legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the text `You still have a fee to pay. If you do not make a payment by {$TODAY+14|D MMM YYYY}, the Tribunal will take no further action on your appeal.`

    When I switch to be a `Case Officer`
    And I should see the `Overview` page
    Then I should only see the `caseOfficer_appealSubmitted` case progress image
    And I should see the text `What happens next`
    And I should see the text `This appeal is awaiting payment. You will be notified when the payment is made. You don't need to do anything until then.`

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab
    And I select the `Make a payment` Next step
    Then I should see the `Make a payment` page
    And I should see the text `The fee for this type of appeal with a hearing is £140.00`
    And I type `PBA0066906` for the `Enter your Payment by Account reference number` field
    And I should see the text `Don't have Payment by Account?`
    And I should see the `Apply to use Payment by Account` link
    And I click the `Continue` button

    When I click the `Pay now` button
    Then I should see the text `You have paid for the appeal`
    And I should see the text `Payment successful`
    And I should see the text `Payment reference number`
    And I should see the text `Payment by account number`
    And I should see the text `PBA0066906`
    And I should see the text `Fee`
    And I should see the text `£140.00`
    And I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Make a payment`

    And I click the `Appeal` tab
    And I should see the `Appeal` page
    Then I should see `Refusal of application under the EEA regulations` for the `Type of appeal` field
    And I should see `The decision breaches the appellant's rights under the EEA regulations` for the `Grounds of appeal` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Payment date` field
    And I should see `Paid` for the `Payment status` field

  @successful-payment-for-EA-appeal-type-without-hearing @RIA-3163-EA @RIA-3163
  Scenario: Make a successful payment for EA appeal type without hearing fee

    And I save my initial EA appeal type without hearing fee
    And I submit my appeal
    And I click the `Close and Return to case details` button

    Then I click the `Overview` tab
    And I should see the `Overview` page
    Then I should only see the `legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the text `You still have a fee to pay. If you do not make a payment by {$TODAY+14|D MMM YYYY}, the Tribunal will take no further action on your appeal.`

    When I switch to be a `Case Officer`
    And I should see the `Overview` page
    Then I should only see the `caseOfficer_appealSubmitted` case progress image
    And I should see the text `What happens next`
    And I should see the text `This appeal is awaiting payment. You will be notified when the payment is made. You don't need to do anything until then.`

    When I switch to be a `Legal Rep`
    And I select the `Make a payment` Next step
    Then I should see the `Make a payment` page
    And I should see the text `The fee for this type of appeal without a hearing is £80.00`
    And I type `PBA0066906` for the `Enter your Payment by Account reference number` field
    And I should see the text `Don't have Payment by Account?`
    And I should see the `Apply to use Payment by Account` link
    And I click the `Continue` button

    When I click the `Pay now` button
    Then I should see the text `You have paid for the appeal`
    And I should see the text `Payment successful`
    And I should see the text `Payment reference number`
    And I should see the text `Payment by account number`
    And I should see the text `PBA0066906`
    And I should see the text `Fee`
    And I should see the text `£80.00`
    And I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Make a payment`

    And I click the `Appeal` tab
    And I should see the `Appeal` page
    Then I should see `Refusal of application under the EEA regulations` for the `Type of appeal` field
    And I should see `The decision breaches the appellant's rights under the EEA regulations` for the `Grounds of appeal` field
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How do you want the appeal to be decided?` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Payment date` field
    And I should see `Paid` for the `Payment status` field

  @failed-payment-for-EA-appeal-type-with-hearing @RIA-3163-EA @RIA-3163
  Scenario: Make a failed payment for EA appeal type with hearing fee

    And I save my initial EA appeal type with hearing fee
    And I submit my appeal
    And I click the `Close and Return to case details` button

    Then I click the `Overview` tab
    And I should see the `Overview` page
    Then I should only see the `legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the text `You still have a fee to pay. If you do not make a payment by {$TODAY+14|D MMM YYYY}, the Tribunal will take no further action on your appeal.`

    When I switch to be a `Case Officer`
    And I should see the `Overview` page
    Then I should only see the `caseOfficer_appealSubmitted` case progress image
    And I should see the text `What happens next`
    And I should see the text `This appeal is awaiting payment. You will be notified when the payment is made. You don't need to do anything until then.`

    When I switch to be a `Legal Rep`
    And I select the `Make a payment` Next step
    Then I should see the `Make a payment` page
    And I should see the text `The fee for this type of appeal with a hearing is £140.00`
    And I type `PBA0079489` for the `Enter your Payment by Account reference number` field
    And I should see the text `Don't have Payment by Account?`
    And I should see the `Apply to use Payment by Account` link
    And I click the `Continue` button

    When I click the `Pay now` button
    And I should see the text `You still need to pay for your appeal.`
    And I should see the `pay for your appeal` link
    And I should see the text `Payment failed`
    And I should see the text `Payment reference number`
    And I should see the text `Payment by account number`
    And I should see the text `PBA0079489`
    And I should see the text `Fee`
    And I should see the text `£140.00`
    And I should see the text `Reason for failed payment`
    And I should see the text `Your account is deleted`
    And I click the `Close and Return to case details` button

    Then I click the `Overview` tab
    And I should see the `Overview` page
    Then I should only see the `legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the text `You still have a fee to pay. If you do not make a payment by {$TODAY+14|D MMM YYYY}, the Tribunal will take no further action on your appeal.`

    And I click the `Appeal` tab
    And I should see the `Appeal` page
    Then I should see `Refusal of application under the EEA regulations` for the `Type of appeal` field
    And I should see `The decision breaches the appellant's rights under the EEA regulations` for the `Grounds of appeal` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Payment date` field
    And I should see `Pending` for the `Payment status` field

  @successful-payment-for-HU-appeal-type-with-hearing @RIA-3163-HU @RIA-3163
  Scenario: Make a successful payment for HU appeal type with hearing fee

    And I save my initial HU appeal type with hearing fee
    And I submit my appeal
    And I click the `Close and Return to case details` button

    Then I click the `Overview` tab
    And I should see the `Overview` page
    Then I should only see the `legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the text `You still have a fee to pay. If you do not make a payment by {$TODAY+14|D MMM YYYY}, the Tribunal will take no further action on your appeal.`

    When I switch to be a `Case Officer`
    And I should see the `Overview` page
    Then I should only see the `caseOfficer_appealSubmitted` case progress image
    And I should see the text `What happens next`
    And I should see the text `This appeal is awaiting payment. You will be notified when the payment is made. You don't need to do anything until then.`

    When I switch to be a `Legal Rep`
    When I select the `Make a payment` Next step
    Then I should see the `Make a payment` page
    And I should see the text `The fee for this type of appeal with a hearing is £140.00`
    And I type `PBA0066906` for the `Enter your Payment by Account reference number` field
    And I should see the text `Don't have Payment by Account?`
    And I should see the `Apply to use Payment by Account` link
    And I click the `Continue` button

    When I click the `Pay now` button
    Then I should see the text `You have paid for the appeal`
    And I should see the text `Payment successful`
    And I should see the text `Payment reference number`
    And I should see the text `Payment by account number`
    And I should see the text `PBA0066906`
    And I should see the text `Fee`
    And I should see the text `£140.00`
    And I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Make a payment`

    And I click the `Appeal` tab
    And I should see the `Appeal` page
    Then I should see `Refusal of a human rights claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would be unlawful under section 6 of the Human Rights Act 1998` for the `Grounds of appeal` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Payment date` field
    And I should see `Paid` for the `Payment status` field

  @successful-payment-for-HU-appeal-type-without-hearing @RIA-3163-HU @RIA-3163
  Scenario: Make a successful payment for HU appeal type without hearing fee

    And I save my initial HU appeal type without hearing fee
    And I submit my appeal
    And I click the `Close and Return to case details` button

    Then I click the `Overview` tab
    And I should see the `Overview` page
    Then I should only see the `legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the text `You still have a fee to pay. If you do not make a payment by {$TODAY+14|D MMM YYYY}, the Tribunal will take no further action on your appeal.`

    When I switch to be a `Case Officer`
    And I should see the `Overview` page
    Then I should only see the `caseOfficer_appealSubmitted` case progress image
    And I should see the text `What happens next`
    And I should see the text `This appeal is awaiting payment. You will be notified when the payment is made. You don't need to do anything until then.`

    When I switch to be a `Legal Rep`
    And I select the `Make a payment` Next step
    Then I should see the `Make a payment` page
    And I should see the text `The fee for this type of appeal without a hearing is £80.00`
    And I type `PBA0066906` for the `Enter your Payment by Account reference number` field
    And I should see the text `Don't have Payment by Account?`
    And I should see the `Apply to use Payment by Account` link
    And I click the `Continue` button

    When I click the `Pay now` button
    Then I should see the text `You have paid for the appeal`
    And I should see the text `Payment successful`
    And I should see the text `Payment reference number`
    And I should see the text `Payment by account number`
    And I should see the text `PBA0066906`
    And I should see the text `Fee`
    And I should see the text `£80.00`
    And I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Make a payment`

    And I click the `Appeal` tab
    And I should see the `Appeal` page
    Then I should see `Refusal of a human rights claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would be unlawful under section 6 of the Human Rights Act 1998` for the `Grounds of appeal` field
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How do you want the appeal to be decided?` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Payment date` field
    And I should see `Paid` for the `Payment status` field

  @failed-payment-for-HU-appeal-type-with-hearing @RIA-3163-HU @RIA-3163
  Scenario: Make a failed payment for HU appeal type

    And I save my initial HU appeal type with hearing fee
    And I submit my appeal
    And I click the `Close and Return to case details` button

    Then I click the `Overview` tab
    And I should see the `Overview` page
    Then I should only see the `legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the text `You still have a fee to pay. If you do not make a payment by {$TODAY+14|D MMM YYYY}, the Tribunal will take no further action on your appeal.`

    When I switch to be a `Case Officer`
    And I should see the `Overview` page
    Then I should only see the `caseOfficer_appealSubmitted` case progress image
    And I should see the text `What happens next`
    And I should see the text `This appeal is awaiting payment. You will be notified when the payment is made. You don't need to do anything until then.`

    When I switch to be a `Legal Rep`
    And I select the `Make a payment` Next step
    Then I should see the `Make a payment` page
    And I should see the text `The fee for this type of appeal with a hearing is £140.00`
    And I type `PBA0079489` for the `Enter your Payment by Account reference number` field
    And I should see the text `Don't have Payment by Account?`
    And I should see the `Apply to use Payment by Account` link
    And I click the `Continue` button

    When I click the `Pay now` button
    And I should see the text `You still need to pay for your appeal.`
    And I should see the `pay for your appeal` link
    And I should see the text `Payment failed`
    And I should see the text `Payment reference number`
    And I should see the text `Payment by account number`
    And I should see the text `PBA0079489`
    And I should see the text `Fee`
    And I should see the text `£140.00`
    And I should see the text `Reason for failed payment`
    And I should see the text `Your account is deleted`
    And I click the `Close and Return to case details` button

    Then I click the `Overview` tab
    And I should see the `Overview` page
    Then I should only see the `legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the text `You still have a fee to pay. If you do not make a payment by {$TODAY+14|D MMM YYYY}, the Tribunal will take no further action on your appeal.`

    And I click the `Appeal` tab
    And I should see the `Appeal` page
    Then I should see `Refusal of a human rights claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would be unlawful under section 6 of the Human Rights Act 1998` for the `Grounds of appeal` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Payment date` field
    And I should see `Pending` for the `Payment status` field

  @successful-payment-for-PA-appeal-type-with-hearing @RIA-3163-PA @RIA-3163
  Scenario: Make a successful payment for PA appeal type with hearing fee at case building

    And I save my initial PA appeal type with hearing fee
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Rep`

    When I select the `Make a payment` Next step
    Then I should see the `Make a payment` page
    And I should see the text `The fee for this type of appeal with a hearing is £140.00`
    And I type `PBA0066906` for the `Enter your Payment by Account reference number` field
    And I should see the text `Don't have Payment by Account?`
    And I should see the `Apply to use Payment by Account` link
    And I click the `Continue` button

    When I click the `Pay now` button
    Then I should see the text `You have paid for the appeal`
    And I should see the text `Payment successful`
    And I should see the text `Payment reference number`
    And I should see the text `Payment by account number`
    And I should see the text `PBA0066906`
    And I should see the text `Fee`
    And I should see the text `£140.00`
    And I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Make a payment`

    And I click the `Appeal` tab
    And I should see the `Appeal` page
    Then I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Payment date` field
    And I should see `Paid` for the `Payment status` field

  @successful-payment-for-PA-appeal-type-without-hearing @RIA-3163-PA @RIA-3163
  Scenario: Make a successful payment for PA appeal type without hearing fee at case building

    And I save my initial PA appeal type without hearing fee
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Rep`

    When I select the `Make a payment` Next step
    Then I should see the `Make a payment` page
    And I should see the text `The fee for this type of appeal without a hearing is £80.00`
    And I type `PBA0066906` for the `Enter your Payment by Account reference number` field
    And I should see the text `Don't have Payment by Account?`
    And I should see the `Apply to use Payment by Account` link
    And I click the `Continue` button

    When I click the `Pay now` button
    Then I should see the text `You have paid for the appeal`
    And I should see the text `Payment successful`
    And I should see the text `Payment reference number`
    And I should see the text `Payment by account number`
    And I should see the text `PBA0066906`
    And I should see the text `Fee`
    And I should see the text `£80.00`
    And I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Make a payment`

    And I click the `Appeal` tab
    And I should see the `Appeal` page
    Then I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How do you want the appeal to be decided?` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Payment date` field
    And I should see `Paid` for the `Payment status` field

  @failed-payment-for-PA-appeal-type-with-hearing @RIA-3163-PA @RIA-3163
  Scenario: Make a failed payment for PA appeal type at case building

    And I save my initial PA appeal type with hearing fee
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Rep`

    When I select the `Make a payment` Next step
    Then I should see the `Make a payment` page
    And I should see the text `The fee for this type of appeal with a hearing is £140.00`
    And I type `PBA0079489` for the `Enter your Payment by Account reference number` field
    And I should see the text `Don't have Payment by Account?`
    And I should see the `Apply to use Payment by Account` link
    And I click the `Continue` button

    When I click the `Pay now` button
    And I should see the text `You still need to pay for your appeal.`
    And I should see the `pay for your appeal` link
    And I should see the text `Payment failed`
    And I should see the text `Payment reference number`
    And I should see the text `Payment by account number`
    And I should see the text `PBA0079489`
    And I should see the text `Fee`
    And I should see the text `£140.00`
    And I should see the text `Reason for failed payment`
    And I should see the text `Your account is deleted`
    And I click the `Close and Return to case details` button

    And I click the `Appeal` tab
    And I should see the `Appeal` page
    Then I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Payment date` field
    And I should see `Pending` for the `Payment status` field


