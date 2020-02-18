Feature: Record grant update hearing requirements


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
    And I add the appeal response
    And I request appellant review
    And I request hearing requirements
    And I switch to be a `Legal Rep`
    And I submit hearing requirements with all yes
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path
    And I switch to be a `Admin Officer`
    And I list the case with hearing requirements

  @record-grant-update-hearing-requirements @RIA-2373
  Scenario: record grant update hearing requirements

    Then I switch to be a `Case Officer`
    And I click the `Overview` tab
    And I should only see the `caseOfficer_prepareForHearing` case progress image

    And I click the `Applications` tab
    And I click the `Record an application` link
    Then I am on the `Record an application` page
    And I add an item to the `Application email` collection
    And within the `Application email` collection's first item, I upload `{@test.doc}` for the field without a label
    And I click the `The legal representative` label
    And I select `Update hearing requirements` for the `Type of application` field
    And I type `update hearing requirements reason` for the `Reason for application` field
    And I select `{$TODAY-3|DD-MM-YYYY}` for the `Date application was made` field
    And I click the `Granted` label
    And I type `some application decision reason` for the `Reasons for decision` field

    Then the `Continue` button is enabled

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `test.doc` in the `Application email` field
    And I should see `The legal representative` in the `Application from` field
    And I should see `Update hearing requirements` in the `Type of application` field
    And I should see `update hearing requirements reason` in the `Reason for application` field
    And I should see `{$TODAY-3|D MMM YYYY}` in the `Date application was made` field
    And I should see `Granted` in the `Application decision` field
    And I should see `some application decision reason` in the `Reasons for decision` field

    When I click the `Record application` button
    Then I should see the text `You have recorded an application`
    And I should see the text `What happens next`
    And I should see the text `The application decision has been recorded and is now available in the applications tab. You must now update the hearing requirements based on the new information provided in the application.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Record an application`

    And I click the `Overview` tab
    And I should only see the `caseOfficer_updateHearingRequirements` case progress image
    And I should see the text `Do this next`
    And I should see the text `In order for the case to proceed you must now update the hearing requirements.`

    When I click the `Applications` tab
    Then I should see the `Applications` field
    And I should see the `Record an application` link
    And within the `Applications` collection's first item, I should see `test.doc` for the `Application email` field
    And within the `Applications` collection's first item, I should see `The legal representative` for the `Application from` field
    And within the `Applications` collection's first item, I should see `Update hearing requirements` for the `Type of application` field
    And within the `Applications` collection's first item, I should see `update hearing requirements reason` for the `Reason of application` field
    And within the `Applications` collection's first item, I should see `{$TODAY-3|D MMM YYYY}` for the `Date application was made` field
    And within the `Applications` collection's first item, I should see `Granted` for the `Decision` field
    And within the `Applications` collection's first item, I should see `some application decision reason` for the `Reason of decision` field
    And within the `Applications` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date of decision` field
    And within the `Applications` collection's first item, I should see `In progress` for the `Status` field

  @record-application-and-update-hearing-requirements @RIA-2031
  Scenario: record application and update hearing requirements

    When I switch to be a `Case Officer`
    And I click the `Overview` tab
    And I click the `Applications` tab
    And I click the `Record an application` link
    And I add an item to the `Application email` collection
    And within the `Application email` collection's first item, I upload `{@test.doc}` for the field without a label
    And I click the `The legal representative` label
    And I select `Update hearing requirements` for the `Type of application` field
    And I type `update hearing requirements reason` for the `Reason for application` field
    And I select `{$TODAY-3|DD-MM-YYYY}` for the `Date application was made` field
    And I click the `Granted` label
    And I type `some application decision reason` for the `Reasons for decision` field
    And I click the `Continue` button
    And I click the `Record application` button
    And I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Record an application`

    And I click the `Overview` tab
    And I should only see the `caseOfficer_updateHearingRequirements` case progress image
    And I should see the text `Do this next`
    And I should see the text `In order for the case to proceed you must now update the hearing requirements.`

    When I click the `Applications` tab
    Then I should see the `Applications` field
    And I should see the `Record an application` link
    And within the `Applications` collection's first item, I should see `test.doc` for the `Application email` field
    And within the `Applications` collection's first item, I should see `The legal representative` for the `Application from` field
    And within the `Applications` collection's first item, I should see `Update hearing requirements` for the `Type of application` field
    And within the `Applications` collection's first item, I should see `update hearing requirements reason` for the `Reason of application` field
    And within the `Applications` collection's first item, I should see `{$TODAY-3|D MMM YYYY}` for the `Date application was made` field
    And within the `Applications` collection's first item, I should see `Granted` for the `Decision` field
    And within the `Applications` collection's first item, I should see `some application decision reason` for the `Reason of decision` field
    And within the `Applications` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date of decision` field
    And within the `Applications` collection's first item, I should see `In progress` for the `Status` field

    When I update hearing requirements with all no

    And I click the `Overview` tab
    Then I should only see the `caseOfficer_updateHearingAdjustments` case progress image
    And I should see the text `Do this next`
    And I should see the text `You must now update the hearing adjustments or confirm they haven't changed.`

    When I click the `Applications` tab

    Then I should see the `Applications` field
    And I should see the `Record an application` link
    And within the `Applications` collection's first item, I should see `test.doc` for the `Application email` field
    And within the `Applications` collection's first item, I should see `The legal representative` for the `Application from` field
    And within the `Applications` collection's first item, I should see `Update hearing requirements` for the `Type of application` field
    And within the `Applications` collection's first item, I should see `update hearing requirements reason` for the `Reason of application` field
    And within the `Applications` collection's first item, I should see `{$TODAY-3|D MMM YYYY}` for the `Date application was made` field
    And within the `Applications` collection's first item, I should see `Granted` for the `Decision` field
    And within the `Applications` collection's first item, I should see `some application decision reason` for the `Reason of decision` field
    And within the `Applications` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date of decision` field
    And within the `Applications` collection's first item, I should see `Completed` for the `Status` field
