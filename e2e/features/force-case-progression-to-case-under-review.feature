Feature: Force case progression to case under review


  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence

  @regression @force-case-progression-to-case-under-review @RIA-2775
  Scenario: Case officer forces the case state from caseBuilding to caseUnderReview

    When I click the `Overview` tab

    When I select the `Force case - case under review` Next step
    Then I am on the `Force case - case under review` page

    When I type `some reason for case progression` for the `Reasons to force the case progression` field
    Then the `Continue` button is enabled
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `some reason for case progression` in the `Reasons to force the case progression` field

    When I click the `Submit` button
    And I should see the text `You have forced the case progression to case under review`
    And I should see the text `What happens next`
    And I should see the text `Legal representative will be notified by email.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Force case - case under review`
    And I should see the image `caseOfficer_caseUnderReview.png`

    When I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `Reason for forcing case progression to case under review` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `some reason for case progression` for the `Case note` field
    And within the `Case notes` collection's first item, I should see `Case Officer` for the `User` field
    And within the `Case notes` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date added` field
