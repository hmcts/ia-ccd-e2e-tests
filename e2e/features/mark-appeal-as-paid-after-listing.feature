Feature: Mark appeal as paid after listing
  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial PA appeal type with hearing fee and pay offline
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Rep`
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`
    And I request respondent review
    And I add the appeal response
    And I request appellant review
    And I request hearing requirements
    And I switch to be a `Legal Rep`
    And I submit hearing requirements with all yes
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path
    And I switch to be a `Admin Officer`
    And I list the case


  @Mark-appeal-as-paid-PA-after-listing @RIA-3473-PA @RIA-3473
  Scenario: Mark PA appeal as paid (PA appeal type with a hearing)

    When I switch to be a `Admin Officer`
    And I select the `Mark appeal as paid` Next step
    Then I should see the `Mark appeal as paid` page
    And I type `31-08-2020` for the `Payment date` field
    And I type `140` for the `Amount paid (£)` field
    And I type `Payment is now complete` for the `Additional payment information (Optional) field
    And I click the `Continue` button

    When I am on the `Check your answers` page
    And I should see `31 Aug 2020` in the `Payment date` field
    And I should see `£140.00` for the `Amount paid (£)` field
    And I should see `Payment is now complete` for the `Additional payment information` field

    When I click the `Mark as paid` button
    Then I should see the text `Your have marked the appeal as paid`
    And I should see the text `What happens next`
    And I should see the text `The Tribunal will be notified that the fee has been paid. The appeal will progress as usual.`
    When I click the `Close and Return to case details` button

    Then I should see an alert confirming the case `has been updated with event: Mark appeal as paid`
