Feature: Submit Appeal with offline payment for EA and HU

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case

  @submit-appeal-with-offline-payment-for-EA-appeal-type @RIA-3278-EA @RIA-3278
  Scenario: Make a successful payment for EA appeal type with hearing fee after appeal submitted state

    And I save my initial EA appeal type with no remission and with hearing fee and pay offline
    And I submit my nonpayment appeal

    When I click the `Overview` tab

    Then I should only see the `progress_legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the text `You still need to pay for this appeal. You will soon receive a notification with instructions on how to pay by card online. You need to pay within 14 days of receiving the notification or the Tribunal will end the appeal.`

    And I click the `Appeal` tab
    And I should see the `Appeal` page
    Then I should see `Refusal of application under the EEA regulations` for the `Type of appeal` field
    And I should see `The decision breaches the appellant's rights under the EEA regulations` for the `Grounds of appeal` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Case Officer`
    And I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Payment pending` for the `Payment status` field
    And I click the `Overview` tab
    And I should see the text `This appeal is awaiting payment. You will be notified when the payment is made. You don't need to do anything until then.`

    When I switch to be a `Admin Officer`
    And I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Judge`
    And I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Home Office APC`
    And I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Home Office LART`
    And I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Home Office POU`
    And I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Home Office Generic`
    And I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Payment pending` for the `Payment status` field

  @submit-appeal-with-offline-payment-for-HU-appeal-type @RIA-3278-HU @RIA-3278
  Scenario: Make a successful payment for HU appeal type with hearing fee after appeal submitted state

    And I save my initial HU appeal type with no remission and with hearing fee and pay offline
    And I submit my nonpayment appeal

    When I click the `Overview` tab
    Then I should only see the `progress_legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the text `You still need to pay for this appeal. You will soon receive a notification with instructions on how to pay by card online. You need to pay within 14 days of receiving the notification or the Tribunal will end the appeal.`

    And I click the `Appeal` tab
    And I should see the `Appeal` page
    Then I should see `Refusal of a human rights claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would be unlawful under section 6 of the Human Rights Act 1998` for the `Grounds of appeal` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Case Officer`
    And I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Payment pending` for the `Payment status` field
    And I click the `Overview` tab
    And I should see the text `This appeal is awaiting payment. You will be notified when the payment is made. You don't need to do anything until then.`

    When I switch to be a `Admin Officer`
    And I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Judge`
    And I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Home Office APC`
    And I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Home Office LART`
    And I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Home Office POU`
    And I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Payment pending` for the `Payment status` field

    When I switch to be a `Home Office Generic`
    And I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Payment pending` for the `Payment status` field
