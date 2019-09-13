Feature: End appeal

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`

  @end-appeal @RIA-823 @RIA-1766
  Scenario: End appeal

    When I select the `End the appeal` Next step

    Then I am on the `End the appeal` page
    And I should see the text `This appeal has ended. Record the outcome and reasons below.`
    And the `Continue` button is disabled

    When I select `Struck out` for the `Outcome of the appeal` field
    And I type `some end appeal reason` for the `Reasons for this outcome` field

    Then the `Continue` button is enabled

    When I click the `Continue` button

    Then I am on the `End the appeal` page
    And I should see the text `Record who approved this outcome.`
    And the `Continue` button is disabled

    When I select `Judge` for the `Approved by` field
    And I type `John Doe` for the `Name of approver` field

    Then the `Continue` button is enabled

    When I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Struck out` for the `Outcome of the appeal` answer
    And I should see `some end appeal reason` for the `Reasons for this outcome` answer
    And I should see `Judge` for the `Approved by` answer
    And I should see `John Doe` for the `Name of approver` answer

    When I click the `End appeal` button

    Then I should see the text `You have ended the appeal`
    And I should see the text `What happens next`
    And I should see the text `A notification has been sent to all parties.`

    When I click the `Close and Return to case details` button

    Then I should see an alert confirming the case `has been updated with event: End the appeal`

    When I click the `Documents` tab
    Then I should see the `Documents` page
    And I should not see the `Upload additional evidence` link
    And I should not see the `Add additional evidence as an addendum` link
    And I should see the `Tribunal documents` field
    And within the `Tribunal documents` collection's first item, I should see `-Gonzlez-NoticeOfEndedAppeal.PDF` in the `Document` field
    And within the `Tribunal documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I click the `Directions` tab
    Then I should see the `Directions` page
    And I should not see the `Send a new direction` link
    And I should not see the `Change the direction due date` link

    When I click the `Case notes` tab
    Then I should see the `Case notes` page
    And I should not see the `Add case note` link

    When I click the `Applications` tab
    Then I should see the `Applications` page
    And I should not see the `Record an application` link