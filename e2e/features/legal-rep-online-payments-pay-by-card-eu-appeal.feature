Feature: Pay and submit appeal by card - successful and failed payments (EU appeal type)

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial EU appeal type without remission and with hearing fee and pay now
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    And I submit my appeal before paying
    And I wait for 10 seconds
    Then I should see the text `You need to pay for your appeal or the Tribunal will end the appeal.`
    When I click the `pay for your appeal` link
    And I wait for 5 seconds
    Then I should see the text `Not paid`
    When I click the `Pay now` link
    And I wait for 5 seconds
    Then I should see the text `Pay fee using Payment by Account (PBA)`
    When I click the `Pay by credit or debit card` label
    And I click the `Continue` button
    And I wait for 5 seconds
    Then I should see the text `Enter card details`

  @RIA-6104-pay-and-submit-card-successful @RIA-6104-pay-and-submit-card-successful-eu
  Scenario: Pay and submit appeal - successful payment (EU appeal type)
    When I type `4444333322221111` for the field with ID `card-no`
    And I type `10` for the field with ID `expiry-month`
    And I type `24` for the field with ID `expiry-year`
    And I type `Test User` for the field with ID `cardholder-name`
    And I type `123` for the field with ID `cvc`
    And I type `123 Fake Street` for the field with ID `address-line-1`
    And I type `Fakeicester` for the field with ID `address-city`
    And I type `FE1 2EF` for the field with ID `address-postcode`
    And I type `test@test.com` for the field with ID `email`
    And I click the `Continue` button
    Then I should see the text `Payment summary`
    When I click the `Confirm payment` button
    And I wait for 5 seconds
    Then I should see the text `Payment successful`
    When I click the `Return to service request` link

    Then I should see the text `Paid`
    And I should see the text `José González`
    When I click the `Overview` tab
    Then I should only see the `progress_legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the text `You have submitted your appeal. A Tribunal Caseworker will now review your appeal.`

    When I click the `Appeal` tab
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field


  @RIA-6104-pay-and-submit-card-failed @RIA-6104-pay-and-submit-card-failed-eu-declined
  Scenario: Pay and submit appeal - failed payment - declined (EU appeal type)

    When I type `4000000000000002` for the field with ID `card-no`
    And I type `10` for the field with ID `expiry-month`
    And I type `24` for the field with ID `expiry-year`
    And I type `Test User` for the field with ID `cardholder-name`
    And I type `123` for the field with ID `cvc`
    And I type `123 Fake Street` for the field with ID `address-line-1`
    And I type `Fakeicester` for the field with ID `address-city`
    And I type `FE1 2EF` for the field with ID `address-postcode`
    And I type `test@test.com` for the field with ID `email`
    And I click the `Continue` button
    Then I should see the text `Your payment has been declined`
    And I should see the text `No money has been taken from your account.`
    When I click the `Continue` button
    Then I should see the text `Your card payment was unsuccessful`
    When I click the `Return to service request` link
    Then I should see the text `Not paid`

  @RIA-6104-pay-and-submit-card-failed @RIA-6104-pay-and-submit-card-failed-eu-general-error
  Scenario: Pay and submit appeal - failed payment - technical problems (EU appeal type)

    When I type `4000000000000119` for the field with ID `card-no`
    And I type `10` for the field with ID `expiry-month`
    And I type `24` for the field with ID `expiry-year`
    And I type `Test User` for the field with ID `cardholder-name`
    And I type `123` for the field with ID `cvc`
    And I type `123 Fake Street` for the field with ID `address-line-1`
    And I type `Fakeicester` for the field with ID `address-city`
    And I type `FE1 2EF` for the field with ID `address-postcode`
    And I type `test@test.com` for the field with ID `email`
    And I click the `Continue` button
    Then I should see the text `We’re experiencing technical problems`
    And I should see the text `No money has been taken from your account.`
    When I click the `Cancel and go back to try the payment again` link
    Then I should see the text `Your card payment was unsuccessful`
    When I click the `Return to service request` link
    Then I should see the text `Not paid`
