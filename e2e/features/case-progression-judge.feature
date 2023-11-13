Feature: Case progression - Judge

  @case-progression @case-progression-judge @RIA-1360 @RIA-1939
  Scenario: Case progression information is displayed for each case state for Judge

    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal

    When I switch to be a `Judge`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_appealSubmitted` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Tribunal Caseworker will review the appeal and decide if it's valid.`

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

    And I request respondent evidence

    When I switch to be a `Judge`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_awaitingRespondentEvidence_preUpload` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Home Office will prepare their bundle.`

    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    And I click the `upload the Home Office bundle` link
    And I add an item to the `Upload Home Office bundle` collection
    And within the `Upload Home Office bundle` collection's first item, I upload `{@Evidence1.pdf}` for the `Document` field
    And within the `Upload Home Office bundle` collection's first item, I type `This is the respondent evidence` for the `Describe the document` field
    And I click the `Continue` button
    And I click the `Upload` button
    And  I click the `Close and Return to case details` button if present

    When I switch to be a `Judge`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_awaitingRespondentEvidence_postUpload` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Tribunal Caseworker will review the Home Office bundle.`

    When I switch to be a `Case Officer`
    And I upload respondent evidence

    When I switch to be a `Judge`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_caseBuilding` case progress image
    And I should see the text `What happens next`
    And I should see the text `The appellant will build their case.`

    And I switch to be a `Legal Org User Rep A`
    And I build my case

    # Because Save and Continue is false 
    # When I switch to be a `Judge`
    # And I click the `Overview` tab

    # Then I should only see the `caseOfficer_caseBuilding` case progress image
    # And I should see the text `What happens next`
    # And I should see the text `The appellant will build their case.`

    And I switch to be a `Legal Org User Rep A`
    And I submit my case

    When I switch to be a `Judge`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_caseUnderReview` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Tribunal Caseworker will review the case submitted by the appellant.`

    And I switch to be a `Case Officer`
    And I request respondent review

    When I switch to be a `Judge`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_respondentReviewStarted` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Home Office will review the case submitted by the appellant.`

    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    And I click the `add the Home Office's response` link
    And I select `Decision maintained` for the `Outcome` field
    And I click the `Continue` button
    And I upload `{@AppealResponse.pdf}` for the `Upload the appeal response` field
    And I type `This is the appeal response` for the `Describe the document (Optional)` field
    And I add an item to the `Add any additional evidence here (Optional)` collection
    And within the `Add any additional evidence here (Optional)` collection's first item, I upload `{@Evidence1.pdf}` for the `Document (Optional)` field
    And within the `Add any additional evidence here (Optional)` collection's first item, I type `This is the evidence` for the `Describe the document (Optional)` field
    And I click the `Continue` button
    And I click the `Upload` button
    And I click the `Close and Return to case details` button if present

    When I switch to be a `Judge`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_respondentReview_submittedResponse` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Tribunal Caseworker will review the Home Office response.`

    And I switch to be a `Case Officer`
    And I request appellant review

    When I switch to be a `Judge`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_respondentReview_appealResponseAvailable` case progress image
    And I should see the text `What happens next`
    And I should see the text `The appellant has been directed to review the Home Office response.`
    And I should see the text `If they do not respond within 5 working days of the direction, the case automatically proceeds to a hearing.`

    And I switch to be a `Case Officer`
    And I request hearing requirements

    When I switch to be a `Judge`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_submitHearingRequirements` case progress image
    And I should see the text `What happens next`
    And I should see the text `The appellant will submit their hearing requirements.`

    And I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all yes when in country

    When I switch to be a `Judge`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_reviewHearingRequirements` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Tribunal Caseworker will agree what adjustments the Tribunal will make.`

    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path

    When I switch to be a `Judge`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_listing` case progress image
    And I should see the text `What happens next`
    And I should see the text `The agreed hearing requirements and adjustments have been recorded.`
    And I should see the text `The listing team will now list the case.`

    And I switch to be a `Admin Officer`
    And I list the case

    When I switch to be a `Judge`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_prepareForHearing` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Notice of Hearing will be sent to all parties.`

    And I switch to be a `Case Officer`
    And I create case summary

    When I switch to be a `Judge`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_finalBundling` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Tribunal Caseworker will generate a hearing bundle for all parties to use at the hearing.`

    And I switch to be a `Case Officer`
    And I generate the hearing bundle

    When I switch to be a `Judge`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_preHearing` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Tribunal Caseworker will set up the Decision and Reasons document.`

    And I switch to be a `Case Officer`
    And I start decision and reasons

    When I switch to be a `Judge`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_decision` case progress image

    And I should see the text `Do this next`
    And I should see the text `Prepare the Decision and Reasons document`
    And I click the `Prepare the Decision and Reasons document` link
    And I am on the `Prepare Decision and Reasons` page

    And I switch to be a `Case Officer`
    And I click the `Overview` tab
    And I should see the text `What happens next`
    And I should see the text `The judge will complete the Decision and Reasons document and upload it to the service.`
    And I should see the text `Both parties will be notified when it's available to view and download from the Documents tab.`
    And I prepare decision and reasons
    And I click the `Overview` tab
    Then I should only see the `caseOfficer_decision` case progress image
    And I should see the text `What happens next`
    And I should see the text `The judge will complete the Decision and Reasons document and upload it to the service.`
    And I should see the text `Both parties will be notified when it's available to view and download from the Documents tab.`

    When I switch to be a `Judge`
    And I click the `Overview` tab
    Then I should only see the `caseOfficer_decision` case progress image
    And I should see the text `Do this next`
    And I should see the text `Go to the Documents tab to download and complete the Decision and Reasons document.`
    And I should see the text `You should then upload and send the completed document.`

    And I click the `upload and send` link
    And I am on the `Complete decision and reasons` page
    And I click the `Cancel` link
    And I send decision and reasons
    And I click the `Overview` tab
    Then I should only see the `appeal_allowed` case progress image
    And I should see the text `What happens next`
    And I should see the text `No further action required.`

    And I switch to be a `Admin Officer`
    And I click the `Overview` tab
    Then I should only see the `appeal_allowed` case progress image
    And I should see the text `Do this next`
    And I should see the text `Record the attendees and duration of the hearing`
    And I should see the text `Record attendees and duration`

    And I switch to be a `Case Officer`
    And I click the `Overview` tab
    Then I should only see the `appeal_allowed` case progress image
    And I should see the text `Do this next`
    And I should see the text `The case has been decided. Either party has the right to appeal this decision, they have 14 days from the date of decision to do this.`

    And I switch to be a `Legal Org User Rep A`
    And I click the `Overview` tab
    Then I should only see the `appeal_allowed` case progress image
    And I should see the text `What happens next`
    And I should see the text `The appeal has been decided. You have the right to apply for permission to appeal to the Upper Tribunal.`
    And I should see the text `You have 14 days to apply from the date the Decision and Reasons document was uploaded.`
    Then I should see the `apply for permission to appeal` link
    And I click the `apply for permission to appeal` link
    Then I should see the text `Apply for permission to appeal`
