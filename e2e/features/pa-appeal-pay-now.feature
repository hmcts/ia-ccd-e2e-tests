Feature: Legal rep decides payment method payNow and saves appeal (PA appeal types)

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case

    When I save my initial PA appeal type with hearing fee

  @save-pa-appeal-type-payNow-submit-check-error @RIA-3498
  Scenario: Decide pay and submit for PA appeal type but try to submit without payment.

    Then I should not see the `Submit your appeal` link
    And  I select the `Submit your appeal` Next step
    And I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `The Submit your appeal option is not available. Select Pay and submit to submit the appeal`
