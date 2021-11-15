Feature: Pay by card (offline) after submitting appeal (HU appeal type)

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case

    And I save my initial HU appeal type without remission and with hearing fee and pay offline
    And I submit my nonpayment appeal

  @RIA-4468-pay-offline @RIA-4468-pay-offline-hu @RIA-4468
  Scenario: Pay by card (offline) after submitting appeal (HU appeal type)

    When I click the `Overview` tab
    Then I should only see the `progress_legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the text `You still need to pay for this appeal. You will soon receive a notification with instructions on how to pay by card online. You need to pay within 14 days of receiving the notification or the Tribunal will end the appeal.`

    When I click the `Appeal` tab
    Then I should see `Refusal of a human rights claim` for the `Type of appeal` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Pay by card` for the `Payment method` field
    And I should see `Payment pending` for the `Payment status` field

    When I click the `Overview` tab
    And I select the `Make a payment` Next step
    Then I should see the text `Errors`
    And I should see the text `The Make a payment option is not available.`

    When I select the `Change payment method to card` Next step
    Then I should see the text `Errors`
    And I should see the text `You can only change the payment method to card following a failed payment using Payment by Account.`
