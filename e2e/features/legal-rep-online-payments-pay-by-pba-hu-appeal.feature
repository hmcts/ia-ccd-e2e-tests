Feature: Pay and submit appeal by PBA - successful and failed payments (HU appeal type)

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I wait for 30 seconds
    And I create a new case
    And I save my initial HU appeal type without remission and with hearing fee and pay now
    And I click the `Close and Return to case details` button
    And I submit my appeal before paying
    And I wait for 10 seconds
    Then I should see the text `You still need to pay for your appeal. You will soon receive a notification with instructions on how to pay by card online. You need to pay within 14 days of receiving the notification or the Tribunal will end the appeal.`
    When I click the `pay for your appeal` link
    And I wait for 5 seconds
    Then I should see the text `Not paid`
    When I click the `Pay now` link
    And I wait for 5 seconds
    Then I should see the text `Pay fee using Payment by Account (PBA)`
    When I click the `Pay fee using Payment by Account (PBA)` label
    And I wait for 3 seconds

  @RIA-6104-pay-and-submit-pba-successful @RIA-6104-pay-and-submit-pba-successful-hu
  Scenario: Pay and submit appeal - successful payment (HU appeal type)
    And I select `PBA0087535` for the ` Select a PBA ` field
    And I type `Unique Reference` for the ` Enter a reference for your PBA account statements ` field
    And I click the `Confirm payment` button
    And I wait for 5 seconds
    Then I should see the text `Payment successful`
    When I click the `View service requests` link
    Then I should see the text `Paid`
    And I should see the text `Jose Gonzalez`

    When I click the `Overview` tab
    Then I should only see the `progress_legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the text `You have submitted your appeal. A Tribunal Caseworker will now review your appeal.`

    When I click the `Appeal` tab
    Then I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Paid` for the `Payment status` field

  @RIA-6104-pay-and-submit-pba-failed @RIA-6104-pay-and-submit-pba-failed-hu
  Scenario: Pay and submit appeal - failed payment (HU appeal type)
    And I select `PBA0083333` for the ` Select a PBA ` field
    And I type `Unique Reference` for the ` Enter a reference for your PBA account statements ` field
    And I click the `Confirm payment` button
    And I wait for 5 seconds
    Then I should see the text `Sorry, there is a problem with the service`

  @RIA-6104-pay-and-submit-pba-failed @RIA-6104-pay-and-submit-pba-failed-hu-2
  Scenario: Pay and submit appeal - failed payment 2 (HU appeal type)

    And I select `PBA0080000` for the ` Select a PBA ` field
    And I type `Unique Reference` for the ` Enter a reference for your PBA account statements ` field
    And I click the `Confirm payment` button
    And I wait for 5 seconds
    Then I should see the text `Sorry, there is a problem with the service`
