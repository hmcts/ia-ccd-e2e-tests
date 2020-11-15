Feature: Record remission decision

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial `EA` appeal type with `a remission` and `with` hearing fee
    And I submit my nonpayment appeal

  @record-remission-decision-approved @RIA-3517-approved @RIA-3517
  Scenario: Record remission decision approved

    When I switch to be a `Admin Officer`
    Then I click the `Overview` tab
    And I should see the `Overview` page
    And I should see the text `Do this next`
    And I should see the text `An appeal has been submitted with a remission application. You need to review the remission details in the appeal tab.`
    And I should see the text `If you need more information to make a decision, you can email the appellant.`
    And I should see the text `You then need to record your remission decision.`

    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see the text `Remission details`
    And I should see `Legal Aid` for the `Fee remission type` field
    And I should see `1A234B` for the `Legal Aid account number` field

    Then I select the `Record remission decision` Next step
    And I should see the `Record remission decision` page
    And I select `Approved` for the `Decision` field
    And I click the `Continue` button

    Then I should see the text `The full fee of £140 will be remitted. Click Continue to confirm the amount remitted and the amount left to pay are correct.`
    And I type `140` for the `Amount remitted (£)` field
    And I type `0` for the `Amount left to pay (£)` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Approved` in the `Decision` field
    And I should see `£140.00` for the `Amount remitted (£)` field
    And I should see `£0.00` for the `Amount left to pay (£)` field
    And I click the `Record decision` button

    Then I should see the text `You have approved this remission application`
    And I should see the text `What happens next`
    And I should see the text `The appellant will be notified that you have approved this remission application. The appeal will progress as usual.`
    And I click the `Close and Return to case details` button

    Then I should see an alert confirming the case `has been updated with event: Record remission decision`

    Then I click the `Overview` tab
    And I should see the `Overview` page
    And I should see the text `What happens next`
    And I should see the text `The appellant will be notified that you have approved this remission application. The appeal will progress as usual.`

    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see the text `Remission details`
    And I should see `Legal Aid` for the `Fee remission type` field
    And I should see `1A234B` for the `Legal Aid account number` field
    And I should see `Approved` for the `Decision` field
    And I should see `£140.00` for the `Fee` field
    And I should see `£140.00` for the `Amount remitted (£)` field
    And I should see `£0.00` for the `Amount left to pay (£)` field

    When I switch to be a `Case Officer`
    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see the text `Remission details`
    And I should see `Legal Aid` for the `Fee remission type` field
    And I should see `1A234B` for the `Legal Aid account number` field
    And I should see `Approved` for the `Decision` field
    And I should see `£140.00` for the `Fee` field
    And I should see `£140.00` for the `Amount remitted (£)` field
    And I should see `£0.00` for the `Amount left to pay (£)` field

    When I switch to be a `Judge`
    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see the text `Remission details`
    And I should see `Legal Aid` for the `Fee remission type` field
    And I should see `1A234B` for the `Legal Aid account number` field
    And I should see `Approved` for the `Decision` field
    And I should see `£140.00` for the `Fee` field
    And I should see `£140.00` for the `Amount remitted (£)` field
    And I should see `£0.00` for the `Amount left to pay (£)` field

    When I switch to be a `Legal Rep`
    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see the text `Remission details`
    And I should see `Legal Aid` for the `Fee remission type` field
    And I should see `1A234B` for the `Legal Aid account number` field
    And I should see `Approved` for the `Decision` field
    And I should see `£140.00` for the `Fee` field
    And I should see `£140.00` for the `Amount remitted (£)` field
    And I should see `£0.00` for the `Amount left to pay (£)` field

  @record-remission-decision-partially-approved @RIA-3517-partially-approved @RIA-3517
  Scenario: Record remission decision partially approved

    When I switch to be a `Admin Officer`
    Then I click the `Overview` tab
    And I should see the `Overview` page
    And I should see the text `Do this next`
    And I should see the text `An appeal has been submitted with a remission application. You need to review the remission details in the appeal tab.`
    And I should see the text `If you need more information to make a decision, you can email the appellant.`
    And I should see the text `You then need to record your remission decision.`

    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see the text `Remission details`
    And I should see `Legal Aid` for the `Fee remission type` field
    And I should see `1A234B` for the `Legal Aid account number` field

    Then I select the `Record remission decision` Next step
    And I should see the `Record remission decision` page
    And I select `Partially approved` for the `Decision` field
    And I click the `Continue` button

    Then I should see the text `The full fee of £140 will be partially remitted. Click Continue to confirm the amount remitted and the amount left to pay are correct.`
    And I type `100` for the `Amount remitted (£)` field
    And I type `40` for the `Amount left to pay (£)` field
    And I type `A reason for partially approved` for the `Reason for decision` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Partially approved` in the `Decision` field
    And I should see `£100.00` for the `Amount remitted (£)` field
    And I should see `£40.00` for the `Amount left to pay (£)` field
    And I should see `A reason for partially approved` for the `Reason for decision` field
    And I click the `Record decision` button

    Then I should see the text `You have partially approved this remission application`
    And I should see the text `What happens next`
    And I should see the text `The appellant will be notified that they need to pay the outstanding fee. Once payment is made you will need to mark the appeal as paid.`
    And I click the `Close and Return to case details` button

    Then I should see an alert confirming the case `has been updated with event: Record remission decision`

    Then I click the `Overview` tab
    And I should see the `Overview` page
    And I should see the text `What happens next`
    And I should see the text `The appellant will be notified that they need to pay the outstanding fee. Once payment is made you will need to mark the appeal as paid.`

    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see the text `Remission details`
    And I should see `Legal Aid` for the `Fee remission type` field
    And I should see `1A234B` for the `Legal Aid account number` field
    And I should see `Partially approved` for the `Decision` field
    And I should see `£140.00` for the `Fee` field
    And I should see `£100.00` for the `Amount remitted (£)` field
    And I should see `£40.00` for the `Amount left to pay (£)` field
    And I should see `A reason for partially approved` for the `Reason for decision` field

    When I switch to be a `Case Officer`
    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see the text `Remission details`
    And I should see `Legal Aid` for the `Fee remission type` field
    And I should see `1A234B` for the `Legal Aid account number` field
    And I should see `Partially approved` for the `Decision` field
    And I should see `£140.00` for the `Fee` field
    And I should see `£100.00` for the `Amount remitted (£)` field
    And I should see `£40.00` for the `Amount left to pay (£)` field
    And I should see `A reason for partially approved` for the `Reason for decision` field

    When I switch to be a `Judge`
    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see the text `Remission details`
    And I should see `Legal Aid` for the `Fee remission type` field
    And I should see `1A234B` for the `Legal Aid account number` field
    And I should see `Partially approved` for the `Decision` field
    And I should see `£140.00` for the `Fee` field
    And I should see `£100.00` for the `Amount remitted (£)` field
    And I should see `£40.00` for the `Amount left to pay (£)` field
    And I should see `A reason for partially approved` for the `Reason for decision` field

    When I switch to be a `Legal Rep`
    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see `Legal Aid` for the `Fee remission type` field
    And I should see `1A234B` for the `Legal Aid account number` field
    And I should see `Partially approved` for the `Decision` field
    And I should see `£140.00` for the `Fee` field
    And I should see `£100.00` for the `Amount remitted (£)` field
    And I should see `£40.00` for the `Amount left to pay (£)` field
    And I should see `A reason for partially approved` for the `Reason for decision` field

  @record-remission-decision-rejected @RIA-3517-rejected @RIA-3517
  Scenario: Record remission decision rejected

    When I switch to be a `Admin Officer`
    Then I click the `Overview` tab
    And I should see the `Overview` page
    And I should see the text `Do this next`
    And I should see the text `An appeal has been submitted with a remission application. You need to review the remission details in the appeal tab.`
    And I should see the text `If you need more information to make a decision, you can email the appellant.`
    And I should see the text `You then need to record your remission decision.`

    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see the text `Remission details`
    And I should see `Legal Aid` for the `Fee remission type` field
    And I should see `1A234B` for the `Legal Aid account number` field

    Then I select the `Record remission decision` Next step
    And I should see the `Record remission decision` page
    And I select `Rejected` for the `Decision` field
    And I click the `Continue` button

    Then I should see the text `The full fee of an appeal with hearing is £140.`
    And I type `A reason for rejection` for the `Reason for decision` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Rejected` in the `Decision` field
    And I should see `A reason for rejection` in the `Reason for decision` field
    And I click the `Record decision` button

    Then I should see the text `You have rejected this remission application`
    And I should see the text `What happens next`
    And I should see the text `The appellant will be notified that they must pay the full fee for this appeal.`
    And I click the `Close and Return to case details` button

    Then I should see an alert confirming the case `has been updated with event: Record remission decision`

    Then I click the `Overview` tab
    And I should see the `Overview` page
    And I should see the text `What happens next`
    And I should see the text `The Tribunal will be notified that you have rejected this remission application. The appellant will be directed to pay the full fee.`

    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see the text `Remission details`
    And I should see `Legal Aid` for the `Fee remission type` field
    And I should see `1A234B` for the `Legal Aid account number` field
    And I should see `£140.00` for the `Fee` field
    And I should see `Rejected` for the `Decision` field
    And I should see `A reason for rejection` for the `Reason for decision` field

    When I switch to be a `Case Officer`
    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see the text `Remission details`
    And I should see `Legal Aid` for the `Fee remission type` field
    And I should see `1A234B` for the `Legal Aid account number` field
    And I should see `£140.00` for the `Fee` field
    And I should see `Rejected` for the `Decision` field
    And I should see `A reason for rejection` for the `Reason for decision` field

    When I switch to be a `Judge`
    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see the text `Remission details`
    And I should see `Legal Aid` for the `Fee remission type` field
    And I should see `£140.00` for the `Fee` field
    And I should see `Rejected` for the `Decision` field
    And I should see `A reason for rejection` for the `Reason for decision` field

    When I switch to be a `Legal Rep`
    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see the text `Remission details`
    And I should see `£140.00` for the `Fee` field
    And I should see `Rejected` for the `Decision` field
    And I should see `A reason for rejection` for the `Reason for decision` field

  @record-remission-decision-and-mark-appeal-as-paid @RIA-3517-mark-appeal-as-paid @RIA-3517
  Scenario: Record remission decision and mark appeal as paid

    When I switch to be a `Admin Officer`
    Then I click the `Overview` tab
    And I should see the `Overview` page
    And I should see the text `Do this next`
    And I should see the text `An appeal has been submitted with a remission application. You need to review the remission details in the appeal tab.`
    And I should see the text `If you need more information to make a decision, you can email the appellant.`
    And I should see the text `You then need to record your remission decision.`

    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see the text `Remission details`
    And I should see `Legal Aid` for the `Fee remission type` field
    And I should see `1A234B` for the `Legal Aid account number` field

    Then I select the `Record remission decision` Next step
    And I should see the `Record remission decision` page
    And I select `Partially approved` for the `Decision` field
    And I click the `Continue` button

    Then I should see the text `The full fee of £140 will be partially remitted. Click Continue to confirm the amount remitted and the amount left to pay are correct.`
    And I type `100` for the `Amount remitted (£)` field
    And I type `40` for the `Amount left to pay (£)` field
    And I type `A reason for partially approved` for the `Reason for decision` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Partially approved` in the `Decision` field
    And I should see `£100.00` for the `Amount remitted (£)` field
    And I should see `£40.00` for the `Amount left to pay (£)` field
    And I should see `A reason for partially approved` for the `Reason for decision` field
    And I click the `Record decision` button

    Then I should see the text `You have partially approved this remission application`
    And I should see the text `What happens next`
    And I should see the text `The appellant will be notified that they need to pay the outstanding fee. Once payment is made you will need to mark the appeal as paid.`
    And I click the `Close and Return to case details` button

    Then I should see an alert confirming the case `has been updated with event: Record remission decision`

    Then I click the `Overview` tab
    And I should see the `Overview` page
    And I should see the text `What happens next`
    And I should see the text `The appellant will be notified that they need to pay the outstanding fee. Once payment is made you will need to mark the appeal as paid.`

    And I select the `Mark appeal as paid` Next step
    Then I should see the `Mark appeal as paid` page
    And I type `16-11-2020` for the `Payment date` field
    And I type `40` for the `Amount paid (£)` field
    And I type `Payment is now complete` for the `Additional payment information (Optional) field
    And I click the `Continue` button

    When I am on the `Check your answers` page
    And I should see `16 Nov 2020` in the `Payment date` field
    And I should see `£40.00` for the `Amount paid (£)` field
    And I should see `Payment is now complete` for the `Additional payment information` field

    When I click the `Mark as paid` button
    Then I should see the text `Your have marked the appeal as paid`
    And I should see the text `What happens next`
    And I should see the text `The Tribunal will be notified that the fee has been paid. The appeal will progress as usual.`
    When I click the `Close and Return to case details` button

    Then I should see an alert confirming the case `has been updated with event: Mark appeal as paid`

    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see the text `Submission details`
    And I should see `Paid` for the `Payment status` field
    And I should see `16 Nov 2020` for the `Payment date` field
    And I should see `£40.00` for the `Amount paid (£)` field
    And I should see `Payment is now complete` for the `Additional payment information` field
    And I should see the text `Remission details`
    And I should see `Legal Aid` for the `Fee remission type` field
    And I should see `1A234B` for the `Legal Aid account number` field
    And I should see `Partially approved` for the `Decision` field
    And I should see `£140.00` for the `Fee` field
    And I should see `£100.00` for the `Amount remitted (£)` field
    And I should see `£40.00` for the `Amount left to pay (£)` field
    And I should see `A reason for partially approved` for the `Reason for decision` field

    When I switch to be a `Case Officer`
    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see the text `Submission details`
    And I should see `Paid` for the `Payment status` field
    And I should see `16 Nov 2020` for the `Payment date` field
    And I should see `£40.00` for the `Amount paid (£)` field
    And I should see `Payment is now complete` for the `Additional payment information` field
    And I should see the text `Remission details`
    And I should see `Legal Aid` for the `Fee remission type` field
    And I should see `1A234B` for the `Legal Aid account number` field
    And I should see `Partially approved` for the `Decision` field
    And I should see `£140.00` for the `Fee` field
    And I should see `£100.00` for the `Amount remitted (£)` field
    And I should see `£40.00` for the `Amount left to pay (£)` field
    And I should see `A reason for partially approved` for the `Reason for decision` field

    When I switch to be a `Judge`
    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see the text `Submission details`
    And I should see `Paid` for the `Payment status` field
    And I should see `16 Nov 2020` for the `Payment date` field
    And I should see `£40.00` for the `Amount paid (£)` field
    And I should see `Payment is now complete` for the `Additional payment information` field
    And I should see the text `Remission details`
    And I should see `Legal Aid` for the `Fee remission type` field
    And I should see `1A234B` for the `Legal Aid account number` field
    And I should see `Partially approved` for the `Decision` field
    And I should see `£140.00` for the `Fee` field
    And I should see `£100.00` for the `Amount remitted (£)` field
    And I should see `£40.00` for the `Amount left to pay (£)` field
    And I should see `A reason for partially approved` for the `Reason for decision` field

    When I switch to be a `Legal Rep`
    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see the text `Submission details`
    And I should see `Paid` for the `Payment status` field
    And I should see `16 Nov 2020` for the `Payment date` field
    And I should see `£40.00` for the `Amount paid (£)` field
    And I should see `Payment is now complete` for the `Additional payment information` field
    And I should see `Legal Aid` for the `Fee remission type` field
    And I should see `1A234B` for the `Legal Aid account number` field
    And I should see `Partially approved` for the `Decision` field
    And I should see `£140.00` for the `Fee` field
    And I should see `£100.00` for the `Amount remitted (£)` field
    And I should see `£40.00` for the `Amount left to pay (£)` field
    And I should see `A reason for partially approved` for the `Reason for decision` field

