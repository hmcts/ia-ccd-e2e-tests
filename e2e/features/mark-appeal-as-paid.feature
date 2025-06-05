Feature: Mark appeal as paid

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case

  @Mark-appeal-as-paid-PA @RIA-3473-PA @RIA-3473 @RIA-3014
  Scenario: Mark PA appeal as paid (PA appeal type with a hearing)

    And I save my initial PA appeal type with no remission and with hearing fee and pay offline
    And I submit my nonpayment appeal

    When I click the `Overview` tab
    Then I should only see the `progress_legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the overview for a paid appeal

    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` for the `Grounds of appeal` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal by card` for the `Payment method` field
    And I should see `Payment pending` for the `Payment status` field

    Then I switch to be a `Admin Officer`
    And I select the `Mark appeal as paid` Next step
    Then I should see the `Mark appeal as paid` page
    And I type `31-08-2020` for the `Payment date` field
    And I type `140` for the `Amount paid` field
    And I type `Payment is now complete` for the `Additional payment information (Optional) field
    And I click the `Continue` button

    When I am on the `Check your answers` page
    And I should see `31 Aug 2020` in the `Payment date` field
    And I should see `£140.00` for the `Amount paid` field
    And I should see `Payment is now complete` for the `Additional payment information` field

    When I click the `Mark as paid` button
    Then I should see the text `Your have marked the appeal as paid`
    And I should see the text `What happens next`
    And I should see the text `The Tribunal will be notified that the fee has been paid. The appeal will progress as usual.`
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I should see an alert confirming the case `has been updated with event: Mark appeal as paid`

    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` for the `Grounds of appeal` field
    And I should see `31 Aug 2020` for the `Payment date` field
    And I should see `£140.00` for the `Amount paid` field
    And I should see `Payment is now complete` for the `Additional payment information` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal by card` for the `Payment method` field

    When I switch to be a `Legal Rep`
    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` for the `Grounds of appeal` field
    And I should see `Paid` for the `Payment status` field
    And I should see `31 Aug 2020` for the `Payment date` field
    And I should see `£140.00` for the `Amount paid` field
    And I should see `Payment is now complete` for the `Additional payment information` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal by card` for the `Payment method` field


    When I switch to be a `Case Officer`
    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` for the `Grounds of appeal` field
    And I should see `Paid` for the `Payment status` field
    And I should see `31 Aug 2020` for the `Payment date` field
    And I should see `£140.00` for the `Amount paid` field
    And I should see `Payment is now complete` for the `Additional payment information` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal by card` for the `Payment method` field


    When I switch to be a `Judge`
    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` for the `Grounds of appeal` field
    And I should see `Paid` for the `Payment status` field
    And I should see `31 Aug 2020` for the `Payment date` field
    And I should see `£140.00` for the `Amount paid` field
    And I should see `Payment is now complete` for the `Additional payment information` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal by card` for the `Payment method` field


    When I switch to be a `Home Office APC`
    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` for the `Grounds of appeal` field
    And I should see `Paid` for the `Payment status` field
    And I should see `£140.00` for the `Amount paid` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal by card` for the `Payment method` field


    When I switch to be a `Home Office LART`
    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` for the `Grounds of appeal` field
    And I should see `Paid` for the `Payment status` field
    And I should see `£140.00` for the `Amount paid` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal by card` for the `Payment method` field


    When I switch to be a `Home Office POU`
    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` for the `Grounds of appeal` field
    And I should see `Paid` for the `Payment status` field
    And I should see `£140.00` for the `Amount paid` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal by card` for the `Payment method` field


    When I switch to be a `Home Office Generic`
    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` for the `Grounds of appeal` field
    And I should see `Paid` for the `Payment status` field
    And I should see `£140.00` for the `Amount paid` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal by card` for the `Payment method` field

  @Mark-appeal-as-paid-EA @RIA-3473-EA @RIA-3473 @RIA-3014
  Scenario: Mark EA appeal as paid (EA appeal type with a hearing)

    And I save my initial EA appeal type with no remission and with hearing fee and pay offline
    And I submit my nonpayment appeal

    When I click the `Overview` tab
    And I should see the text `Do this next`
    And I should see the text `You still need to pay for this appeal. You will soon receive a notification with instructions on how to pay by card online.`

    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of application under the EEA regulations` for the `Type of appeal` field
    And I should see `The decision breaches the appellant's rights under the EEA regulations` for the `Grounds of appeal` field
    And I should see `Payment pending` for the `Payment status` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Pay by card` for the `Payment method` field

    Then I switch to be a `Admin Officer`
    And I click the `Overview` tab
    And I should see the text `Do this next`
    And I should see the text `Generate a payment reference for this appeal.`
    And I should see the text `Email the legal representative with instructions to pay the fee.`
    And I should see the text `Then add a case note. You must attach a copy of the email you sent to the legal representative to the case note.`
    And I should see the text `Finally, you then need to do one of the following:`

    And I select the `Mark appeal as paid` Next step
    Then I should see the `Mark appeal as paid` page
    And I type `31-08-2020` for the `Payment date` field
    And I type `140` for the `Amount paid` field
    And I type `Payment is now complete` for the `Additional payment information (Optional) field
    And I click the `Continue` button

    When I am on the `Check your answers` page
    And I should see `31 Aug 2020` in the `Payment date` field
    And I should see `£140.00` for the `Amount paid` field
    And I should see `Payment is now complete` for the `Additional payment information` field

    When I click the `Mark as paid` button
    Then I should see the text `Your have marked the appeal as paid`
    And I should see the text `What happens next`
    And I should see the text `The Tribunal will be notified that the fee has been paid. The appeal will progress as usual.`
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I should see an alert confirming the case `has been updated with event: Mark appeal as paid`

    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of application under the EEA regulations` for the `Type of appeal` field
    And I should see `The decision breaches the appellant's rights under the EEA regulations` for the `Grounds of appeal` field
    And I should see `Pay by card` for the `Payment method` field
    And I should see `31 Aug 2020` for the `Payment date` field
    And I should see `£140.00` for the `Amount paid` field
    And I should see `Paid` for the `Payment status` field
    And I should see `Payment is now complete` for the `Additional payment information` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field

    When I switch to be a `Legal Rep`
    Then I click the `Overview` tab
    Then I should only see the `progress_legalRep_appealSubmitted` case progress image
    And I should see the overview for a paid appeal

    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of application under the EEA regulations` for the `Type of appeal` field
    And I should see `The decision breaches the appellant's rights under the EEA regulations` for the `Grounds of appeal` field
    And I should see `Pay by card` for the `Payment method` field
    And I should see `Paid` for the `Payment status` field
    And I should see `31 Aug 2020` for the `Payment date` field
    And I should see `£140.00` for the `Amount paid` field
    And I should see `Payment is now complete` for the `Additional payment information` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field

    When I switch to be a `Case Officer`
    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of application under the EEA regulations` for the `Type of appeal` field
    And I should see `The decision breaches the appellant's rights under the EEA regulations` for the `Grounds of appeal` field
    And I should see `Pay by card` for the `Payment method` field
    And I should see `Paid` for the `Payment status` field
    And I should see `31 Aug 2020` for the `Payment date` field
    And I should see `£140.00` for the `Amount paid` field
    And I should see `Payment is now complete` for the `Additional payment information` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field

    When I switch to be a `Judge`
    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of application under the EEA regulations` for the `Type of appeal` field
    And I should see `The decision breaches the appellant's rights under the EEA regulations` for the `Grounds of appeal` field
    And I should see `Pay by card` for the `Payment method` field
    And I should see `Paid` for the `Payment status` field
    And I should see `31 Aug 2020` for the `Payment date` field
    And I should see `£140.00` for the `Amount paid` field
    And I should see `Payment is now complete` for the `Additional payment information` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field

    When I switch to be a `Home Office APC`
    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of application under the EEA regulations` for the `Type of appeal` field
    And I should see `The decision breaches the appellant's rights under the EEA regulations` for the `Grounds of appeal` field
    And I should see `Pay by card` for the `Payment method` field
    And I should see `Paid` for the `Payment status` field
    And I should see `£140.00` for the `Amount paid` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field

    When I switch to be a `Home Office LART`
    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of application under the EEA regulations` for the `Type of appeal` field
    And I should see `The decision breaches the appellant's rights under the EEA regulations` for the `Grounds of appeal` field
    And I should see `Pay by card` for the `Payment method` field
    And I should see `Paid` for the `Payment status` field
    And I should see `£140.00` for the `Amount paid` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field

    When I switch to be a `Home Office POU`
    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of application under the EEA regulations` for the `Type of appeal` field
    And I should see `The decision breaches the appellant's rights under the EEA regulations` for the `Grounds of appeal` field
    And I should see `Pay by card` for the `Payment method` field
    And I should see `Paid` for the `Payment status` field
    And I should see `£140.00` for the `Amount paid` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field


    When I switch to be a `Home Office Generic`
    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of application under the EEA regulations` for the `Type of appeal` field
    And I should see `The decision breaches the appellant's rights under the EEA regulations` for the `Grounds of appeal` field
    And I should see `Pay by card` for the `Payment method` field
    And I should see `Paid` for the `Payment status` field
    And I should see `£140.00` for the `Amount paid` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field


  @Mark-appeal-as-paid-HU @RIA-3473-HU @RIA-3473 @RIA-3014
  Scenario: Mark HU appeal as paid (HU appeal type without a hearing)

    And I save my initial HU appeal type with no remission and without hearing fee and pay offline
    And I submit my nonpayment appeal

    When I click the `Overview` tab
    And I should see the text `Do this next`
    And I should see the text `You still need to pay for this appeal. You will soon receive a notification with instructions on how to pay by card online.`

    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of a human rights claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would be unlawful under section 6 of the Human Rights Act 1998` for the `Grounds of appeal` field
    And I should see `Payment pending` for the `Payment status` field
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay by card` for the `Payment method` field

    Then I switch to be a `Admin Officer`
    And I click the `Overview` tab
    And I should see the text `Do this next`
    And I should see the text `Generate a payment reference for this appeal.`
    And I should see the text `Email the legal representative with instructions to pay the fee.`
    And I should see the text `Then add a case note. You must attach a copy of the email you sent to the legal representative to the case note.`
    And I should see the text `Finally, you then need to do one of the following:`

    And I select the `Mark appeal as paid` Next step
    Then I should see the `Mark appeal as paid` page
    And I type `31-08-2020` for the `Payment date` field
    And I type `80` for the `Amount paid` field
    And I type `Payment is now complete` for the `Additional payment information (Optional) field
    And I click the `Continue` button

    When I am on the `Check your answers` page
    And I should see `31 Aug 2020` in the `Payment date` field
    And I should see `£80.00` for the `Amount paid` field
    And I should see `Payment is now complete` for the `Additional payment information` field

    When I click the `Mark as paid` button
    Then I should see the text `Your have marked the appeal as paid`
    And I should see the text `What happens next`
    And I should see the text `The Tribunal will be notified that the fee has been paid. The appeal will progress as usual.`
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I should see an alert confirming the case `has been updated with event: Mark appeal as paid`

    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of a human rights claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would be unlawful under section 6 of the Human Rights Act 1998` for the `Grounds of appeal` field
    And I should see `31 Aug 2020` for the `Payment date` field
    And I should see `£80.00` for the `Amount paid` field
    And I should see `Paid` for the `Payment status` field
    And I should see `Payment is now complete` for the `Additional payment information` field
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay by card` for the `Payment method` field

    When I switch to be a `Legal Rep`
    Then I click the `Overview` tab
    Then I should only see the `progress_legalRep_appealSubmitted` case progress image
    And I should see the overview for a paid appeal

    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of a human rights claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would be unlawful under section 6 of the Human Rights Act 1998` for the `Grounds of appeal` field
    And I should see `Paid` for the `Payment status` field
    And I should see `31 Aug 2020` for the `Payment date` field
    And I should see `£80.00` for the `Amount paid` field
    And I should see `Payment is now complete` for the `Additional payment information` field
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay by card` for the `Payment method` field

    When I switch to be a `Case Officer`
    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of a human rights claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would be unlawful under section 6 of the Human Rights Act 1998` for the `Grounds of appeal` field
    And I should see `Paid` for the `Payment status` field
    And I should see `31 Aug 2020` for the `Payment date` field
    And I should see `£80.00` for the `Amount paid` field
    And I should see `Payment is now complete` for the `Additional payment information` field
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay by card` for the `Payment method` field

    When I switch to be a `Judge`
    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of a human rights claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would be unlawful under section 6 of the Human Rights Act 1998` for the `Grounds of appeal` field
    And I should see `Paid` for the `Payment status` field
    And I should see `31 Aug 2020` for the `Payment date` field
    And I should see `£80.00` for the `Amount paid` field
    And I should see `Payment is now complete` for the `Additional payment information` field
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay by card` for the `Payment method` field

    When I switch to be a `Home Office APC`
    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of a human rights claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would be unlawful under section 6 of the Human Rights Act 1998` for the `Grounds of appeal` field
    And I should see `Paid` for the `Payment status` field
    And I should see `£80.00` for the `Amount paid` field
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay by card` for the `Payment method` field

    When I switch to be a `Home Office LART`
    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of a human rights claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would be unlawful under section 6 of the Human Rights Act 1998` for the `Grounds of appeal` field
    And I should see `Paid` for the `Payment status` field
    And I should see `£80.00` for the `Amount paid` field
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay by card` for the `Payment method` field

    When I switch to be a `Home Office POU`
    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of a human rights claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would be unlawful under section 6 of the Human Rights Act 1998` for the `Grounds of appeal` field
    And I should see `Paid` for the `Payment status` field
    And I should see `£80.00` for the `Amount paid` field
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay by card` for the `Payment method` field


    When I switch to be a `Home Office Generic`
    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of a human rights claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would be unlawful under section 6 of the Human Rights Act 1998` for the `Grounds of appeal` field
    And I should see `Paid` for the `Payment status` field
    And I should see `£80.00` for the `Amount paid` field
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How does the appellant want the appeal to be decided?` field
    And I should see `Pay by card` for the `Payment method` field

  @End-appeal-HU @RIA-3473-end-appeal-HU @RIA-3473
  Scenario: End HU appeal on payment incomplete

    And I save my initial HU appeal type with no remission and without hearing fee and pay offline
    And I submit my nonpayment appeal

    When I click the `Overview` tab
    And I should see the text `Do this next`
    And I should see the text `You still need to pay for this appeal. You will soon receive a notification with instructions on how to pay by card online.`

    Then I switch to be a `Admin Officer`
    And I end the appeal
    Then I should only see the `caseOfficer_appealEnded` case progress image
    And I should see the text `What happens next`
    And I should see the text `No further action required, unless either party asks for the decision to be reviewed by a judge.`
    And I should see the ended appeal details


  @End-appeal-EA @RIA-3473-end-appeal-EA @RIA-3473 @RIA-3014
  Scenario: End EA appeal on payment incomplete

    And I save my initial EA appeal type with no remission and without hearing fee and pay offline
    And I submit my nonpayment appeal

    When I click the `Overview` tab
    And I should see the text `Do this next`
    And I should see the text `You still need to pay for this appeal. You will soon receive a notification with instructions on how to pay by card online.`

    Then I switch to be a `Admin Officer`
    And I end the appeal
    Then I should only see the `caseOfficer_appealEnded` case progress image
    And I should see the text `What happens next`
    And I should see the text `No further action required, unless either party asks for the decision to be reviewed by a judge.`
    And I should see the ended appeal details

