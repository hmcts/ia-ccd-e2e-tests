Feature: Payment validation for non-payment appeal type

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case

  @payment-validation-for-non-payment-appeal-type-RP @payment-validation-for-non-payment_appeal-type @RIA-3654
  Scenario: Select initial appeal with RP appeal type and validate payment errors

    When I save my initial RP appeal for nonPayment without hearing
    And I click the `Overview` tab
    And I select the `Pay and submit` Next step
    And I should see the text `The Pay for and submit your appeal option is not available. Select Submit your appeal if you want to submit the appeal now.`

    Then I submit my nonpayment appeal
    And I click the `Overview` tab
    And I select the `Make a payment` Next step
    And I should see the text `You do not have to pay for this type of appeal.`

    Then I switch to be a `Admin Officer`
    And I click the `Overview` tab
    And I select the `Mark appeal as paid` Next step
    And I should see the text `Payment is not required for this type of appeal.`

  @payment-validation-for-non-payment-appeal-type-DC @payment-validation-for-non-payment_appeal-type @RIA-3654
  Scenario: Select initial appeal with DC appeal type and validate payment errors

    When I save my initial DC appeal for nonPayment without hearing
    And I click the `Overview` tab
    And I select the `Pay and submit` Next step
    And I should see the text `The Pay for and submit your appeal option is not available. Select Submit your appeal if you want to submit the appeal now.`

    Then I submit my nonpayment appeal
    And I click the `Overview` tab
    And I select the `Make a payment` Next step
    And I should see the text `You do not have to pay for this type of appeal.`

    Then I switch to be a `Admin Officer`
    And I click the `Overview` tab
    And I select the `Mark appeal as paid` Next step
    And I should see the text `Payment is not required for this type of appeal.`

  @payment-validation-for-pa-appeal-type-pay-later @RIA-3654
  Scenario: Select initial appeal with PA appeal type for pay later and validate payment error when mark appeal as paid

    And I save my initial PA appeal type with no remission and with hearing fee and pay later
    And I submit my nonpayment appeal

    Then I switch to be a `Admin Officer`
    And I click the `Overview` tab
    And I select the `Mark appeal as paid` Next step
    And I should see the text `The Mark appeal as paid option is not available.`


  @Submit-RP-appeal-type-with-hearing @RIA-3516-RP-appeal-type-with-hearing @3516
  Scenario: Submit RP appeal type with hearing option

    When I save my initial RP appeal for nonPayment with hearing
    Then I submit my nonpayment appeal

    Then I click the `Appeal` tab
    And I should see `Decision with a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Case Officer`
    And I click the `Appeal` tab
    And I should see `Decision with a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Admin Officer`
    And I click the `Appeal` tab
    And I should see `Decision with a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Judge`
    And I click the `Appeal` tab
    And I should see `Decision with a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Home Office APC`
    And I click the `Appeal` tab
    And I should see `Decision with a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Home Office LART`
    And I click the `Appeal` tab
    And I should see `Decision with a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Home Office POU`
    And I click the `Appeal` tab
    And I should see `Decision with a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Home Office Generic`
    And I click the `Appeal` tab
    And I should see `Decision with a hearing` for the `How do you want the appeal to be decided?` field

  @Submit-DC-appeal-type-with-hearing @RIA-3516-DC-appeal-type-with-hearing @3516
  Scenario: Submit RP appeal type with hearing option

    When I save my initial DC appeal for nonPayment with hearing
    Then I submit my nonpayment appeal

    Then I click the `Appeal` tab
    And I should see `Decision with a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Case Officer`
    And I click the `Appeal` tab
    And I should see `Decision with a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Admin Officer`
    And I click the `Appeal` tab
    And I should see `Decision with a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Judge`
    And I click the `Appeal` tab
    And I should see `Decision with a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Home Office APC`
    And I click the `Appeal` tab
    And I should see `Decision with a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Home Office LART`
    And I click the `Appeal` tab
    And I should see `Decision with a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Home Office POU`
    And I click the `Appeal` tab
    And I should see `Decision with a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Home Office Generic`
    And I click the `Appeal` tab
    And I should see `Decision with a hearing` for the `How do you want the appeal to be decided?` field

  @Submit-RP-appeal-type-without-hearing @RIA-3516-RP-appeal-type-without-hearing @3516
  Scenario: Submit RP appeal type with hearing option

    When I save my initial RP appeal for nonPayment without hearing
    Then I submit my nonpayment appeal

    Then I click the `Appeal` tab
    And I should see `Decision without a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Case Officer`
    And I click the `Appeal` tab
    And I should see `Decision without a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Admin Officer`
    And I click the `Appeal` tab
    And I should see `Decision without a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Judge`
    And I click the `Appeal` tab
    And I should see `Decision without a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Home Office APC`
    And I click the `Appeal` tab
    And I should see `Decision without a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Home Office LART`
    And I click the `Appeal` tab
    And I should see `Decision without a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Home Office POU`
    And I click the `Appeal` tab
    And I should see `Decision without a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Home Office Generic`
    And I click the `Appeal` tab
    And I should see `Decision without a hearing` for the `How do you want the appeal to be decided?` field

  @Submit-DC-appeal-type-without-hearing @RIA-3516-RP-appeal-type-without-hearing @3516
  Scenario: Submit RP appeal type with hearing option

    When I save my initial DC appeal for nonPayment without hearing
    Then I submit my nonpayment appeal

    Then I click the `Appeal` tab
    And I should see `Decision without a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Case Officer`
    And I click the `Appeal` tab
    And I should see `Decision without a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Admin Officer`
    And I click the `Appeal` tab
    And I should see `Decision without a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Judge`
    And I click the `Appeal` tab
    And I should see `Decision without a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Home Office APC`
    And I click the `Appeal` tab
    And I should see `Decision without a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Home Office LART`
    And I click the `Appeal` tab
    And I should see `Decision without a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Home Office POU`
    And I click the `Appeal` tab
    And I should see `Decision without a hearing` for the `How do you want the appeal to be decided?` field

    Then I switch to be a `Home Office Generic`
    And I click the `Appeal` tab
    And I should see `Decision without a hearing` for the `How do you want the appeal to be decided?` field




