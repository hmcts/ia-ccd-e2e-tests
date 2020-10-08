Feature: Payment validation for non-payment appeal type

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case

  @payment-validation-for-non-payment-appeal-type-RP @payment-validation-for-non-payment_appeal-type @RIA-3654
  Scenario: Select initial appeal with RP appeal type and validate payment errors

    When I save my initial RP appeal for nonPayment
    And I click the `Overview` tab
    And I select the `Pay and submit` Next step
    And I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `Errors`
    And I should see the text `The Pay and submit your appeal option is not available. Select Submit your appeal if you want to submit the appeal now.`

    Then I submit my nonpayment appeal
    And I click the `Overview` tab
    And I select the `Make a payment` Next step
    And I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `Errors`
    And I should see the text `You do not have to pay for this type of appeal.`

    Then I switch to be a `Admin Officer`
    And I click the `Overview` tab
    And I select the `Mark appeal as paid` Next step
    And I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `Errors`
    And I should see the text `Payment is not required for this type of appeal.`

  @payment-validation-for-non-payment-appeal-type-DC @payment-validation-for-non-payment_appeal-type @RIA-3654
  Scenario: Select initial appeal with DC appeal type and validate payment errors

    When I save my initial DC appeal for nonPayment
    And I click the `Overview` tab
    And I select the `Pay and submit` Next step
    And I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `Errors`
    And I should see the text `The Pay and submit your appeal option is not available. Select Submit your appeal if you want to submit the appeal now.`

    Then I submit my nonpayment appeal
    And I click the `Overview` tab
    And I select the `Make a payment` Next step
    And I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `Errors`
    And I should see the text `You do not have to pay for this type of appeal.`

    Then I switch to be a `Admin Officer`
    And I click the `Overview` tab
    And I select the `Mark appeal as paid` Next step
    And I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `Errors`
    And I should see the text `Payment is not required for this type of appeal.`

  @payment-validation-for-pa-appeal-type-pay-later @RIA-3654
  Scenario: Select initial appeal with PA appeal type for pay later and validate payment error when mark appeal as paid

    And I save my initial PA appeal type with hearing fee and pay later
    And I submit my nonpayment appeal

    Then I switch to be a `Admin Officer`
    And I click the `Overview` tab
    And I select the `Mark appeal as paid` Next step
    And I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `Errors`
    And I should see the text `The Mark appeal as paid option is not available.`
