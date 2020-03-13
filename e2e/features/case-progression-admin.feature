Feature: Case progression - Admin Officer

  @case-progression @case-progression-admin @RIA-1360 @RIA-1939
  Scenario: Case progression information is displayed for each case state for Admin Officer

    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_appealSubmitted` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Tribunal Caseworker will review the appeal and decide if it's valid.`

    When I switch to be a `Case Officer`
    And I request respondent evidence

    When I switch to be a `Admin Officer`
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
    And  I click the `Close and Return to case details` button

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_awaitingRespondentEvidence_postUpload` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Tribunal Caseworker will review the Home Office bundle.`

    When I switch to be a `Case Officer`
    And I upload respondent evidence

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_caseBuilding` case progress image
    And I should see the text `What happens next`
    And I should see the text `The appellant will build their case.`

    And I switch to be a `Legal Rep`
    And I build my case

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_caseBuilding` case progress image
    And I should see the text `What happens next`
    And I should see the text `The appellant will build their case.`

    And I switch to be a `Legal Rep`
    And I submit my case

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_caseUnderReview` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Tribunal Caseworker will review the case submitted by the appellant.`

    And I switch to be a `Case Officer`
    And I request respondent review

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_respondentReviewStarted` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Home Office will review the case submitted by the appellant.`

    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    And I click the `add the Home Office's response` link
    And I upload `{@AppealResponse.pdf}` for the `Upload the appeal response` field
    And I type `This is the appeal response` for the `Describe the document (Optional)` field
    And I add an item to the `Add any additional evidence here (Optional)` collection
    And within the `Add any additional evidence here (Optional)` collection's first item, I upload `{@Evidence1.pdf}` for the `Document (Optional)` field
    And within the `Add any additional evidence here (Optional)` collection's first item, I type `This is the evidence` for the `Describe the document (Optional)` field
    And I click the `Continue` button
    And I click the `Upload` button
    And I click the `Close and Return to case details` button

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_respondentReview_submittedResponse` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Tribunal Caseworker will review the Home Office response.`

    And I switch to be a `Case Officer`
    And I request appellant review

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_respondentReview_appealResponseAvailable` case progress image
    And I should see the text `What happens next`
    And I should see the text `The appellant has been directed to review the Home Office response.`
    And I should see the text `If they do not respond within 5 working days of the direction, the case automatically proceeds to a hearing.`

    And I switch to be a `Case Officer`
    And I request hearing requirements

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_submitHearingRequirements` case progress image
    And I should see the text `What happens next`
    And I should see the text `The appellant will submit their hearing requirements.`

    And I switch to be a `Legal Rep`
    And I submit hearing requirements with all yes

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab

    Then I should only see the `adminOfficer_listing_submittedRequirements` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Tribunal Caseworker will agree what adjustments the Tribunal will make.`

    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_listing` case progress image

    And I should see the text `Do this next`
    And I should see the text `The agreed hearing requirements and dates to avoid are available to view in the Hearing tab.`
    And I should see the text `When the case has been listed in Aria, you should list the case here.`

    And I list the case

    And I click the `Overview` tab

    Then I should only see the `caseOfficer_prepareForHearing` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Notice of Hearing will be sent to all parties.`

    And I switch to be a `Case Officer`
    And I create case summary

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_finalBundling` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Tribunal Caseworker will generate a hearing bundle for all parties to use at the hearing.`

    And I switch to be a `Case Officer`
    And I generate the hearing bundle

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_preHearing` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Tribunal Caseworker will generate the Decision and Reasons document.`

    And I switch to be a `Case Officer`
    And I start decision and reasons

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_decision` case progress image

    And I should see the text `Do this next`
    And I should see the text `Record the attendees and duration of the hearing.`

    And I switch to be a `Case Officer`
    And I prepare decision and reasons

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_decision` case progress image
    And I should see the text `Do this next`
    And I should see the text `Record the attendees and duration of the hearing.`

    And I switch to be a `Admin Officer`
    And I send decision and reasons
    And I click the `Overview` tab
    Then I should only see the `appeal_allowed` case progress image
    And I should see the text `Do this next`
    And I should see the text `Record the attendees and duration of the hearing`
    And I should see the text `Record attendees and duration`

    When I click the `Record attendees and duration` link
    And I type `Judge Judy` for the `The judge` field
    And I type `2` for the `Hours` field
    And I type `30` for the `Minutes` field
    And I click the `Continue` button
    And I click the `Save details` button
    And I click the `Close and Return to case details` button
    And I click the `Overview` tab

    Then I should only see the `appeal_allowed` case progress image
    And I should see the text `The case has been decided. Either party has the right to appeal this decision, they have 14 days from the date of decision to do this.`
