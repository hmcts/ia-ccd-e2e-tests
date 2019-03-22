Feature: Case progression

  @case-progression @RIA-908 @RIA-909 @RIA-910 @RIA-911 @RIA-912 @RIA-914 @RIA-915 @RIA-905 @RIA-653 @RIA-944 @RIA-985 @RIA-412
  Scenario: Case progression information is displayed for each case state (contextalised to Case Officer or Legal Rep)

    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal

    ### appeal started

    # LR:

    When I click the `Overview` tab

    Then I should not see the image `legalRep_appealSubmitted.png`

    And I should see the image `legalRep_appealStarted.png`
    And I should see the text `Do this next`
    And I should see the text `You still need to submit your appeal`
    And I should see the text `You can also review and edit your appeal`

    And I should see the option `Edit appeal` for the `Next step` field
    And I should see the option `Submit your appeal` for the `Next step` field

    When I click the `Submit your appeal` link
    Then I am on the `Submit your appeal` page
    And I click the `Cancel` link

    When I click the `Overview` tab
    And I click the `Edit appeal` link
    Then I am on the `Edit appeal` page
    And I click the `Cancel` link

    ### appeal submitted

    # LR:

    When I submit my appeal
    And I click the `Overview` tab

    Then I should not see the image `legalRep_appealStarted.png`
    And I should not see the image `caseOfficer_appealSubmitted.png`
    And I should not see the image `legalRep_awaitingRespondentEvidence.png`

    And I should see the image `legalRep_appealSubmitted.png`
    And I should see the text `Do this next`
    And I should see the text `You have submitted your appeal`
    And I should see the text `You don't need to do anything else right now`

    And I should not see the `Next step` field

    # CO:

    When I switch to be a `Case Officer`
    And I click the `Overview` tab

    Then I should not see the image `legalRep_appealSubmitted.png`
    And I should not see the image `caseOfficer_awaitingRespondentEvidence.png`

    And I should see the image `caseOfficer_appealSubmitted.png`
    And I should see the text `Do this next`
    And I should see the text `You must review the appeal in the documents tab`
    And I should see the text `tell the respondent to supply their evidence`

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change the direction due date` for the `Next step` field
    And I should see the option `Request respondent evidence` for the `Next step` field

    When I click the `Request respondent evidence` link
    Then I am on the `Request respondent evidence` page
    And I click the `Cancel` link

    ### awaiting respondent evidence

    When I request respondent evidence
    And I click the `Overview` tab

    Then I should not see the image `caseOfficer_appealSubmitted.png`
    And I should not see the image `legalRep_awaitingRespondentEvidence.png`
    And I should not see the image `caseOfficer_caseBuilding.png`

    And I should see the image `caseOfficer_awaitingRespondentEvidence.png`
    And I should see the text `Do this next`
    And I should see the text `Upload the respondent's evidence as soon as you receive it`

    And I should not see the option `Build your case` for the `Next step` field

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change the direction due date` for the `Next step` field
    And I should see the option `Upload respondent evidence` for the `Next step` field

    When I click the `Upload respondent evidence` link
    Then I am on the `Upload respondent evidence` page
    And I click the `Cancel` link

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab

    Then I should not see the image `legalRep_appealSubmitted.png`
    And I should not see the image `caseOfficer_awaitingRespondentEvidence.png`
    And I should not see the image `legalRep_caseBuilding.png`

    And I should see the image `legalRep_awaitingRespondentEvidence.png`
    And I should see the text `Do this next`
    And I should see the text `You'll get an email when the respondent evidence is available in the documents tab`

    And I should not see the option `Send direction` for the `Next step` field
    And I should not see the option `Change the direction due date` for the `Next step` field
    And I should not see the option `Upload respondent evidence` for the `Next step` field
    And I should not see the option `Submit your case` for the `Next step` field

    And I should see the option `Build your case` for the `Next step` field

    When I click the `Build your case` link
    Then I am on the `Build your case` page
    And I click the `Cancel` link

    ### case building, not ready to submit

    # CO:

    When I switch to be a `Case Officer`
    And I upload respondent evidence
    And I click the `Overview` tab

    Then I should not see the image `caseOfficer_awaitingRespondentEvidence.png`
    And I should not see the image `legalRep_caseBuilding.png`
    And I should not see the image `caseOfficer_caseUnderReview.png`
    And I should not see the `Request respondent review` link
    And I should not see the `Request case edit` link

    And I should see the image `caseOfficer_caseBuilding.png`
    And I should see the text `Do this next`
    And I should see the text `Wait for the appellant to submit their built case`

    And I should not see the option `Build your case` for the `Next step` field
    And I should not see the option `Submit your case` for the `Next step` field
    And I should not see the option `Upload respondent evidence` for the `Next step` field

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change the direction due date` for the `Next step` field

    When I click the `Change the direction due date` link
    Then I am on the `Change the direction due date` page
    And I click the `Cancel` link

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab

    Then I should not see the image `legalRep_awaitingRespondentEvidence.png`
    And I should not see the image `caseOfficer_caseBuilding.png`
    And I should not see the image `legalRep_caseUnderReview.png`

    And I should see the image `legalRep_caseBuilding.png`
    And I should see the text `Do this next`
    And I should see the text `The respondent evidence is now available in the documents tab`
    And I should not see the text `submit your case`

    And I should not see the option `Send direction` for the `Next step` field
    And I should not see the option `Change the direction due date` for the `Next step` field

    And I should see the option `Build your case` for the `Next step` field
    And I should see the option `Submit your case` for the `Next step` field

    When I click the `Build your case` link
    Then I am on the `Build your case` page
    And I click the `Cancel` link

    ### case building, ready to submit

    # LR:

    When I build my case
    And I click the `Overview` tab

    And I should not see the image `legalRep_awaitingRespondentEvidence.png`
    Then I should not see the image `caseOfficer_caseBuilding.png`
    And I should not see the image `legalRep_caseUnderReview.png`

    And I should see the image `legalRep_caseBuilding.png`
    And I should see the text `Do this next`
    And I should see the text `If you're not yet ready for your case to be reviewed, continue to build your case`
    And I should see the text `If you're ready for your case to be reviewed, submit your case`

    And I should not see the option `Send direction` for the `Next step` field
    And I should not see the option `Change the direction due date` for the `Next step` field

    And I should see the option `Build your case` for the `Next step` field
    And I should see the option `Submit your case` for the `Next step` field

    When I click the `build your case` link
    Then I am on the `Build your case` page
    And I click the `Cancel` link

    When I click the `Overview` tab

    And I click the `submit your case` link
    Then I am on the `Submit your case` page
    And I click the `Cancel` link

    ### case under review

    # LR:

    When I submit my case
    And I click the `Overview` tab

    Then I should not see the image `legalRep_caseBuilding.png`
    And I should not see the image `caseOfficer_caseUnderReview.png`
    And I should not see the image `legalRep_respondentReview.png`
    And I should not see the `Request respondent review` link
    And I should not see the `Request case edit` link

    And I should see the image `legalRep_caseUnderReview.png`
    And I should see the text `Do this next`
    And I should see the text `Your case is now under review`
    And I should see the text `You'll get an email telling you what happens next`

    And I should not see the option `Build your case` for the `Next step` field
    And I should not see the option `Submit your case` for the `Next step` field

    And I should see the option `Upload additional evidence` for the `Next step` field

    # CO:

    When I switch to be a `Case Officer`
    And I click the `Overview` tab

    Then I should not see the image `caseOfficer_caseBuilding.png`
    And I should not see the image `legalRep_caseUnderReview.png`
    And I should not see the image `caseOfficer_respondentReview.png`

    And I should see the image `caseOfficer_caseUnderReview.png`
    And I should see the text `Do this next`
    And I should see the text `The appellant has submitted their built case`
    And I should see the text `send it to the respondent for their review`
    And I should see the text `If the appellant needs to make any changes, you can direct them to edit the case`

    And I should not see the option `Upload additional evidence` for the `Next step` field

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change the direction due date` for the `Next step` field
    And I should see the option `Request case edit` for the `Next step` field
    And I should see the option `Request respondent review` for the `Next step` field

    When I click the `Request respondent review` link
    Then I am on the `Request respondent review` page
    And I click the `Cancel` link

    When I click the `Overview` tab

    When I click the `Request case edit` link
    Then I am on the `Request case edit` page
    And I click the `Cancel` link

    ### respondent review, no appeal response

    When I request respondent review
    And I click the `Overview` tab

    Then I should not see the image `caseOfficer_caseUnderReview.png`
    And I should not see the image `legalRep_respondentReview.png`
    And I should not see the image `caseOfficer_respondentReview_appealResponseAvailable.png`
    And I should not see the image `caseOfficer_submitHearingRequirements.png`

    And I should see the image `caseOfficer_respondentReview.png`
    And I should see the text `Do this next`
    And I should see the text `Upload the Home Office's appeal response as soon as you receive it`

    And I should not see the option `Request case edit` for the `Next step` field
    And I should not see the option `Request respondent review` for the `Next step` field
    And I should not see the option `Upload additional evidence` for the `Next step` field

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change the direction due date` for the `Next step` field
    And I should see the option `Add appeal response` for the `Next step` field
    And I should see the option `Request hearing requirements` for the `Next step` field

    When I click the `Add appeal response` link
    Then I am on the `Add appeal response` page
    And I click the `Cancel` link

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab

    Then I should not see the image `legalRep_caseUnderReview.png`
    And I should not see the image `caseOfficer_respondentReview.png`
    And I should not see the image `legalRep_submitHearingRequirements.png`

    And I should see the image `legalRep_respondentReview.png`
    And I should see the text `Do this next`
    And I should see the text `The case has now been sent to the respondent for review`
    And I should see the text `If you want to reply to the response, you should contact the case officer within 5 days`
    And I should see the text `If you don't respond within 5 days, the case will proceed to a hearing`

    And I should not see the option `Send direction` for the `Next step` field
    And I should not see the option `Change the direction due date` for the `Next step` field
    And I should not see the option `Add appeal response` for the `Next step` field
    And I should not see the option `Request hearing requirements` for the `Next step` field

    And I should see the option `Upload additional evidence` for the `Next step` field

    ### respondent review, appeal response added

    # CO:

    And I switch to be a `Case Officer`
    And I add the appeal response
    And I click the `Overview` tab

    Then I should not see the image `caseOfficer_respondentReview.png`
    And I should not see the image `legalRep_respondentReview.png`
    And I should not see the image `caseOfficer_submitHearingRequirements.png`

    And I should see the image `caseOfficer_respondentReview_appealResponseAvailable.png`
    And I should see the text `Do this next`
    And I should see the text `The legal rep has been instructed to review the Home Office response`
    And I should see the text `If they don't respond within 5 days, the case proceeds to hearing`

    And I should not see the option `Upload additional evidence` for the `Next step` field

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change the direction due date` for the `Next step` field
    And I should see the option `Add appeal response` for the `Next step` field
    And I should see the option `Request hearing requirements` for the `Next step` field

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab

    Then I should not see the image `legalRep_caseUnderReview.png`
    And I should not see the image `caseOfficer_respondentReview.png`
    And I should not see the image `legalRep_submitHearingRequirements.png`

    And I should see the image `legalRep_respondentReview.png`
    And I should see the text `Do this next`
    And I should see the text `The case has now been sent to the respondent for review`
    And I should see the text `If you want to reply to the response, you should contact the case officer within 5 days`
    And I should see the text `If you don't respond within 5 days, the case will proceed to a hearing`

    And I should not see the option `Send direction` for the `Next step` field
    And I should not see the option `Change the direction due date` for the `Next step` field
    And I should not see the option `Add appeal response` for the `Next step` field
    And I should not see the option `Request hearing requirements` for the `Next step` field

    And I should see the option `Upload additional evidence` for the `Next step` field

    ### listing

    # CO:

    When I switch to be a `Case Officer`
    And I request hearing requirements
    And I click the `Overview` tab

    And I should not see the option `Add appeal response` for the `Next step` field
    And I should not see the option `Request hearing requirements` for the `Next step` field
    And I should not see the option `Upload additional evidence` for the `Next step` field

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change the direction due date` for the `Next step` field
    And I should see the option `List the case` for the `Next step` field

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab

    And I should not see the option `Send direction` for the `Next step` field
    And I should not see the option `Change the direction due date` for the `Next step` field
    And I should not see the option `List the case` for the `Next step` field

    And I should see the option `Upload additional evidence` for the `Next step` field

    ### prepare for hearing

    # CO:

    When I switch to be a `Case Officer`
    And I list the case
    And I click the `Overview` tab

    And I should not see the option `List the case` for the `Next step` field

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change the direction due date` for the `Next step` field

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab

    And I should not see the `Next step` field
