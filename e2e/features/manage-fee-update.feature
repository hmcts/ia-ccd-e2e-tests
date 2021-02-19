Feature: Manage fee update

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case

  @Case-officer-manage-fee-update-pay-now @RIA-3792 @RIA-3790
  Scenario: Case officer manage fee update

    Then I save my initial `EA` appeal type with `no remission` and `with` hearing fee
    And I pay for and submit my appeal

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
    And I click the `Close and Return to case details` button

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
    And I click the `Close and Return to case details` button

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
    And I click the `Close and Return to case details` button

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
    Then I pay for and submit my appeal

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
    And I click the `Close and Return to case details` button

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
    And I should see `Appeal not valid` for the `Reason for fee update` field
    And I should see `£0.00` for the `New fee amount` field

    When I switch to be a `Home Office APC`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Appeal not valid` for the `Reason for fee update` field
    And I should see `£0.00` for the `New fee amount` field

    When I switch to be a `Home Office Generic`
    Then I click the `Appeal` tab
    And I should see the text `Fee update details`
    And I should see `Appeal not valid` for the `Reason for fee update` field
    And I should see `£0.00` for the `New fee amount` field

  @Manage-fee-update-for-dc-appeal @RIA-3792
  Scenario: Case officer manage fee update for dc appeal

    Then I save my initial `DC` appeal for nonPayment `with` hearing
    And I submit my nonpayment appeal

    When I switch to be a `Case Officer`
    Then I select the `Manage a fee update` Next step
    And I should see the text `You cannot manage a fee update for this appeal`
