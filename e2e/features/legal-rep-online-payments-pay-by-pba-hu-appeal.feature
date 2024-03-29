Feature: Pay and submit appeal by PBA - successful and failed payments (HU appeal type)

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial HU appeal type without remission and with hearing fee and pay now
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
    When I click the `Pay fee using Payment by Account (PBA)` label
    And I wait for 1 seconds

  @RIA-6104-pay-and-submit-pba-successful @RIA-6104-pay-and-submit-pba-successful-hu @nightly-test
  Scenario: Pay and submit appeal - successful payment (HU appeal type)
    And I select `PBA0087412` from the dropdown with ID `pbaAccountNumber`
    And I wait for 1 seconds
    And I type `Unique Reference` for the field with ID `pbaAccountRef`
    And I hit Enter in the field with ID `pbaAccountRef`
    And I click the `Confirm payment` button
    And I wait for 5 seconds
    Then I should see the text `Payment successful`
    When I click the `View service requests` link
    Then I should see the text `Paid`
    And I should see the text `José González`

    When I click the `Overview` tab
    Then I should only see the `progress_legalRep_appealSubmitted` case progress image

    When I click the `Appeal` tab
    Then I should see `Refusal of a human rights claim` for the `Type of appeal` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field


  @RIA-6104-pay-and-submit-pba-failed @RIA-6104-pay-and-submit-pba-failed-hu
  Scenario: Pay and submit appeal - failed payment (HU appeal type)
    And I select `PBA0083333` from the dropdown with ID `pbaAccountNumber`
    And I type `Unique Reference` for the field with ID `pbaAccountRef`
    And I click the `Confirm payment` button
    And I wait for 5 seconds
    Then I should see the text `Sorry, there is a problem with the service`

  @RIA-6104-pay-and-submit-pba-failed @RIA-6104-pay-and-submit-pba-failed-hu-2
  Scenario: Pay and submit appeal - failed payment 2 (HU appeal type)

    And I select `PBA0080000` from the dropdown with ID `pbaAccountNumber`
    And I type `Unique Reference` for the field with ID `pbaAccountRef`
    And I click the `Confirm payment` button
    And I wait for 5 seconds
    Then I should see the text `Sorry, there is a problem with the service`
