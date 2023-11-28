Feature: Duplicate payment error handling

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case

  @Pay-and-submit-event-with-pay-offline-option-un-submitted-EA @RIA-3574 @RIA-3014
  Scenario: Select pay and submit event with pay later option chosen

    When I save my initial EA appeal type with no remission and with hearing fee and pay offline

    And I click the `Overview` tab
    And I select the `Pay and submit` Next step
    Then I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `Errors`
    And I should see the text `The Pay for and submit your appeal option is not available. Select Submit your appeal if you want to submit the appeal now.`

  @Pay-and-submit-event-with-pay-offline-option-un-submitted-HU @RIA-3574 @RIA-3014
  Scenario: Select pay and submit event with pay later option chosen

    When I save my initial HU appeal type with no remission and with hearing fee and pay offline

    And I click the `Overview` tab
    And I select the `Pay and submit` Next step
    Then I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `Errors`
    And I should see the text `The Pay for and submit your appeal option is not available. Select Submit your appeal if you want to submit the appeal now.`

  @Pay-and-submit-event-with-pay-offline-option-un-submitted-PA @RIA-3574 @RIA-3014
  Scenario: Select pay and submit event with pay later option chosen

    When I save my initial PA appeal type with no remission and with hearing fee and pay offline

    And I click the `Overview` tab
    And I select the `Pay and submit` Next step
    Then I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `Errors`
    And I should see the text `The Pay for and submit your appeal option is not available. Select Submit your appeal if you want to submit the appeal now.`


  @Make-a-payment-event-with-pay-offline-option-submitted-PA @RIA-3574
  Scenario: Select pay and submit event with pay later option chosen

    When I save my initial PA appeal type with no remission and with hearing fee and pay offline
    And I submit my nonpayment appeal

    Then I click the `Overview` tab
    And I select the `Make a payment` Next step
    Then I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `Errors`
    And I should see the text `The Make a payment option is not available.`


  @Pay-and-submit-event-with-pay-later-option-un-submitted-PA @RIA-3574
  Scenario: Select pay and submit event with pay later option chosen

    When I save my initial PA appeal type with no remission and with hearing fee and pay later

    And I select the `Pay and submit` Next step
    Then I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `Errors`
    And I should see the text `The Pay for and submit your appeal option is not available. Select Submit your appeal if you want to submit the appeal now.`

  @Make-a-payment-event-with-pay-later-option-submitted-PA @RIA-3574
  Scenario: Select pay and submit event with pay later option chosen

    When I save my initial PA appeal type with no remission and with hearing fee and pay later
    And I submit my nonpayment appeal

    When I select the `Make a payment` Next step
    Then I should see the `Make a payment` page
    And I should see the text `The fee for an appeal with a hearing is £140`
    And I should see the text `Can’t see your Payment by Account number?`
    And I should see the `MyHMCTSsupport@justice.gov.uk` link
    And I select `PBA0087412` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button

    When I click the `Pay now` button
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Make a payment`

    Then I click the `Overview` tab
    And I select the `Make a payment` Next step
    And I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `Errors`
    And I should see the text `The Make a payment option is not available.`

  @Pay-and-submit-event-with-pay-now-option-EA @RIA-3574
  Scenario: Select pay and submit event with pay later option chosen

    When I save my initial EA appeal type with no remission and with hearing fee

    And I click the `Overview` tab
    And I select the `Pay and submit` Next step
    And I should see the text `The fee for an appeal with a hearing is £140`
    And I should see the text `Can’t see your Payment by Account number?`
    And I should see the `MyHMCTSsupport@justice.gov.uk` link
    And I select `PBA0087412` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button

    And I click the `I the representative am giving notice of appeal in accordance with the appellant's instructions and the appellant has confirmed to me they believe that the facts stated in this appeal form are true.` label
    And I click the `Continue` button

    When I click the `Pay and submit now` button
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    And I should see an alert confirming the case `has been updated with event: Pay and submit`

    When I select the `Make a payment` Next step
    And I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `Errors`
    And I should see the text `The Make a payment option is not available.`

  @Pay-and-submit-event-with-pay-now-option-HU @RIA-3574
  Scenario: Select pay and submit event with pay later option chosen

    When I save my initial HU appeal type with no remission and with hearing fee

    And I click the `Overview` tab
    And I select the `Pay and submit` Next step
    And I should see the text `The fee for an appeal with a hearing is £140`
    And I should see the text `Can’t see your Payment by Account number?`
    And I should see the `MyHMCTSsupport@justice.gov.uk` link
    And I select `PBA0087412` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button

    And I click the `I the representative am giving notice of appeal in accordance with the appellant's instructions and the appellant has confirmed to me they believe that the facts stated in this appeal form are true.` label
    And I click the `Continue` button

    When I click the `Pay and submit now` button
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    And I should see an alert confirming the case `has been updated with event: Pay and submit`

    When I select the `Make a payment` Next step
    And I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `Errors`
    And I should see the text `The Make a payment option is not available.`
