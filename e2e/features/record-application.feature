Feature: Record application

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`

  @regression @record-application-refused @RIA-1485 @RIA-1500
  Scenario: Record refused application

    When I select the `Record an application` Next step
    Then I am on the `Record an application` page
    And I should see the text `The appellant or the respondent has made an application. Record the reasons and the outcome of the application. If the application has been granted, you may need to edit listing, edit direction due date or end the appeal.`
    And I should see the text `Attach a copy of the application email and any other communication.`

    And the `Continue` button is disabled

    When I add an item to the `Application email` collection
    And within the `Application email` collection's first item, I upload `{@test.doc}` for the field without a label
    And I click the `The legal representative` label
    And I select `Withdraw` for the `Type of application` field
    And I type `some application reason` for the `Reason for application` field
    And I select `{$TODAY-3|DD-MM-YYYY}` for the `Date application was made` field
    And I click the `Refused` label
    And I type `some application decision reason` for the `Reasons for decision` field

    Then the `Continue` button is enabled

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `test.doc` in the `Application email` field
    And I should see `The legal representative` in the `Application from` field
    And I should see `Withdraw` in the `Type of application` field
    And I should see `some application reason` in the `Reason for application` field
    And I should see `{$TODAY-3|D MMM YYYY}` in the `Date application was made` field
    And I should see `Refused` in the `Application decision` field
    And I should see `some application decision reason` in the `Reasons for decision` field

    When I click the `Record application` button
    Then I should see the text `You have recorded an application`
    And I should see the text `What happens next`
    And I should see the text `The application decision has been recorded and is now available in the applications tab. A notification will be sent to both parties, informing them that an application was requested and refused. The case will progress as usual.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Record an application`

    When I click the `Applications` tab
    Then I should see the `Applications` field
    And I should see the `Record an application` link
    And within the `Applications` collection's first item, I should see `test.doc` for the `Application email` field
    And within the `Applications` collection's first item, I should see `The legal representative` for the `Application from` field
    And within the `Applications` collection's first item, I should see `Withdraw` for the `Type of application` field
    And within the `Applications` collection's first item, I should see `some application reason` for the `Reason of application` field
    And within the `Applications` collection's first item, I should see `{$TODAY-3|D MMM YYYY}` for the `Date application was made` field
    And within the `Applications` collection's first item, I should see `Refused` for the `Decision` field
    And within the `Applications` collection's first item, I should see `some application decision reason` for the `Reason of decision` field
    And within the `Applications` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date of decision` field
    And within the `Applications` collection's first item, I should see `Completed` for the `Status` field

  @regression @record-application-time-extension-and-withdraw @RIA-1485 @RIA-1562 @RIA-1500
  Scenario: Record granted time extension application and later withdraw

    And I request respondent evidence

    When I select the `Record an application` Next step
    Then I am on the `Record an application` page
    And I should see the text `The appellant or the respondent has made an application. Record the reasons and the outcome of the application. If the application has been granted, you may need to edit listing, edit direction due date or end the appeal.`
    And I should see the text `Attach a copy of the application email and any other communication.`

    And the `Continue` button is disabled

    When I add an item to the `Application email` collection
    And within the `Application email` collection's first item, I upload `{@test.doc}` for the field without a label
    And I click the `The legal representative` label
    And I select `Time extension` for the `Type of application` field
    And I type `some application reason` for the `Reason for application` field
    And I select `{$TODAY-5|DD-MM-YYYY}` for the `Date application was made` field
    And I click the `Granted` label
    And I type `some application decision reason` for the `Reasons for decision` field

    Then the `Continue` button is enabled

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `test.doc` in the `Application email` field
    And I should see `The legal representative` in the `Application from` field
    And I should see `Time extension` in the `Type of application` field
    And I should see `some application reason` in the `Reason for application` field
    And I should see `{$TODAY-5|D MMM YYYY}` in the `Date application was made` field
    And I should see `Granted` in the `Application decision` field
    And I should see `some application decision reason` in the `Reasons for decision` field

    When I click the `Record application` button
    Then I should see the text `You have recorded an application`
    And I should see the text `What happens next`
    And I should see the text `You must now change the direction due date. You can also view the application decision in the Applications tab.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Record an application`

    When I click the `Overview` tab
    Then I should see the text `You must now change the direction due date. You can also view the application decision in the Applications tab.`

    When I click the `Applications` tab
    Then I should see the `Applications` field
    And I should see the `Record an application` link
    And within the `Applications` collection's first item, I should see `test.doc` for the `Application email` field
    And within the `Applications` collection's first item, I should see `The legal representative` for the `Application from` field
    And within the `Applications` collection's first item, I should see `Time extension` for the `Type of application` field
    And within the `Applications` collection's first item, I should see `some application reason` for the `Reason of application` field
    And within the `Applications` collection's first item, I should see `{$TODAY-5|D MMM YYYY}` for the `Date application was made` field
    And within the `Applications` collection's first item, I should see `Granted` for the `Decision` field
    And within the `Applications` collection's first item, I should see `some application decision reason` for the `Reason of decision` field
    And within the `Applications` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date of decision` field
    And within the `Applications` collection's first item, I should see `In progress` for the `Status` field

    # record withdraw
    When I select the `Record an application` Next step
    Then I am on the `Record an application` page

    When I add an item to the `Application email` collection
    And within the `Application email` collection's first item, I upload `{@test.doc}` for the field without a label
    And I click the `The respondent` label
    And I select `Withdraw` for the `Type of application` field
    And I type `some application reason` for the `Reason for application` field
    And I select `{$TODAY|DD-MM-YYYY}` for the `Date application was made` field
    And I click the `Granted` label
    And I type `some application decision reason` for the `Reasons for decision` field

    Then the `Continue` button is enabled

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `test.doc` in the `Application email` field
    And I should see `The respondent` in the `Application from` field
    And I should see `Withdraw` in the `Type of application` field
    And I should see `some application reason` in the `Reason for application` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Date application was made` field
    And I should see `Granted` in the `Application decision` field
    And I should see `some application decision reason` in the `Reasons for decision` field

    When I click the `Record application` button
    Then I should see the text `You have recorded an application`
    And I should see the text `What happens next`
    And I should see the text `The application decision has been recorded and is now available in the applications tab. You must now end the appeal.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Record an application`

    When I click the `Overview` tab
    Then I should see the text `The application decision has been recorded and is now available in the applications tab. You must now end the appeal.`

    # Launch end-appeal
    When I click the `end the appeal` link
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

    When I click the `Applications` tab

    Then I should see the `Applications` field
    And within the `Applications` collection's first item, I should see `test.doc` for the `Application email` field
    And within the `Applications` collection's first item, I should see `The respondent` for the `Application from` field
    And within the `Applications` collection's first item, I should see `Withdraw` for the `Type of application` field
    And within the `Applications` collection's first item, I should see `some application reason` for the `Reason of application` field
    And within the `Applications` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Applications` collection's first item, I should see `Granted` for the `Decision` field
    And within the `Applications` collection's first item, I should see `some application decision reason` for the `Reason of decision` field
    And within the `Applications` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date of decision` field
    And within the `Applications` collection's first item, I should see `Completed` for the `Status` field

  @regression @record-application-transfer-and-edit @RIA-1485 @RIA-1654 @RIA-1500
  Scenario: Record granted transfer application and edit listing

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

    And I switch to be a `Case Officer`
    When I select the `Record an application` Next step
    Then I am on the `Record an application` page
    And I should see the text `The appellant or the respondent has made an application. Record the reasons and the outcome of the application. If the application has been granted, you may need to edit listing, edit direction due date or end the appeal.`
    And I should see the text `Attach a copy of the application email and any other communication.`
    And the `Continue` button is disabled

    When I add an item to the `Application email` collection
    And within the `Application email` collection's first item, I upload `{@test.doc}` for the field without a label
    And I click the `The legal representative` label
    And I select `Transfer` for the `Type of application` field
    And I type `some application reason` for the `Reason for application` field
    And I select `{$TODAY-5|DD-MM-YYYY}` for the `Date application was made` field
    And I click the `Granted` label
    And I type `some application decision reason` for the `Reasons for decision` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `test.doc` in the `Application email` field
    And I should see `The legal representative` in the `Application from` field
    And I should see `Transfer` in the `Type of application` field
    And I should see `some application reason` in the `Reason for application` field
    And I should see `{$TODAY-5|D MMM YYYY}` in the `Date application was made` field
    And I should see `Granted` in the `Application decision` field
    And I should see `some application decision reason` in the `Reasons for decision` field

    When I click the `Record application` button
    Then I should see the text `You have recorded an application`
    And I should see the text `What happens next`
    And I should see the text `The application decision has been recorded and is now available in the applications tab. Contact the listing team to relist the case. Once the case has been relisted, a new hearing notice will be issued.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Record an application`

    When I click the `Overview` tab
    Then I should see the text `The application decision has been recorded and is now available in the applications tab. Contact the listing team to relist the case. Once the case has been relisted, a new hearing notice will be issued.`

    # edit listing
    When I switch to be a `Admin Officer`
    And I select the `Edit case listing` Next step

    Then I am on the `Edit case listing` page

    When I select `6 hours` for the `Length of hearing` field
    And I select `Manchester` for the `Hearing centre` field
    And I select `{$TODAY+14|DD-MM-YYYY} 10:30:00` for the `Hearing date and time` field
    And I click the `Continue` button
    And I click the `List case` button
    And I click the `Close and Return to case details` button
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_prepareForHearing` case progress image
    And  I should see the text `The hearing notice will be sent to all parties.`
    And  I should see the text `You don’t need to do any more on this case.`

    When I switch to be a `Case Officer`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_prepareForHearing` case progress image
    And I should see the text `You must create a case summary for the judge to use at the hearing.`

    When I click the `Applications` tab
    Then I should see the `Applications` field
    And I should see the `Record an application` link
    And within the `Applications` collection's first item, I should see `test.doc` for the `Application email` field
    And within the `Applications` collection's first item, I should see `The legal representative` for the `Application from` field
    And within the `Applications` collection's first item, I should see `Transfer` for the `Type of application` field
    And within the `Applications` collection's first item, I should see `some application reason` for the `Reason of application` field
    And within the `Applications` collection's first item, I should see `{$TODAY-5|D MMM YYYY}` for the `Date application was made` field
    And within the `Applications` collection's first item, I should see `Granted` for the `Decision` field
    And within the `Applications` collection's first item, I should see `some application decision reason` for the `Reason of decision` field
    And within the `Applications` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date of decision` field
    And within the `Applications` collection's first item, I should see `Completed` for the `Status` field

  @regression @record-application-error @RIA-1485
  Scenario Outline: Record application in wrong state

    When I select the `Record an application` Next step
    Then I am on the `Record an application` page
    And I should see the text `The appellant or the respondent has made an application. Record the reasons and the outcome of the application. If the application has been granted, you may need to edit listing, edit direction due date or end the appeal.`
    And I should see the text `Attach a copy of the application email and any other communication.`

    And the `Continue` button is disabled

    When I add an item to the `Application email` collection
    And within the `Application email` collection's first item, I upload `{@test.doc}` for the field without a label
    And I click the `The legal representative` label
    And I select <applicationType> for the `Type of application` field
    And I type `some application reason` for the `Reason for application` field
    And I select `{$TODAY-3|DD-MM-YYYY}` for the `Date application was made` field
    And I click the `Granted` label
    And I type `some application decision reason` for the `Reasons for decision` field

    Then the `Continue` button is enabled

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `test.doc` in the `Application email` field
    And I should see `The legal representative` in the `Application from` field
    And I should see <applicationType> in the `Type of application` field
    And I should see `some application reason` in the `Reason for application` field
    And I should see `{$TODAY-3|D MMM YYYY}` in the `Date application was made` field
    And I should see `Granted` in the `Application decision` field
    And I should see `some application decision reason` in the `Reasons for decision` field

    When I click the `Record application` button
    Then I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see an error in summary saying `You can't record application with '<applicationType>' type when case is in 'APPEAL_SUBMITTED' state`

    Examples:
      | applicationType |
      | Transfer        |
      | Adjourn         |
      | Expedite        |
