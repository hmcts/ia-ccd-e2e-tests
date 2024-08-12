Feature: Manage fee update

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case

  @Case-officer-manage-fee-update-pay-now @RIA-3792 @RIA-3790
  Scenario: Case officer manage fee update

    Then I save my initial `EA` appeal type with `no remission` and `with` hearing fee
    And I pay for and submit my appeal by PBA for a non PA appeal type

    When I switch to be a `Case Officer`
    Then I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I select `Decision type changed` for the `Reason for fee update` field
    And I type `10` for the `New fee amount` field
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the first `Fee update recorded` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Decision type changed` in the `Reason for fee update` field
    And I should see `£10.00` in the `New fee amount` field
    And I should see `Fee update recorded` in the `Fee update status` field
    And I click the `Submit` button

    Then I should see the text `You have recorded a fee update`
    And I should see the text `What happens next`
    And I should see the text `The appropriate team will be notified to review the fee update and take the next steps.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see `Fee update recorded` for the `Completed stages` field

    When I switch to be a `Admin Officer`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see `Fee update recorded` for the `Completed stages` field

    When I switch to be a `Judge`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see `Fee update recorded` for the `Completed stages` field

    When I switch to be a `Legal Rep`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field

    When I switch to be a `Home Office APC`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field

    When I switch to be a `Home Office LART`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field

    When I switch to be a `Home Office POU`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field

    When I switch to be a `Home Office Generic`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field


  @Case-officer-manage-fee-update-pay-offline @RIA-3792 @RIA-3790
  Scenario: Case officer manage fee update

    Then I save my initial `EA` appeal type with `no remission` and pay offline `with` hearing fee
    And I submit my nonpayment appeal

    When I switch to be a `Admin Officer`
    Then I mark the appeal as paid

    When I switch to be a `Case Officer`
    Then I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I select `Decision type changed` for the `Reason for fee update` field
    And I type `10` for the `New fee amount` field
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the first `Fee update recorded` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Decision type changed` in the `Reason for fee update` field
    And I should see `£10.00` in the `New fee amount` field
    And I should see `Fee update recorded` in the `Fee update status` field
    And I click the `Submit` button

    Then I should see the text `You have recorded a fee update`
    And I should see the text `What happens next`
    And I should see the text `The appropriate team will be notified to review the fee update and take the next steps.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see `Fee update recorded` for the `Completed stages` field

    When I switch to be a `Admin Officer`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see `Fee update recorded` for the `Completed stages` field

    When I switch to be a `Judge`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see `Fee update recorded` for the `Completed stages` field

  @Case-officer-manage-fee-update-appeal-not-valid @RIA-3793
  Scenario: Case officer manage fee update

    Then I save my initial `PA` appeal type with `no remission` and pay offline `with` hearing fee
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Rep`
    And I build my case
    And I submit my case

    When I switch to be a `Admin Officer`
    Then I mark the appeal as paid

    When I switch to be a `Case Officer`
    Then I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I select `Appeal not valid` for the `Reason for fee update` field
    And I type `0` for the `New fee amount` field
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the first `Fee update recorded` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Appeal not valid` in the `Reason for fee update` field
    And I should see `£0.00` in the `New fee amount` field
    And I should see `Fee update recorded` in the `Fee update status` field
    And I click the `Submit` button

    Then I should see the text `You have recorded a fee update`
    And I should see the text `What happens next`
    And I should see the text `The appropriate team will be notified to review the fee update and take the next steps.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Appeal not valid` for the `Reason for fee update` field
    And I should see `£0.00` for the `New fee amount` field
    And I should see `Fee update recorded` for the `Completed stages` field

    When I switch to be a `Admin Officer`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Appeal not valid` for the `Reason for fee update` field
    And I should see `£0.00` for the `New fee amount` field
    And I should see `Fee update recorded` for the `Completed stages` field

    When I switch to be a `Judge`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Appeal not valid` for the `Reason for fee update` field
    And I should see `£0.00` for the `New fee amount` field
    And I should see `Fee update recorded` for the `Completed stages` field

  @Case-officer-manage-fee-update-ended-state @RIA-3793
  Scenario: Case officer manage fee update

    When I save my initial PA appeal type with no remission and with hearing fee
    Then I pay for and submit my appeal by PBA for a PA appeal type

    And I switch to be a `Case Officer`
    And I end the appeal

    When I switch to be a `Case Officer`
    Then I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I select `Appeal not valid` for the `Reason for fee update` field
    And I type `0` for the `New fee amount` field
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the first `Fee update recorded` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Appeal not valid` in the `Reason for fee update` field
    And I should see `£0.00` in the `New fee amount` field
    And I should see `Fee update recorded` in the `Fee update status` field
    And I click the `Submit` button

    Then I should see the text `You have recorded a fee update`
    And I should see the text `What happens next`
    And I should see the text `The appropriate team will be notified to review the fee update and take the next steps.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Appeal not valid` for the `Reason for fee update` field
    And I should see `£0.00` for the `New fee amount` field
    And I should see `Fee update recorded` for the `Completed stages` field

    When I switch to be a `Admin Officer`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Appeal not valid` for the `Reason for fee update` field
    And I should see `£0.00` for the `New fee amount` field
    And I should see `Fee update recorded` for the `Completed stages` field

    When I switch to be a `Judge`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Appeal not valid` for the `Reason for fee update` field
    And I should see `£0.00` for the `New fee amount` field
    And I should see `Fee update recorded` for the `Completed stages` field

    When I switch to be a `Legal Rep`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Appeal not valid` for the `Reason for fee update` field
    And I should see `£0.00` for the `New fee amount` field

    When I switch to be a `Home Office APC`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Appeal not valid` for the `Reason for fee update` field
    And I should see `£0.00` for the `New fee amount` field

    When I switch to be a `Home Office LART`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field

    When I switch to be a `Home Office APC`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field

    When I switch to be a `Home Office Generic`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field

  @Manage-fee-update-for-dc-appeal @RIA-3792
  Scenario: Case officer manage fee update for dc appeal

    Then I save my initial `DC` appeal for nonPayment `with` hearing
    And I submit my nonpayment appeal

    When I switch to be a `Case Officer`
    Then I select the `Manage a fee update` Next step
    And I should see the text `You cannot manage a fee update for this appeal`

  @Case-officer-manage-fee-update-fee-remission-changed @RIA-3794
  Scenario: Case officer manage fee update for fee remission changed

    When I save my initial PA appeal type with a remission and with hearing fee
    Then I submit my nonpayment appeal

    And I switch to be a `Admin Officer`
    And I record remission decision as partially approved
    And I mark the appeal as paid

    When I switch to be a `Case Officer`
    Then I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I select `Fee remission changed` for the `Reason for fee update` field
    And I type `10` for the `New fee amount` field
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the first `Fee update recorded` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Fee remission changed` in the `Reason for fee update` field
    And I should see `£10.00` in the `New fee amount` field
    And I should see `Fee update recorded` in the `Fee update status` field
    And I click the `Submit` button

    Then I should see the text `You have recorded a fee update`
    And I should see the text `What happens next`
    And I should see the text `The appropriate team will be notified to review the fee update and take the next steps.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Fee remission changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field

    When I switch to be a `Admin Officer`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Fee remission changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field

    When I switch to be a `Legal Rep`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Fee remission changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field

  @Admin-officer-manage-fee-update-fee-remission-changed @RIA-3794
  Scenario: Case officer manage fee update for fee remission changed

    When I save my initial PA appeal type with a remission and with hearing fee
    Then I submit my nonpayment appeal

    And I switch to be a `Admin Officer`
    And I record remission decision as partially approved
    And I mark the appeal as paid

    When I switch to be a `Admin Officer`
    Then I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I select `Fee remission changed` for the `Reason for fee update` field
    And I type `10` for the `New fee amount` field
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the first `Fee update recorded` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Fee remission changed` in the `Reason for fee update` field
    And I should see `£10.00` in the `New fee amount` field
    And I should see `Fee update recorded` in the `Fee update status` field
    And I click the `Submit` button

    Then I should see the text `You have recorded a fee update`
    And I should see the text `What happens next`
    And I should see the text `The appropriate team will be notified to review the fee update and take the next steps.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Fee remission changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field

    When I switch to be a `Case Officer`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Fee remission changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field

    When I switch to be a `Legal Rep`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Fee remission changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field

  @Admin-officer-manage-fee-update-refund-approved-refund-instructed-additional-fee @RIA-3795 @RIA-3813 @RIA-3814
  Scenario: Admin officer manage fee update refund approved, refund instructed and additional fee requested

    And I save my initial EA appeal type without remission and with hearing fee and pay now
    # And I click the `Close and Return to case details` button if present
    And I pay for and submit my appeal by Card for a non PA appeal type

    When I switch to be a `Case Officer`
    Then I select the `Manage a fee update` Next step
    And I should see the `Reason for update` page
    And I should see the text `What is the reason for the fee update?`
    And I select `Decision type changed` for the `What is the reason for the fee update?` field
    And I click the `Continue` button
    And I type `130` for the `Enter new appeal fee amount` field
    And I click the `Continue` button

    Then I should see the text `Select the action the Tribunal needs to take as a result of this fee update`
    And I select `The appellant should receive a refund` for `Select the action the Tribunal needs to take as a result of this fee update` field
    And I type `10` for the `Amount to be refunded` field
    And I click the `Continue` button

    # Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    # And I click the first `Fee update recorded` label
    # And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Decision type changed` in the `What is the reason for the fee update?` field
    And I should see `£130.00` in the `Enter new appeal fee amount` field
    And I should see `The appellant should receive a refund` in the `Select the action the Tribunal needs to take as a result of this fee update` field
    And I should see `£10.00` in the `Amount to be refunded` field
    And I click the `Submit` button

    Then I should see the text `You have recorded a fee update`
    And I should see the text `What happens next`
    And I should see the text `The appropriate team will be notified to review the fee update and take the next steps.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£130.00` for the `New fee amount` field
    And I should see `£10.00` for the `Amount to be refunded` field

    When I switch to be a `Admin Officer`
    Then I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the `Refund approved` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Decision type changed` in the `Reason for fee update` field
    And I should see `£10.00` in the `New fee amount` field
    And I should see `Fee update recorded` in the `Fee update status` field
    And I should see the text `Refund approved`
    And I click the `Submit` button

    Then I should see the text `You have progressed a fee update`
    And I should see the text `What happens next`
    And I should see the text `If you have recorded that a refund has been approved, you must now instruct the refund.`
    And I should see the text `If you have recorded that an additional fee has been requested, the legal representative will be instructed to pay the fee.`
    And I should see the text `If you have recorded that no fee update is required, you need to contact the legal representative and tell them why the fee update is no longer required.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Refund approved`

    When I switch to be a `Case Officer`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Refund approved`

    When I switch to be a `Judge`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Refund approved`

    When I switch to be a `Admin Officer`
    Then I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the `Refund instructed` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Decision type changed` in the `Reason for fee update` field
    And I should see `£10.00` in the `New fee amount` field
    And I should see `Fee update recorded` in the `Fee update status` field
    And I should see the text `Refund approved`
    And I should see the text `Refund instructed`
    And I click the `Submit` button

    Then I should see the text `You have marked the refund as instructed`
    And I should see the text `What happens next`
    And I should see the text `The legal representative will be notified that the refund has been instructed.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Refund approved`
    And I should see the text `Refund instructed`

    When I switch to be a `Case Officer`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Refund approved`
    And I should see the text `Refund instructed`

    When I switch to be a `Judge`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Refund approved`
    And I should see the text `Refund instructed`

    When I switch to be a `Admin Officer`
    Then I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the `Additional fee requested` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Decision type changed` in the `Reason for fee update` field
    And I should see `£10.00` in the `New fee amount` field
    And I should see `Fee update recorded` in the `Fee update status` field
    And I should see the text `Refund approved`
    And I should see the text `Refund instructed`
    And I should see the text `Additional fee requested`
    And I click the `Submit` button

    Then I should see the text `You have progressed a fee update`
    And I should see the text `What happens next`
    And I should see the text `If you have recorded that a refund has been approved, you must now instruct the refund.`
    And I should see the text `If you have recorded that an additional fee has been requested, the legal representative will be instructed to pay the fee.`
    And I should see the text `If you have recorded that no fee update is required, you need to contact the legal representative and tell them why the fee update is no longer required.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Refund approved`
    And I should see the text `Refund instructed`
    And I should see the text `Additional fee requested`

    When I switch to be a `Case Officer`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Refund approved`
    And I should see the text `Refund instructed`
    And I should see the text `Additional fee requested`

    When I switch to be a `Judge`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Refund approved`
    And I should see the text `Refund instructed`
    And I should see the text `Additional fee requested`

  @Admin-officer-manage-fee-update-additional-fee-requested @RIA-3795
  Scenario: Admin officer manage fee update additional fee requested

    Then I save my initial `EA` appeal type with `no remission` and `with` hearing fee
    And I pay for and submit my appeal by PBA for a non PA appeal type

    When I switch to be a `Case Officer`
    Then I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I select `Decision type changed` for the `Reason for fee update` field
    And I type `10` for the `New fee amount` field
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the first `Fee update recorded` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Decision type changed` in the `Reason for fee update` field
    And I should see `£10.00` in the `New fee amount` field
    And I should see `Fee update recorded` in the `Fee update status` field
    And I click the `Submit` button

    Then I should see the text `You have recorded a fee update`
    And I should see the text `What happens next`
    And I should see the text `The appropriate team will be notified to review the fee update and take the next steps.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see `Fee update recorded` for the `Completed stages` field

    When I switch to be a `Admin Officer`
    Then I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the `Additional fee requested` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Decision type changed` in the `Reason for fee update` field
    And I should see `£10.00` in the `New fee amount` field
    And I should see `Fee update recorded` in the `Fee update status` field
    And I should see the text `Additional fee requested`
    And I click the `Submit` button

    Then I should see the text `You have progressed a fee update`
    And I should see the text `What happens next`
    And I should see the text `If you have recorded that a refund has been approved, you must now instruct the refund.`
    And I should see the text `If you have recorded that an additional fee has been requested, the legal representative will be instructed to pay the fee.`
    And I should see the text `If you have recorded that no fee update is required, you need to contact the legal representative and tell them why the fee update is no longer required.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Additional fee requested`

    When I switch to be a `Case Officer`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Additional fee requested`

    When I switch to be a `Judge`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Additional fee requested`

  @Admin-officer-manage-fee-update-not-required @RIA-3795
  Scenario: Admin officer manage fee update not required

    Then I save my initial `EA` appeal type with `no remission` and `with` hearing fee
    And I pay for and submit my appeal by PBA for a non PA appeal type

    When I switch to be a `Case Officer`
    Then I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I select `Decision type changed` for the `Reason for fee update` field
    And I type `10` for the `New fee amount` field
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the first `Fee update recorded` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Decision type changed` in the `Reason for fee update` field
    And I should see `£10.00` in the `New fee amount` field
    And I should see `Fee update recorded` in the `Fee update status` field
    And I click the `Submit` button

    Then I should see the text `You have recorded a fee update`
    And I should see the text `What happens next`
    And I should see the text `The appropriate team will be notified to review the fee update and take the next steps.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see `Fee update recorded` for the `Completed stages` field

    When I switch to be a `Admin Officer`
    Then I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the `Fee update not required` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Decision type changed` in the `Reason for fee update` field
    And I should see `£10.00` in the `New fee amount` field
    And I should see `Fee update recorded` in the `Fee update status` field
    And I should see the text `Fee update not required`
    And I click the `Submit` button

    Then I should see the text `You have progressed a fee update`
    And I should see the text `What happens next`
    And I should see the text `If you have recorded that a refund has been approved, you must now instruct the refund.`
    And I should see the text `If you have recorded that an additional fee has been requested, the legal representative will be instructed to pay the fee.`
    And I should see the text `If you have recorded that no fee update is required, you need to contact the legal representative and tell them why the fee update is no longer required.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Fee update not required`

    When I switch to be a `Case Officer`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Fee update not required`

    When I switch to be a `Judge`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Fee update not required`

  @Admin-officer-manage-fee-update-refund-approved-fee-update-not-required @RIA-3813 @RIA-3880
  Scenario: Admin officer manage fee update refund approved and fee update not required

    Then I save my initial `EA` appeal type with `no remission` and `with` hearing fee
    And I pay for and submit my appeal by PBA for a non PA appeal type

    When I switch to be a `Case Officer`
    Then I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I select `Decision type changed` for the `Reason for fee update` field
    And I type `10` for the `New fee amount` field
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the first `Fee update recorded` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Decision type changed` in the `Reason for fee update` field
    And I should see `£10.00` in the `New fee amount` field
    And I should see `Fee update recorded` in the `Fee update status` field
    And I click the `Submit` button

    Then I should see the text `You have recorded a fee update`
    And I should see the text `What happens next`
    And I should see the text `The appropriate team will be notified to review the fee update and take the next steps.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see `Fee update recorded` for the `Completed stages` field

    When I switch to be a `Admin Officer`
    Then I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the `Refund approved` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Decision type changed` in the `Reason for fee update` field
    And I should see `£10.00` in the `New fee amount` field
    And I should see `Fee update recorded` in the `Fee update status` field
    And I should see the text `Refund approved`
    And I click the `Submit` button

    Then I should see the text `You have progressed a fee update`
    And I should see the text `What happens next`
    And I should see the text `If you have recorded that a refund has been approved, you must now instruct the refund.`
    And I should see the text `If you have recorded that an additional fee has been requested, the legal representative will be instructed to pay the fee.`
    And I should see the text `If you have recorded that no fee update is required, you need to contact the legal representative and tell them why the fee update is no longer required.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Refund approved`

    When I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the `Fee update not required` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Decision type changed` in the `Reason for fee update` field
    And I should see `£10.00` in the `New fee amount` field
    And I should see `Fee update recorded` in the `Fee update status` field
    And I should see the text `Refund approved`
    And I should see the text `Fee update not required`
    And I click the `Submit` button

    Then I should see the text `You have progressed a fee update`
    And I should see the text `What happens next`
    And I should see the text `If you have recorded that a refund has been approved, you must now instruct the refund.`
    And I should see the text `If you have recorded that an additional fee has been requested, the legal representative will be instructed to pay the fee.`
    And I should see the text `If you have recorded that no fee update is required, you need to contact the legal representative and tell them why the fee update is no longer required.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Refund approved`
    And I should see the text `Fee update not required`

    When I switch to be a `Case Officer`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Refund approved`
    And I should see the text `Fee update not required`

    When I switch to be a `Judge`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Refund approved`
    And I should see the text `Fee update not required`

    When I switch to be a `Admin Officer`
    Then I select the `Manage a fee update` Next step
    Then I should see the text `You can no longer manage a fee update for this appeal because a fee update has been recorded as not required.`


  @Admin-officer-manage-fee-update-refund-approved-refund-instructed-fee-update-not-required @RIA-3814
  Scenario: Admin officer manage fee update refund approved,refund instructed and fee update not required

    Then I save my initial `EA` appeal type with `no remission` and `with` hearing fee
    And I pay for and submit my appeal by PBA for a non PA appeal type

    When I switch to be a `Case Officer`
    Then I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I select `Decision type changed` for the `Reason for fee update` field
    And I type `10` for the `New fee amount` field
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the first `Fee update recorded` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Decision type changed` in the `Reason for fee update` field
    And I should see `£10.00` in the `New fee amount` field
    And I should see `Fee update recorded` in the `Fee update status` field
    And I click the `Submit` button

    Then I should see the text `You have recorded a fee update`
    And I should see the text `What happens next`
    And I should see the text `The appropriate team will be notified to review the fee update and take the next steps.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see `Fee update recorded` for the `Completed stages` field

    When I switch to be a `Admin Officer`
    Then I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the `Refund approved` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Decision type changed` in the `Reason for fee update` field
    And I should see `£10.00` in the `New fee amount` field
    And I should see `Fee update recorded` in the `Fee update status` field
    And I should see the text `Refund approved`
    And I click the `Submit` button

    Then I should see the text `You have progressed a fee update`
    And I should see the text `What happens next`
    And I should see the text `If you have recorded that a refund has been approved, you must now instruct the refund.`
    And I should see the text `If you have recorded that an additional fee has been requested, the legal representative will be instructed to pay the fee.`
    And I should see the text `If you have recorded that no fee update is required, you need to contact the legal representative and tell them why the fee update is no longer required.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Refund approved`

    When I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the `Refund instructed` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Decision type changed` in the `Reason for fee update` field
    And I should see `£10.00` in the `New fee amount` field
    And I should see `Fee update recorded` in the `Fee update status` field
    And I should see the text `Refund approved`
    And I should see the text `Refund instructed`
    And I click the `Submit` button

    Then I should see the text `You have marked the refund as instructed`
    And I should see the text `What happens next`
    And I should see the text `The legal representative will be notified that the refund has been instructed.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Refund approved`
    And I should see the text `Refund instructed`

    When I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the `Fee update not required` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Decision type changed` in the `Reason for fee update` field
    And I should see `£10.00` in the `New fee amount` field
    And I should see `Fee update recorded` in the `Fee update status` field
    And I should see the text `Refund approved`
    And I should see the text `Refund instructed`
    And I should see the text `Fee update not required`
    And I click the `Submit` button

    Then I should see the text `You have progressed a fee update`
    And I should see the text `What happens next`
    And I should see the text `If you have recorded that a refund has been approved, you must now instruct the refund.`
    And I should see the text `If you have recorded that an additional fee has been requested, the legal representative will be instructed to pay the fee.`
    And I should see the text `If you have recorded that no fee update is required, you need to contact the legal representative and tell them why the fee update is no longer required.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Refund approved`
    And I should see the text `Refund instructed`
    And I should see the text `Fee update not required`

    When I switch to be a `Case Officer`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Refund approved`
    And I should see the text `Refund instructed`
    And I should see the text `Fee update not required`

    When I switch to be a `Judge`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Refund approved`
    And I should see the text `Refund instructed`
    And I should see the text `Fee update not required`

  @Admin-officer-journey-choose-fee-update-not-required-after-additional-fee-required @RIA-3882
  Scenario: Admin officer journey chooses fee update not required after additional fee required

    Then I save my initial `EA` appeal type with `no remission` and `with` hearing fee
    And I pay for and submit my appeal by PBA for a non PA appeal type

    When I switch to be a `Admin Officer`
    Then I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I select `Decision type changed` for the `Reason for fee update` field
    And I type `10` for the `New fee amount` field
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the first `Fee update recorded` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Decision type changed` in the `Reason for fee update` field
    And I should see `£10.00` in the `New fee amount` field
    And I should see `Fee update recorded` in the `Fee update status` field
    And I click the `Submit` button

    Then I should see the text `You have recorded a fee update`
    And I should see the text `What happens next`
    And I should see the text `The appropriate team will be notified to review the fee update and take the next steps.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the first `Additional fee requested` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Decision type changed` in the `Reason for fee update` field
    And I should see `£10.00` in the `New fee amount` field
    And I should see `Fee update recorded` in the `Fee update status` field
    And I should see the text `Additional fee requested`
    And I click the `Submit` button

    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the first `Fee update not required` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Decision type changed` in the `Reason for fee update` field
    And I should see `£10.00` in the `New fee amount` field
    And I should see `Fee update recorded` in the `Fee update status` field
    And I should see the text `Additional fee requested`
    And I should see the text `Fee update not required`
    And I click the `Submit` button

    Then I should see the text `You have progressed a fee update`
    And I should see the text `What happens next`
    And I should see the text `If you have recorded that a refund has been approved, you must now instruct the refund.`
    And I should see the text `If you have recorded that an additional fee has been requested, the legal representative will be instructed to pay the fee.`
    And I should see the text `If you have recorded that no fee update is required, you need to contact the legal representative and tell them why the fee update is no longer required.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Additional fee requested`
    And I should see the text `Fee update not required`

    Then I switch to be a `Case Officer`
    And I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Additional fee requested`
    And I should see the text `Fee update not required`

    Then I switch to be a `Judge`
    And I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Decision type changed` for the `Reason for fee update` field
    And I should see `£10.00` for the `New fee amount` field
    And I should see the text `Fee update recorded`
    And I should see the text `Additional fee requested`
    And I should see the text `Fee update not required`

  @Admin-officer-journey-choose-refund-approved-after-additional-fee-required @RIA-3882
  Scenario: Admin officer selects refund approved after additional fee requested

    Then I save my initial `EA` appeal type with `no remission` and `with` hearing fee
    And I pay for and submit my appeal by PBA for a non PA appeal type

    When I switch to be a `Admin Officer`
    Then I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I select `Decision type changed` for the `Reason for fee update` field
    And I type `10` for the `New fee amount` field
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the first `Fee update recorded` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Decision type changed` in the `Reason for fee update` field
    And I should see `£10.00` in the `New fee amount` field
    And I should see `Fee update recorded` in the `Fee update status` field
    And I click the `Submit` button

    Then I should see the text `You have recorded a fee update`
    And I should see the text `What happens next`
    And I should see the text `The appropriate team will be notified to review the fee update and take the next steps.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the first `Additional fee requested` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Decision type changed` in the `Reason for fee update` field
    And I should see `£10.00` in the `New fee amount` field
    And I should see `Fee update recorded` in the `Fee update status` field
    And I should see the text `Additional fee requested`
    And I click the `Submit` button

    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I select the `Manage a fee update` Next step
    And I should see the `Manage a fee update` page
    And I should see the text `Select the reason the fee has been updated.`
    And I click the `Continue` button

    Then I should see the text `You need to record the status of the fee update. To do this select the task you are about to complete. Do not uncheck any previously selected tasks.`
    And I click the first `Refund approved` label
    And I click the `Continue` button

    Then I should see the text `You cannot make this selection. Select fee update not required to continue.`

  @dlrm-manage-a-fee-update
  Scenario: Admin officer manage fee update for decision type changed

    When I save my initial PA appeal type with a remission and with hearing fee
    Then I submit my nonpayment appeal

    And I switch to be a `Admin Officer`
    And I record remission decision as partially approved
    And I mark the appeal as paid

    When I switch to be a `Admin Officer`
    Then I select the `Manage a fee update` Next step
    And I should see the `Reason for update` page
    And I should see the text `What is the reason for the fee update?`
    And I select `Decision type changed` for the `What is the reason for the fee update?` field
    And I click the `Continue` button
    And I select `Decision without a hearing. The fee for this type of appeal is £80` for the `How do you want the appeal to be decided?` field
    And I click the `Continue` button

    And I type `80` for the `Enter new appeal fee amount` field
    And I click the `Continue` button
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

