Feature: Submit change hearing centre

Background:
    Given I am signed in as a `Legal Org User Rep A`
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
    And I switch to be a `Case Officer`
    And I request home office data
    And I request respondent evidence
    And I wait for 3 seconds
    # And I click the `Applications` tab
    # And I click the `Record an application` link
    
    # Then I add an item to the `Application email` collection
    # And within the `Application email` collection's first item, I upload `{@test.doc}` for the document field without a label
    # And I click the `The legal representative` label
    And I select `Change hearing centre` for the `Type of application` field
    And I type `change hearing centre reason` for the `Reason for application` field
    And I select `{$TODAY-3|DD-MM-YYYY}` for the `Date application was made` field
    And I click the `Granted` label
    And I type `some application decision reason` for the `Reasons for decision` field
    And I click the `Continue` button

    Then I click the `Record application` button
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_changeHearingCentre` case progress image
    And I should see the text `Do this next`
    And I should see the text `You must now change the designated hearing centre based on the new information provided in the application. The application decision has been recorded and is available in the applications tab.`

@submit-change-hearing-centre @RIA-2558
Scenario: submit change hearing centre
    When I click the `change the designated hearing centre` link
    Then I am on the `Change hearing centre` page
    And I should see the text `Select the new hearing centre.`
    And I should see the option `Manchester` for the `Designated hearing centre` field
    And I should see the option `Taylor House` for the `Designated hearing centre` field
    And I should see the option `Newport` for the `Designated hearing centre` field
    # And I should see the option `Bradford` for the `Designated hearing centre` field
    # And I should see the option `North Shields` for the `Designated hearing centre` field
    And I should see the option `Birmingham` for the `Designated hearing centre` field
    And I should see the option `Hatton Cross` for the `Designated hearing centre` field
    And I should see the option `Glasgow` for the `Designated hearing centre` field
    And I select `Glasgow` for the `Designated hearing centre` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Glasgow` in the `Designated hearing centre` field

    When I click the `Update` button
    Then I should see the text `You've updated the designated hearing centre`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Change hearing centre`
    And I should only see the `caseOfficer_awaitingRespondentEvidence_preUpload` case progress image
