Feature: Force case progression to submit hearing requirements


  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Rep`
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`
    And I request respondent review

  @regression @force-case-progression-to-submit-hearing-requirements @RIA-2776
  Scenario: Case officer forces the case state from respondentReview to submitHearingRequirements

    When I click the `Overview` tab

    When I select the `Force case - hearing reqs` Next step
    Then I am on the `Force case - hearing reqs` page

    When I type `some reason for case progression` for the `Reasons to force the case progression` field
    Then the `Continue` button is enabled
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `some reason for case progression` in the `Reasons to force the case progression` field

    When I click the `Submit` button
    And I should see the text `You've forced the case progression to submit hearing requirements`
    And I should see the text `What happens next`
    And I should see the text `Respondent will be notified by email.`

    When I click the `Close and Return to case details` button if present
    Then I should see an alert confirming the case `has been updated with event: Force case - hearing reqs`
    And I should see the image `caseOfficer_submitHearingRequirements.png`

    When I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `Reason for forcing the case progression to submit hearing requirements` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `some reason for case progression` for the `Case note` field
    And within the `Case notes` collection's first item, I should see `Case Officer` for the `User` field
    And within the `Case notes` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date added` field
