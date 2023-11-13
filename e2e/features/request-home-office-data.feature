Feature: Case-officer request for Home Office data

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case

    And I save my initial PA appeal type without remission and with hearing fee and pay offline
    And I submit my appeal

  @request-ho-data @RIA-4557
  Scenario: Case officer record out of time decision

    When I switch to be a `Case Officer`
    And I click the `Overview` tab
    And I should see the text `You must review the appeal data and cross reference it with Home Office data in the Validation tab. If the appeal looks valid, you must tell the respondent to supply their evidence.`

    When I select the `Request Home Office data` Next step
    And I am on the `Match appellant details` page
    And I should see the option `No Match` for the `Make a selection` field
    And I select `No Match` for the `Make a selection` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `No Match` for the `Make a selection` field
    And I click the `Request Home Office data` button

    Then I should see the text `You have matched the appellant details`
    And I should see the text `Do this next`
    And I should see the text `You must review the appeal data and cross reference it with Home Office data in the validation tab. If the appeal looks valid, you must tell the respondent to supply their evidence.`

    When I click the `Close and Return to case details` button if present

    Then I click the `Validation` tab
    And I should see the text `There are no matching details for this appellant. You can contact the Home Office if you need more information to validate the appeal.`
