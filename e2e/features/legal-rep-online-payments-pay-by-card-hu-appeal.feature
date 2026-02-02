Feature: Pay and submit appeal by card - successful and failed payments (HU appeal type)

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I save my initial HU appeal type without remission and with hearing fee and pay now
    And I go to the overview page for the stored case
    Then I should be on the overview page
    And I submit my appeal before paying
    Then I should see the text `You must now pay for this appeal.`
    When I select the `Create a service request` Next step
    Then I should see the `Pay for this appeal` page
    And I should see the text `Next step - payment`
    And I should see the text `Select 'Submit' to create the service request`
    And I should see the text `Fee to pay`
    And I should see the text `£140.00`
    When I click the `Submit` button
    Then I should see the text `You have created a service request`
    Then I should see the text `What happens next`
    Then I should see the text `You can now pay for this appeal in the 'Service Request' tab on the case details screen.`
    When I click the `Close and Return to case details` button if present
    Then I should be on the overview page
    And I goto the `Service Request` tab
    Then I should see the text `Not paid`
    When I click the `Pay now` link
    And I wait for 5 seconds
    Then I should see the text `Pay fee using Payment by Account (PBA)`
    When I click the `Pay by credit or debit card` label
    And I click the `Continue` button
    And I wait for 5 seconds
    Then I should see the text `Enter card details`

  @RIA-6104-pay-and-submit-card-successful @RIA-6104-pay-and-submit-card-successful-hu
  Scenario: Pay and submit appeal - successful payment (HU appeal type)
    When I type `4444333322221111` for the field with ID `card-no`
    And I type `10` for the field with ID `expiry-month`
    And I type `30` for the field with ID `expiry-year`
    And I type `Test User` for the field with ID `cardholder-name`
    And I type `123` for the field with ID `cvc`
    And I type `123 Fake Street` for the field with ID `address-line-1`
    And I type `London` for the field with ID `address-city`
    And I type `FE1 2EF` for the field with ID `address-postcode`
    And I type `test@test.com` for the field with ID `email`
    And I click the Continue button on the Pay by card page
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
    And I should see the overview for a paid appeal

    When I click the `Appeal` tab
    Then I should see `Refusal of a human rights claim` for the `Type of appeal` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field


  @RIA-6104-pay-and-submit-card-failed @RIA-6104-pay-and-submit-card-failed-hu-declined
  Scenario: Pay and submit appeal - failed payment - declined (HU appeal type)

    When I type `4000000000000002` for the field with ID `card-no`
    And I type `10` for the field with ID `expiry-month`
    And I type `30` for the field with ID `expiry-year`
    And I type `Test User` for the field with ID `cardholder-name`
    And I type `123` for the field with ID `cvc`
    And I type `123 Fake Street` for the field with ID `address-line-1`
    And I type `London` for the field with ID `address-city`
    And I type `FE1 2EF` for the field with ID `address-postcode`
    And I type `test@test.com` for the field with ID `email`
    And I click the Continue button on the Pay by card page
    Then I should see the text `Your payment has been declined`
    And I should see the text `No money has been taken from your account.`
    When I click the `Continue` button
    Then I should see the text `Your card payment was unsuccessful`
    When I click the `Return to service request` link
    Then I should see the text `Not paid`

  @RIA-6104-pay-and-submit-card-failed @RIA-6104-pay-and-submit-card-failed-hu-general-error
  Scenario: Pay and submit appeal - failed payment - technical problems (HU appeal type)

    When I type `4000000000000119` for the field with ID `card-no`
    And I type `10` for the field with ID `expiry-month`
    And I type `30` for the field with ID `expiry-year`
    And I type `Test User` for the field with ID `cardholder-name`
    And I type `123` for the field with ID `cvc`
    And I type `123 Fake Street` for the field with ID `address-line-1`
    And I type `London` for the field with ID `address-city`
    And I type `FE1 2EF` for the field with ID `address-postcode`
    And I type `test@test.com` for the field with ID `email`
    And I click the Continue button on the Pay by card page
    Then I should see the text `We’re experiencing technical problems`
    And I should see the text `No money has been taken from your account.`
    When I click the `Cancel and go back to try the payment again` link
    Then I should see the text `Your card payment was unsuccessful`
    When I click the `Return to service request` link
    Then I should see the text `Not paid`
