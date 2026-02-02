Feature: Work allocation Task list and Task Manager for review appeal

  Background:
    Given I am signed in as a `Legal Org User Rep A`

  @Task-created @RIA-4605-DC-AppealSubmitted
  Scenario: Task created and visible to TCW's

    When I save my initial DC appeal for nonPayment without hearing
    And I go to the overview page for the stored case
    Then I should be on the overview page

    And I select the `Submit your appeal` Next step
    And I agree to the declaration
    And I click the `Continue` button
    When I click the `Submit` button
    Then I should see the text `Your appeal has been submitted`
    And I switch to be a `Sr Case Officer`
    And I click the `Task list` link
    And I wait for 10 seconds

  @Task-created @RIA-4605-RP-AppealSubmitted
  Scenario: Task created and visible to TCW's

    When I save my initial RP appeal for nonPayment without hearing
    And I go to the overview page for the stored case
    Then I should be on the overview page

    And I select the `Submit your appeal` Next step
    And I agree to the declaration
    And I click the `Continue` button
    When I click the `Submit` button
    Then I should see the text `Your appeal has been submitted`
    And I switch to be a `Sr Case Officer`
    And I click the `Task list` link
    And I wait for 10 seconds

  @Task-created @RIA-4605-PA-PayLater-AppealSubmitted
  Scenario: Task created and visible to TCW's

    And I save my initial PA appeal type without remission and with hearing fee and pay later
    And I go to the overview page for the stored case
    Then I should be on the overview page
    And I select the `Submit your appeal` Next step
    And I agree to the declaration
    And I click the `Continue` button
    When I click the `Submit` button
    Then I should see the text `Your appeal has been submitted`
    And I switch to be a `Sr Case Officer`
    And I click the `Task list` link
    And I wait for 10 seconds

  @Task-created @RIA-4605-PA-PayNow-AppealSubmitted
  Scenario: Task created and visible to TCW's

    And I save my initial PA appeal type without remission and with hearing fee and pay now
    And I go to the overview page for the stored case
    Then I should be on the overview page
    When I click the `pay for and submit your appeal` link
    Then I should see the `Select PBA number` page
    And I select `PBA0087412` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button
    And I agree to the declaration
    And I click the `Continue` button
    When I click the `Pay and submit now` button
    Then I should see the text `Your appeal has been paid for and submitted`
    And I switch to be a `Sr Case Officer`
    And I click the `Task list` link
    And I wait for 10 seconds
    And I click the `Available tasks` link
    And I wait for 15 seconds
    And The page is accessible
    And I refresh the page
    And I wait for 15 seconds
    And I search the latest case id for the online case reference number
    And I should see the task `Review the appeal`

  @Task-created @RIA-4605-EA-PayNow-AppealSubmitted
  Scenario: Task created and visible to TCW's

    And I save my initial EA appeal type without remission and with hearing fee and pay now
    And I go to the overview page for the stored case
    Then I should be on the overview page
    When I click the `pay for and submit your appeal` link
    And I select `PBA0087412` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button
    And I agree to the declaration
    And I click the `Continue` button
    When I click the `Pay and submit now` button
    Then I should see the text `Your appeal has been paid for and submitted`
    And I switch to be a `Sr Case Officer`
    And I click the `Task list` link
    And I wait for 10 seconds

  @Task-created @RIA-4605-HU-PayLater-MarkAppealPaid
  Scenario: Task created and visible to TCW's

    And I save my initial HU appeal type without remission and with hearing fee and pay offline
    And I go to the overview page for the stored case
    Then I should be on the overview page
    And I click the `Overview` tab
    And I select the `Submit your appeal` Next step
    And I agree to the declaration
    And I click the `Continue` button
    When I click the `Submit` button
    Then I should see the text `Your appeal has been submitted`

    When I switch to be a `Admin Officer`
    And I select the `Mark appeal as paid` Next step
    Then I should see the `Mark appeal as paid` page
    And I type `01-10-2021` for the `Payment date` field
    And I type `40` for the `Amount paid` field
    And I type `Payment is now complete` for the `Additional payment information (Optional) field
    And I click the `Continue` button

    And I switch to be a `Sr Case Officer`
    And I click the `Task list` link
    And I wait for 10 seconds

  @Task-created @RIA-4605-EA-PayNow-MarkAppealNotPaid
  Scenario: Task created and visible to TCW's

    And I save my initial EA appeal type without remission and with hearing fee and pay now
    And I go to the overview page for the stored case
    Then I should be on the overview page
    When I click the `pay for and submit your appeal` link
    And I select `PBA0087412` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button
    And I agree to the declaration
    And I click the `Continue` button
    When I click the `Pay and submit now` button
    Then I should see the text `Your appeal has been paid for and submitted`
    And I switch to be a `Sr Case Officer`
    And I select the `Mark appeal as not paid` Next step
    And I click the `Mark as not paid` button
    Then I should see the text `What happens next`
    And I click the `Task list` link
    And I wait for 10 seconds

  @Task-created @RIA-4605-EA-PayNow-MoveToSubmitted
  Scenario: Task created and visible to TCW's

    And I save my initial EA appeal type without remission and with hearing fee and pay now
    And I go to the overview page for the stored case
    Then I should be on the overview page
    When I click the `pay for and submit your appeal` link
    And I select `PBA0087412` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button
    And I agree to the declaration
    And I click the `Continue` button
    When I click the `Pay and submit now` button
    Then I should see the text `Your appeal has been paid for and submitted`
    And I switch to be a `Sr Case Officer`
    And I select the `Mark appeal as not paid` Next step
    And I click the `Mark as not paid` button
    Then I should see the text `What happens next`

    And I switch to be a `Legal Org User Rep A`
    And I select the `Make a payment` Next step
    And I select `PBA0087412` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Pay now` button
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see the text `You have submitted your appeal. A Tribunal Caseworker will now review your appeal.'

    And I switch to be a `Sr Case Officer`
    And I click the `Task list` link
    And I wait for 10 seconds

  @Task-created @RIA-4605-EA-PayNow-PayForAppeal
  Scenario: Task created and visible to TCW's

    And I save my initial EA appeal type without remission and with hearing fee and pay now
    And I go to the overview page for the stored case
    Then I should be on the overview page
    When I click the `pay for and submit your appeal` link
    And I select `PBA0087412` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button
    And I agree to the declaration
    And I click the `Continue` button
    When I click the `Pay and submit now` button
    Then I should see the text `Your appeal has been paid for and submitted`
    And I switch to be a `Sr Case Officer`
    And I select the `Mark appeal as not paid` Next step
    And I click the `Mark as not paid` button
    Then I should see the text `What happens next`

    And I switch to be a `Legal Org User Rep A`
    And I select the `Make a payment` Next step
    And I select `PBA0087412` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Pay now` button
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see the text `You have submitted your appeal. A Tribunal Caseworker will now review your appeal.'

    And I switch to be a `Sr Case Officer`
    And I click the `Task list` link
    And I wait for 10 seconds

  @Task-created @RIA-4605-EA-MoveToSubmitted
  Scenario: Task created and visible to TCW's

    And I save my initial EA appeal type without remission and with hearing fee and pay now
    And I go to the overview page for the stored case
    Then I should be on the overview page
    When I click the `pay for and submit your appeal` link
    And I select `PBA0087412` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button
    And I agree to the declaration
    And I click the `Continue` button
    When I click the `Pay and submit now` button
    Then I should see the text `Your appeal has been paid for and submitted`
    And I switch to be a `Case Officer`
    And I select the `Mark appeal as not paid` Next step
    And I click the `Mark as not paid` button
    Then I should see the text `What happens next`

    And I switch to be a `Legal Org User Rep A`
    And I select the `Change payment method to card` Next step
    And I click the `Update payment method` button
    Then I should see the text `Do this next`

    When I switch to be a `Admin Officer`
    And I select the `Mark appeal as paid` Next step
    Then I should see the `Mark appeal as paid` page
    And I type `01-10-2021` for the `Payment date` field
    And I type `40` for the `Amount paid` field
    And I type `Payment is now complete` for the `Additional payment information (Optional) field
    And I click the `Continue` button
    And I wait for 10 seconds

    And I switch to be a `Sr Case Officer`
    And I click the `Task list` link
    And I wait for 10 seconds

  @Task-created @RIA-4605-Tasklist
  Scenario: Task created and visible to TCW's

    And I save my initial EA appeal type without remission and with hearing fee and pay now
    And I go to the overview page for the stored case
    Then I should be on the overview page
    When I click the `pay for and submit your appeal` link
    And I select `PBA0087412` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button
    And I agree to the declaration
    And I click the `Continue` button
    When I click the `Pay and submit now` button
    Then I should see the text `Your appeal has been paid for and submitted`
    And I switch to be a `Sr Case Officer`
    And I click the `Task list` link
    And I wait for 10 seconds
    And I click the `Available tasks` link
    And I wait for 15 seconds
    And The page is accessible
    And I refresh the page
    And I wait for 15 seconds

