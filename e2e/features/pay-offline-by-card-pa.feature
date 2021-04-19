Feature: Pay offline pa by card

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case

  @pay_offline-by-card-for-PA-appeal-type-with-hearing-fee @RIA-3434-PA @RIA-3434
  Scenario: Pay offline by card (PA appeal type with a hearing)

    And I save my initial PA appeal type with no remission and with hearing fee and pay offline
    And I submit my nonpayment appeal

    When I click the `Overview` tab
    Then I should only see the `progress_legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the text `You have submitted your appeal. A Tribunal Caseworker will now review your appeal.`

    And I should see the text `Case details`
    And I should see the text `Refusal of protection claim`
    And I should see the legal representative details

    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` for the `Grounds of appeal` field
    And I should see `I do not have this document` for the `Reason you cannot provide the Notice of Decision` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal by card` for the `Payment method` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Case Officer`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `I do not have this document` for the `Reason you cannot provide the Notice of Decision` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal by card` for the `Payment method` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Admin Officer`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `I do not have this document` for the `Reason you cannot provide the Notice of Decision` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal by card` for the `Payment method` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Judge`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `I do not have this document` for the `Reason you cannot provide the Notice of Decision` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal by card` for the `Payment method` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Home Office APC`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `I do not have this document` for the `Reason you cannot provide the Notice of Decision` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal by card` for the `Payment method` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Home Office LART`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `I do not have this document` for the `Reason you cannot provide the Notice of Decision` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal by card` for the `Payment method` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Home Office POU`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `I do not have this document` for the `Reason you cannot provide the Notice of Decision` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal by card` for the `Payment method` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Home Office Generic`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `I do not have this document` for the `Reason you cannot provide the Notice of Decision` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal by card` for the `Payment method` field
    And I should see `Payment pending` for the `Payment status` field


  @pay_offline-by-card-for-PA-appeal-type-without-hearing-fee @RIA-3434-PA @RIA-3434
  Scenario: Pay offline by card (PA appeal type without a hearing)

    And I save my initial PA appeal type with no remission and without hearing fee and pay offline
    And I submit my nonpayment appeal

    When I click the `Overview` tab
    Then I should only see the `progress_legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the text `You have submitted your appeal. A Tribunal Caseworker will now review your appeal.`

    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` for the `Grounds of appeal` field
    And I should see `I do not have this document` for the `Reason you cannot provide the Notice of Decision` field
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How do you want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal by card` for the `Payment method` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Case Officer`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `I do not have this document` for the `Reason you cannot provide the Notice of Decision` field
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How do you want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal by card` for the `Payment method` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Admin Officer`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `I do not have this document` for the `Reason you cannot provide the Notice of Decision` field
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How do you want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal by card` for the `Payment method` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Judge`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `I do not have this document` for the `Reason you cannot provide the Notice of Decision` field
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How do you want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal by card` for the `Payment method` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Home Office APC`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `I do not have this document` for the `Reason you cannot provide the Notice of Decision` field
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How do you want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal by card` for the `Payment method` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Home Office LART`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `I do not have this document` for the `Reason you cannot provide the Notice of Decision` field
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How do you want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal by card` for the `Payment method` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Home Office POU`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `I do not have this document` for the `Reason you cannot provide the Notice of Decision` field
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How do you want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal by card` for the `Payment method` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Home Office Generic`
    And I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `I do not have this document` for the `Reason you cannot provide the Notice of Decision` field
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How do you want the appeal to be decided?` field
    And I should see `Pay after submitting the appeal by card` for the `Payment method` field
    And I should see `Payment pending` for the `Payment status` field
