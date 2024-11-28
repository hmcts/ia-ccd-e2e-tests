Feature: Manage fee update

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case

  @dlrm-manage-a-fee-update @dlrm-manage-a-fee-update-decisionchange-refund @appeal-nightly-test
  Scenario: Admin officer manage fee update for decision type changed refund

    When I save my initial `EA` appeal type with `a remission` and `with` hearing fee
    Then I submit my nonpayment appeal

    And I switch to be a `Admin Officer`
    And I record remission decision as partially approved
    And I mark the appeal as paid

    When I switch to be a `Admin Officer`
    Then I select the `Manage a fee update` Next step
    And The page is accessible
    And I should see the `Reason for update` page
    And I should see the text `What is the reason for the fee update?`
    And I select `Decision type changed` for the `What is the reason for the fee update?` field
    And I click the `Continue` button
    And The page is accessible
    And I select `Decision without a hearing. The fee for this type of appeal is £80` for the `How do you want the appeal to be decided?` field
    And I click the `Continue` button

    And I type `80` for the `Enter new appeal fee amount` field
    And I click the `Continue` button
    And The page is accessible
    And I select `The appellant should receive a refund` for the `Select the action the Tribunal needs to take as a result of this fee update` field
    And I type `60` for the `Amount to be refunded` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Decision type changed` in the `What is the reason for the fee update?` field
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` in the `How do you want the appeal to be decided?` field
    And I should see `£80.00` in the `Enter new appeal fee amount` field
    And I should see `The appellant should receive a refund` in the `Select the action the Tribunal needs to take as a result of this fee update` field
    And I should see `£60.00` in the `Amount to be refunded` field
    And I click the `Submit` button

    Then I should see the text `You have recorded a fee update`
    And I should see the text `What happens next`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    And I select the `Refund confirmation` Next step
    And The page is accessible
    And I should see the text `Refund confirmation`
    And The page is accessible
    And I click the `Continue` button
    Then I should see the text `Refund request completed`
    And The page is accessible
    And I click the `Close and Return to case details` button if present

    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£80.00` for the `New fee amount` field
    And I should see `£60.00` for the `Amount to be refunded` field

    When I switch to be a `Case Officer`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£80.00` for the `New fee amount` field
    And I should see `£60.00` for the `Amount to be refunded` field

    When I switch to be a `Legal Org User Rep A`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£80.00` for the `New fee amount` field
    And I should see `£60.00` for the `Amount to be refunded` field

  @dlrm-manage-a-fee-update @dlrm-manage-a-fee-update-decisionchange-additionalamount @appeal-nightly-test
  Scenario: Admin officer manage fee update for decision type changed additionalAmount

    When I save my initial `EA` appeal type with `a remission` and `with` hearing fee
    Then I submit my nonpayment appeal

    And I switch to be a `Admin Officer`
    And I record remission decision as partially approved
    And I mark the appeal as paid

    When I switch to be a `Admin Officer`
    Then I select the `Manage a fee update` Next step
    And The page is accessible
    And I should see the `Reason for update` page
    And I should see the text `What is the reason for the fee update?`
    And I select `Decision type changed` for the `What is the reason for the fee update?` field
    And I click the `Continue` button
    And The page is accessible
    And I select `Decision without a hearing. The fee for this type of appeal is £80` for the `How do you want the appeal to be decided?` field
    And I click the `Continue` button

    And The page is accessible
    And I type `80` for the `Enter new appeal fee amount` field
    And I click the `Continue` button
    And I select `The appellant needs to make an additional payment` for the `Select the action the Tribunal needs to take as a result of this fee update` field
    And I type `60` for the `Amount to be requested` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Decision type changed` in the `What is the reason for the fee update?` field
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` in the `How do you want the appeal to be decided?` field
    And I should see `£80.00` in the `Enter new appeal fee amount` field
    And I should see `The appellant needs to make an additional payment` in the `Select the action the Tribunal needs to take as a result of this fee update` field
    And I should see `£60.00` in the `Amount to be requested` field
    And I click the `Submit` button

    Then I should see the text `You have recorded a fee update`
    And I should see the text `What happens next`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£80.00` for the `New fee amount` field
    And I should see `£60.00` for the `Additional payment requested` field

    When I switch to be a `Case Officer`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£80.00` for the `New fee amount` field
    And I should see `£60.00` for the `Additional payment requested` field

    When I switch to be a `Legal Org User Rep A`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£80.00` for the `New fee amount` field
    And I should see `£60.00` for the `Additional payment requested` field

  @dlrm-manage-a-fee-update @dlrm-manage-a-fee-update-feeremissionchanged @appeal-nightly-test
  Scenario: Admin officer manage fee update for fee remission changed

    When I save my initial PA appeal type with a remission and with hearing fee
    Then I submit my nonpayment appeal

    And I switch to be a `Admin Officer`
    And I record remission decision as partially approved
    And I mark the appeal as paid

    When I switch to be a `Admin Officer`
    Then I select the `Manage a fee update` Next step
    And I should see the `Reason for update` page
    And I should see the text `What is the reason for the fee update?`
    And I select `Fee remission changed` for the `What is the reason for the fee update?` field
    And I click the `Continue` button

    And I type `80` for the `Enter new appeal fee amount` field
    And I click the `Continue` button
    And I select `The appellant needs to make an additional payment` for the `Select the action the Tribunal needs to take as a result of this fee update` field
    And I type `60` for the `Amount to be requested` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Fee remission changed` in the `What is the reason for the fee update?` field
    And I should see `£80.00` in the `Enter new appeal fee amount` field
    And I should see `The appellant needs to make an additional payment` in the `Select the action the Tribunal needs to take as a result of this fee update` field
    And I should see `£60.00` in the `Amount to be requested` field
    And I click the `Submit` button

    Then I should see the text `You have recorded a fee update`
    And I should see the text `What happens next`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Fee remission changed` for the `Reason for fee update` field
    And I should see `£80.00` for the `New fee amount` field
    And I should see `£60.00` for the `Additional payment requested` field

    When I switch to be a `Case Officer`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Fee remission changed` for the `Reason for fee update` field
    And I should see `£80.00` for the `New fee amount` field
    And I should see `£60.00` for the `Additional payment requested` field

    When I switch to be a `Legal Org User Rep A`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Fee remission changed` for the `Reason for fee update` field
    And I should see `£80.00` for the `New fee amount` field
    And I should see `£60.00` for the `Additional payment requested` field

  @dlrm-manage-a-fee-update @dlrm-manage-a-fee-update-appealnotvalid @appeal-nightly-test
  Scenario: Admin officer manage fee update for appeal not valid

    When I save my initial PA appeal type with a remission and with hearing fee
    Then I submit my nonpayment appeal

    And I switch to be a `Admin Officer`
    And I record remission decision as partially approved
    And I mark the appeal as paid

    When I switch to be a `Admin Officer`
    Then I select the `Manage a fee update` Next step
    And I should see the `Reason for update` page
    And I should see the text `What is the reason for the fee update?`
    And I select `Appeal not valid` for the `What is the reason for the fee update?` field
    And I click the `Continue` button

    And I type `0` for the `Enter new appeal fee amount` field
    And I click the `Continue` button
    And I select `The appellant should receive a refund` for the `Select the action the Tribunal needs to take as a result of this fee update` field
    And I type `60` for the `Amount to be refunded` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Appeal not valid` in the `What is the reason for the fee update?` field
    And I should see `£0.00` in the `Enter new appeal fee amount` field
    And I should see `The appellant should receive a refund` in the `Select the action the Tribunal needs to take as a result of this fee update` field
    And I should see `£60.00` in the `Amount to be refunded` field
    And I click the `Submit` button

    Then I should see the text `You have recorded a fee update`
    And I should see the text `What happens next`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Appeal not valid` for the `Reason for fee update` field
    And I should see `£0.00` for the `New fee amount` field
    And I should see `£60.00` for the `Amount to be refunded` field

    When I switch to be a `Case Officer`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Appeal not valid` for the `Reason for fee update` field
    And I should see `£0.00` for the `New fee amount` field
    And I should see `£60.00` for the `Amount to be refunded` field

    When I switch to be a `Legal Org User Rep A`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Appeal not valid` for the `Reason for fee update` field
    And I should see `£0.00` for the `New fee amount` field
    And I should see `£60.00` for the `Amount to be refunded` field