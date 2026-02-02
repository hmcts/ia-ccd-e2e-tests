Feature: Pay and submit appeal by PBA - successful and failed payments (HU appeal type)

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
    When I click the `Pay fee using Payment by Account (PBA)` label
    And I wait for 1 seconds

  @RIA-6104-pay-and-submit-pba-successful @RIA-6104-pay-and-submit-pba-successful-hu @appeal-nightly-test
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
