Feature: Case progression

  @case-progression @RIA-574 @RIA-908 @RIA-909 @RIA-910 @RIA-911 @RIA-912 @RIA-914 @RIA-915 @RIA-905 @RIA-653 @RIA-944 @RIA-985 @RIA-412 @RIA-364 @RIA-1534 @RIA-1568
  @RIA-1571 @RIA-1561 @RIA-1560 @RIA-1284 @RIA-1609 @RIA-1485 @RIA-572 @RIA-1622 @RIA-1563 @RIA-1564 @RIA-1565 @RIA-1707 @RIA-1789 @RIA-1799 @RIA-1357 @RIA-1709
  Scenario: Case progression information is displayed for each case state (contextualised to Case Officer, Admin Officer, Legal Rep or Home Office)

    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal

    ### appeal started

    # LR:

    When I click the `Overview` tab

    Then I should only see the `legalRep_appealStarted` case progress image

    And I should see the text `Do this next`
    And I should see the text `You still need to submit your appeal`
    And I should see the text `You can also review and edit your appeal`

    And I should see the case details
    And I should not see the hearing details

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

    Then I should only see the `legalRep_appealSubmitted` case progress image

    And I should see the text `Do this next`
    And I should see the text `You have submitted your appeal`
    And I should see the text `You don't need to do anything else right now`

    And I should see the case details
    And I should not see the hearing details

    And I should not see the `Next step` field

    # CO:

    When I switch to be a `Case Officer`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_appealSubmitted` case progress image

    And I should see the text `Do this next`
    And I should see the text `You must review the appeal in the documents tab`
    And I should see the text `tell the respondent to supply their evidence`

    And I should see the case details
    And I should not see the hearing details

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change the direction due date` for the `Next step` field
    And I should see the option `Request respondent evidence` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field

    When I click the `Request respondent evidence` link
    Then I am on the `Request respondent evidence` page
    And I click the `Cancel` link

    ### awaiting respondent evidence

    When I request respondent evidence
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_awaitingRespondentEvidence_preUpload` case progress image
    And I should see the text `Do this next`
    And I should see the text `Await the respondent's evidence.`
    And I should not see the `Upload respondent evidence` link

    And I should see the case details
    And I should not see the hearing details

    And I should not see the option `Build your case` for the `Next step` field

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change the direction due date` for the `Next step` field
    And I should see the option `Upload respondent evidence` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab

    Then I should only see the `legalRep_awaitingRespondentEvidence` case progress image

    And I should see the text `Do this next`
    And I should see the text `You'll get an email when the respondent evidence is available in the documents tab`

    And I should see the case details
    And I should not see the hearing details

    And I should not see the option `Send direction` for the `Next step` field
    And I should not see the option `Change the direction due date` for the `Next step` field
    And I should not see the option `Upload respondent evidence` for the `Next step` field
    And I should not see the option `Submit your case` for the `Next step` field
    And I should not see the option `Add case note` for the `Next step` field
    And I should not see the option `Record an application` for the `Next step` field

    And I should see the option `Build your case` for the `Next step` field

    When I click the `Build your case` link
    Then I am on the `Build your case` page
    And I click the `Cancel` link

    # HO APC - upload respondent evidence

    When I switch to be a `Home Office APC`
    And I click the `Overview` tab

    Then I should only see the `homeOffice_uploadBundle` case progress image

    And I should see the text `Do this next`
    And I should see the text `An appeal against the Home Office decision in this case has been submitted. You can view the appeal form in the documents tab`
    And I should see the text `If you accept that there is a right of appeal you should upload the Home Office bundle`
    And I should see the text `If you consider the appeal is not valid, you should contact the Tribunal and the appellant with your reasons`

    And I should see the case details
    And I should not see the hearing details

    And I should not see the option `Send direction` for the `Next step` field
    And I should not see the option `Change the direction due date` for the `Next step` field
    And I should see the option `Upload Home Office bundle` for the `Next step` field
    And I should not see the option `Submit your case` for the `Next step` field
    And I should not see the option `Add case note` for the `Next step` field
    And I should not see the option `Record an application` for the `Next step` field
    And I should not see the option `Build your case` for the `Next step` field

    When I click the `upload the Home Office bundle` link
    Then I am on the `Upload Home Office bundle` page
    And I add an item to the `Upload Home Office bundle` collection
    And within the `Upload Home Office bundle` collection's first item, I upload `{@Evidence1.pdf}` for the `Document` field
    And within the `Upload Home Office bundle` collection's first item, I type `This is the respondent evidence` for the `Describe the document` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And within the `Upload Home Office bundle` collection's first item, I should see `Evidence1.pdf` for the `Document` field
    And within the `Upload Home Office bundle` collection's first item, I should see `This is the respondent evidence` in the `Describe the document` field

    When I click the `Upload` button
    Then I should see the text `You've uploaded the Home Office bundle`
    And I should see the text `What happens next`
    And I should see the text `The Home Office will be notified when the Appeal Skeleton Argument is ready to review.`
    And  I click the `Close and Return to case details` button

    And I click the `Overview` tab
    Then I should only see the `homeOffice_awaitAppealSkeletonArgument` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Tribunal will:`
    And I should see the text `check that the bundle complies with the Procedural Rules and Practice Directions`
    And I should see the text `inform you of any issues`
    And I should see the text `The Home Office will be notified when the Appeal Skeleton Argument is ready to review`

    ### direct legal rep to build case

    # CO - notify Respondent to amend the HO bundle

    When I switch to be a `Case Officer`
    And I click the `Overview` tab

    Then I should see the text `If it complies with the procedure rules and practice directions, direct the legal representative to build their case.`
    Then I should see the text `If it does not comply, direct the respondent to make the appropriate changes.`

    And I click the `direct the respondent to make the appropriate changes` link
    Then I am on the `Send direction` page
    When I type `Amend the evidence` for the `Explain the direction you are issuing` field
    And I select `Respondent` for the `Who are you giving the direction to?` field
    And I type `31-12-2019` for the `By what date must they comply?` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Amend the evidence` for the `Explain the direction you are issuing` answer
    And I should see `Respondent` for the `Who are you giving the direction to?` answer
    And I should see `31 Dec 2019` for the `By what date must they comply?` answer

    When I click the `Send direction` button
    Then I should see the text `You have sent a direction`
    Then I should see the text `What happens next`
    Then I should see the text `You can see the status of the direction in the directions tab`

    When I click the `directions tab` link
    Then I should see the `Directions` field
    And within the `Directions` collection's first item, I should see `Amend the evidence` for the `Explanation` field
    And within the `Directions` collection's first item, I should see `Respondent` for the `Parties` field
    And within the `Directions` collection's first item, I should see `31 Dec 2019` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

    # HO - APC user amend HO bundle

    When I switch to be a `Home Office APC`
    And I click the `Overview` tab

    Then I should only see the `homeOffice_uploadBundle` case progress image

    And I should see the text `Do this next`
    And I should see the text `An appeal against the Home Office decision in this case has been submitted. You can view the appeal form in the documents tab`
    And I should see the text `If you accept that there is a right of appeal you should upload the Home Office bundle`
    And I should see the text `If you consider the appeal is not valid, you should contact the Tribunal and the appellant with your reasons`

    And I should see the case details
    And I should not see the hearing details

    And I should not see the option `Send direction` for the `Next step` field
    And I should not see the option `Change the direction due date` for the `Next step` field
    And I should see the option `Upload Home Office bundle` for the `Next step` field
    And I should not see the option `Submit your case` for the `Next step` field
    And I should not see the option `Add case note` for the `Next step` field
    And I should not see the option `Record an application` for the `Next step` field
    And I should not see the option `Build your case` for the `Next step` field

    When I click the `upload the Home Office bundle` link
    Then I am on the `Upload Home Office bundle` page
    And within the `Upload Home Office bundle` collection's first item, I upload `{@RespondentEvidenceUpdated.pdf}` for the `Document` field
    And within the `Upload Home Office bundle` collection's first item, I type `This is the updated evidence` for the `Describe the document` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `RespondentEvidenceUpdated.pdf` in the `Document` field
    And I should see `This is the updated evidence` in the `Describe the document` field

    When I click the `Upload` button
    Then I should see the text `You've uploaded the Home Office bundle`
    And I should see the text `What happens next`
    And I should see the text `The Home Office will be notified when the Appeal Skeleton Argument is ready to review.`

    When I click the `Close and Return to case details` button
    And I click the `Documents` tab
    Then I should see the `Documents` page
    And within the `Respondent documents` collection's first item, I should see `RespondentEvidenceUpdated.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the updated evidence` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And within the `Respondent documents` collection's second item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Respondent documents` collection's second item, I should see `This is the respondent evidence` in the `Description` field
    And within the `Respondent documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    ### case building, not ready to submit

    # CO - notify appellant to build the case

    And I switch to be a `Case Officer`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_awaitingRespondentEvidence_postUpload` case progress image

    And I should see the text `Do this next`
    And I should see the text `If it complies with the procedure rules and practice directions, direct the legal representative to build their case`
    And I should see the text `If it does not comply, direct the respondent to make the appropriate changes`

    And I should see the case details
    And I should not see the hearing details

    And I should not see the option `Build your case` for the `Next step` field
    And I should not see the option `Submit your case` for the `Next step` field
    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change the direction due date` for the `Next step` field
    And I should see the option `Request respondent evidence` for the `Next step` field
    And I should see the option `Upload respondent evidence` for the `Next step` field
    And I should see the option `Request case building` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field
    And I should see the option `End the appeal` for the `Next step` field

    And I click the `direct the legal representative to build their case` link
    And I click the `Continue` button
    And I click the `Send direction` button
    Then I should see the text `You have sent a direction`
    And I should see the text `What happens next`
    And I should see the text `Legal representative will be notified by email.`
    And I click the `Close and Return to case details` button

    And I click the `Overview` tab
    Then I should only see the `caseOfficer_caseBuilding` case progress image

    And I should not see the `Request respondent review` link
    And I should not see the `Request case edit` link

    And I should see the text `Do this next`
    And I should see the text `Wait for the appellant to submit their built case. If they ask for a time extension, you can respond by changing the due date on the direction`
    And I should see the `Change the direction due date` link

    And I should see the case details
    And I should not see the hearing details

    And I should not see the option `Build your case` for the `Next step` field
    And I should not see the option `Submit your case` for the `Next step` field
    And I should not see the option `Upload respondent evidence` for the `Next step` field
    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change the direction due date` for the `Next step` field
    And I should see the option `Add additional evidence` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field
    And I should see the option `End the appeal` for the `Next step` field

    When I click the `Change the direction due date` link
    Then I am on the `Change the direction due date` page
    And I click the `Cancel` link

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab

    Then I should only see the `legalRep_caseBuilding` case progress image

    And I should see the text `Do this next`
    And I should see the text `The respondent evidence is now available in the documents tab. You now need to build your case`
    And I should see the `Build your case` link
    And I should not see the text `submit your case`

    And I should see the case details
    And I should not see the hearing details

    And I should not see the option `Send direction` for the `Next step` field
    And I should not see the option `Change the direction due date` for the `Next step` field
    And I should not see the option `Add case note` for the `Next step` field
    And I should not see the option `Record an application` for the `Next step` field
    And I should not see the option `End the appeal` for the `Next step` field

    And I should see the option `Build your case` for the `Next step` field
    And I should see the option `Submit your case` for the `Next step` field

    When I click the `Build your case` link
    Then I am on the `Build your case` page
    And I click the `Cancel` link

    ### case building, ready to submit

    # LR:

    When I build my case
    And I click the `Overview` tab

    Then I should only see the `legalRep_caseBuilding` case progress image

    And I should see the text `Do this next`
    And I should see the text `If you're not yet ready for your case to be reviewed, continue to build your case`
    And I should see the text `If you're ready for your case to be reviewed, submit your case`

    And I should see the case details
    And I should not see the hearing details

    And I should not see the option `Send direction` for the `Next step` field
    And I should not see the option `Change the direction due date` for the `Next step` field
    And I should not see the option `Add case note` for the `Next step` field
    And I should not see the option `Record an application` for the `Next step` field

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

    Then I should only see the `legalRep_caseUnderReview` case progress image

    And I should see the text `Do this next`
    And I should see the text `Your case is now under review`
    And I should see the text `You'll get an email telling you what happens next`

    And I should not see the `Request respondent review` link
    And I should not see the `Request case edit` link

    And I should see the case details
    And I should not see the hearing details

    And I should not see the option `Build your case` for the `Next step` field
    And I should not see the option `Submit your case` for the `Next step` field
    And I should not see the option `Add case note` for the `Next step` field
    And I should not see the option `Record an application` for the `Next step` field

    And I should see the option `Upload additional evidence` for the `Next step` field

    # CO:

    When I switch to be a `Case Officer`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_caseUnderReview` case progress image

    And I should see the text `Do this next`
    And I should see the text `The appellant has submitted their built case`
    And I should see the text `send it to the respondent for their review`
    And I should see the text `If the appellant needs to make any changes, you can direct them to edit the case`

    And I should see the case details
    And I should not see the hearing details

    And I should not see the option `Upload additional evidence` for the `Next step` field

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change the direction due date` for the `Next step` field
    And I should see the option `Request case edit` for the `Next step` field
    And I should see the option `Request respondent review` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field

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

    Then I should only see the `caseOfficer_respondentReviewStarted` case progress image

    And I should see the text `Do this next`
    And I should see the text `The respondent is reviewing the case, you'll be notified when their response has been uploaded.`

    And I should see the case details
    And I should not see the hearing details

    And I should not see the option `Request case edit` for the `Next step` field
    And I should not see the option `Request respondent review` for the `Next step` field
    And I should not see the option `Upload additional evidence` for the `Next step` field

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab

    Then I should only see the `legalRep_respondentReview` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been sent to the respondent for review`
    And I should see the text `If you want to reply to the response, you should contact the case officer within 5 days`
    And I should see the text `If you don't respond within 5 days, the case will proceed to a hearing`

    And I should see the case details
    And I should not see the hearing details

    And I should not see the option `Send direction` for the `Next step` field
    And I should not see the option `Change the direction due date` for the `Next step` field
    And I should not see the option `Add appeal response` for the `Next step` field
    And I should not see the option `Request hearing requirements` for the `Next step` field
    And I should not see the option `Add case note` for the `Next step` field
    And I should not see the option `Record an application` for the `Next step` field

    And I should see the option `Upload additional evidence` for the `Next step` field

    ### respondent review, upload appeal response

    # HO:

    And I switch to be a `Home Office Generic`
    Then I click the `Overview` tab
    Then I should only see the `homeOffice_respondentReview` case progress image
    And I should see the text `Do this next`
    And I should see the text `Review the documents and add the Home Office's response, or contact the Tribunal for withdrawal of the decision.`
    And I upload the appeal response

    And I click the `Overview` tab
    Then I should only see the `homeOffice_appealResponseUploaded` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Tribunal will:`
    And I should see the text `check that the Home Office response complies with the Procedure Rules and Practice Direction`
    And I should see the text `inform you of any issues`
    And I should see the text `Providing there are no issues, the response will be shared with the appellant.`
    And I should see the text `All parties will be notified when the Hearing Notice is ready.`

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab

    Then I should only see the `legalRep_respondentReview` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been sent to the respondent for review`
    And I should see the text `If you want to reply to the response, you should contact the case officer within 5 days`
    And I should see the text `If you don't respond within 5 days, the case will proceed to a hearing`

    And I should see the case details
    And I should not see the hearing details

    And I should not see the option `Send direction` for the `Next step` field
    And I should not see the option `Change the direction due date` for the `Next step` field
    And I should not see the option `Add appeal response` for the `Next step` field
    And I should not see the option `Request hearing requirements` for the `Next step` field
    And I should not see the option `Add case note` for the `Next step` field
    And I should not see the option `Record an application` for the `Next step` field
    And I should see the option `Upload additional evidence` for the `Next step` field

    ### listing

    # CO:

    When I switch to be a `Case Officer`
    And I should see the text `Do this next`
    And I should see the text `The legal rep has been instructed to review the Home Office response. If they don't respond within 5 days, the case proceeds to hearing.`

    And I request hearing requirements
    Then I click the `Overview` tab
    And I should only see the `caseOfficer_listing` case progress image
    And I should see the text `Do this next`
    And I should see the text `The legal representative will send you the completed hearing requirements document by email.`
    And I should see the text `Add any comments or edits, and then sign the document to confirm the agreed hearing requirements.`
    And I should see the text `Email the completed hearing requirements document to IACReformlisting@justice.gov.uk so that the case can be listed.`
    And I should see the text `You’ll be notified when the case is listed and be able to view the hearing notice in the documents tab.`

    And I should see the case details
    And I should not see the hearing details

    And I should not see the option `Add appeal response` for the `Next step` field
    And I should not see the option `Request hearing requirements` for the `Next step` field
    And I should not see the option `Upload additional evidence` for the `Next step` field

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change the direction due date` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should not see the option `List the case` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab

    Then I should only see the `legalRep_listing` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case officer is reviewing the hearing requirements`
    And I should see the text `Once the requirements have been agreed with the Tribunal,`
    And I should see the text `the case will be listed and you will receive a notification with the hearing notice`

    And I should see the case details
    And I should not see the hearing details

    And I should not see the option `Send direction` for the `Next step` field
    And I should not see the option `Change the direction due date` for the `Next step` field
    And I should not see the option `List the case` for the `Next step` field
    And I should not see the option `Add case note` for the `Next step` field
    And I should not see the option `Record an application` for the `Next step` field

    And I should see the option `Upload additional evidence` for the `Next step` field

    # Home Office APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_listing` case progress image

    And I should see the text `Do this next`
    And I should see the text `check that the Home Office response complies with the Procedural Rules and Practice Directions`
    And I should see the text `inform you of any issues`
    And I should see the text `Providing there are no issues, the response will be shared with the appellant.`
    And I should see the text `All parties will be notified when the Hearing Notice is ready.`

    And I should see the case details
    And I should not see the hearing details

    # Home Office LART
    When I switch to be a `Home Office LART`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_listing` case progress image

    And I should see the text `Do this next`
    And I should see the text `check that the Home Office response complies with the Procedural Rules and Practice Directions`
    And I should see the text `inform you of any issues`
    And I should see the text `Providing there are no issues, the response will be shared with the appellant.`
    And I should see the text `All parties will be notified when the Hearing Notice is ready.`

    And I should see the case details
    And I should not see the hearing details

    # Home Office POU
    When I switch to be a `Home Office POU`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_listing` case progress image

    And I should see the text `Do this next`
    And I should see the text `check that the Home Office response complies with the Procedural Rules and Practice Directions`
    And I should see the text `inform you of any issues`
    And I should see the text `Providing there are no issues, the response will be shared with the appellant.`
    And I should see the text `All parties will be notified when the Hearing Notice is ready.`

    And I should see the case details
    And I should not see the hearing details

    # Home Office Generic
    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_listing` case progress image

    And I should see the text `Do this next`
    And I should see the text `check that the Home Office response complies with the Procedural Rules and Practice Directions`
    And I should see the text `inform you of any issues`
    And I should see the text `Providing there are no issues, the response will be shared with the appellant.`
    And I should see the text `All parties will be notified when the Hearing Notice is ready.`

    And I should see the case details
    And I should not see the hearing details

    # AO:

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_listing` case progress image

    And I should see the text `Do this next`
    And I should see the text `You can list the case when the case officer sends you the agreed hearing requirements.`

    And I should see the case details
    And I should not see the hearing details

    And I should not see the option `Add appeal response` for the `Next step` field
    And I should not see the option `Request hearing requirements` for the `Next step` field
    And I should not see the option `Upload additional evidence` for the `Next step` field
    And I should not see the option `Send direction` for the `Next step` field
    And I should not see the option `Change the direction due date` for the `Next step` field
    And I should see the option `List the case` for the `Next step` field

    ### prepare for hearing

    When I list the case
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_prepareForHearing` case progress image

    And I should see the text `Do this next`
    And I should see the text `The hearing notice will be sent to all parties.`
    And I should see the text `You don’t need to do any more on this case.`

    And I should see the case details
    And I should see the hearing details

    # CO

    When I switch to be a `Case Officer`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_prepareForHearing` case progress image

    And I should see the text `Do this next`
    And I should see the text `You must create a case summary for the judge to use at the hearing`

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change the direction due date` for the `Next step` field
    And I should see the option `Create case summary` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should see the option `Edit case listing` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field

    And I should see the case details
    And I should see the hearing details

    And I should see the case details
    And I should see the hearing details

    When I click the `Create case summary` link
    Then I am on the `Create case summary` page
    And I click the `Cancel` link

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab

    Then I should only see the `legalRep_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed`
    And I should see the text `Go to the documents tab to see the hearing notice, which includes the hearing details`
    And I should see the text `The case officer will prepare the hearing bundle`
    And I should see the text `You'll receive a notification when it is available to view in the documents tab`

    And I should see the case details
    And I should see the hearing details

    And I should not see the `Next step` field

    When I click the `Go to the documents tab` link
    Then I am on the `Documents` page

    # Home Office APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the Hearing Notice is ready to view in the documents tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the case details
    And I should see the hearing details

    # Home Office LART
    When I switch to be a `Home Office LART`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the Hearing Notice is ready to view in the documents tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the case details
    And I should see the hearing details

    # Home Office POU
    When I switch to be a `Home Office POU`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the Hearing Notice is ready to view in the documents tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the case details
    And I should see the hearing details

    # Home Office Generic
    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the Hearing Notice is ready to view in the documents tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the case details
    And I should see the hearing details

    ### final bundling

    # CO:

    When I switch to be a `Case Officer`
    And I create case summary
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_finalBundling` case progress image

    And I should see the case details
    And I should see the hearing details

    And I should not see the option `Create case summary` for the `Next step` field

    And I should see the option `Generate hearing bundle` for the `Next step` field
    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change the direction due date` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should see the option `Edit case listing` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field

    When I click the `Generate hearing bundle` link
    Then I am on the `Generate hearing bundle` page
    And I click the `Cancel` link

    # Home Office APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the Hearing Notice is ready to view in the documents tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the case details
    And I should see the hearing details

    # Home Office LART
    When I switch to be a `Home Office LART`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the Hearing Notice is ready to view in the documents tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the case details
    And I should see the hearing details

    # Home Office POU
    When I switch to be a `Home Office POU`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the Hearing Notice is ready to view in the documents tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the case details
    And I should see the hearing details

    # Home Office Generic
    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the Hearing Notice is ready to view in the documents tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the case details
    And I should see the hearing details

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab

    Then I should only see the `legalRep_listed` case progress image
    And I should see the text `Do this next`
    And I should see the text `The case has now been listed. Go to the documents tab to see the Hearing notice, which includes the hearing details.`
    And I should see the text `Go to the documents`
    And I should see the case details
    And I should see the hearing details
    And I should not see the `Next step` field

    When I click the `Go to the documents tab` link
    Then I am on the `Documents` page

    ### start decision and reasons

    # CO:

    When I switch to be a `Case Officer`
    And I generate the hearing bundle
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_preHearing` case progress image

    And I should see the case details
    And I should see the hearing details

    And I should not see the option `Generate hearing bundle` for the `Next step` field

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change the direction due date` for the `Next step` field
    And I should see the option `Start decision and reasons` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should see the option `Edit case listing` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field

    When I click the `Start decision and reasons` link
    Then I am on the `Start decision and reasons` page
    And I click the `Cancel` link

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab

    Then I should only see the `legalRep_preHearing` case progress image
    And I should see the text `Do this next`
    And I should see the text `You can now view the hearing bundle in the documents tab.`
    And I should see the text `Go to the documents`
    And I should see the case details
    And I should see the hearing details
    And I should not see the `Next step` field

    When I click the `Go to the documents tab` link
    Then I am on the `Documents` page

    # Home Office APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_preHearing` case progress image

    And I should see the text `Do this next`
    And I should see the text `The hearing bundle is ready to view in the documents tab`

    And I should see the case details
    And I should see the hearing details

    # Home Office LART
    When I switch to be a `Home Office LART`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_preHearing` case progress image

    And I should see the text `Do this next`
    And I should see the text `The hearing bundle is ready to view in the documents tab`

    And I should see the case details
    And I should see the hearing details

    # Home Office POU
    When I switch to be a `Home Office POU`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_preHearing` case progress image

    And I should see the text `Do this next`
    And I should see the text `The hearing bundle is ready to view in the documents tab`

    And I should see the case details
    And I should see the hearing details

    # Home Office Generic
    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_preHearing` case progress image

    And I should see the text `Do this next`
    And I should see the text `The hearing bundle is ready to view in the documents tab`

    And I should see the case details
    And I should see the hearing details

    # Generate decision and reasons

    # CO:

    When I switch to be a `Case Officer`
    And I start decision and reasons
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_decision` case progress image
    And I should see the case details
    And I should see the hearing details
    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change the direction due date` for the `Next step` field
    And I should see the option `Generate decision and reasons` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should see the option `Edit case listing` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field

    When I click the `Generate decision and reasons` link
    Then I am on the `Generate decision and reasons` page
    And I click the `Cancel` link

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab

    Then I should only see the `legalRep_decision` case progress image
    And I should see the text `Do this next`
    And I should see the text `The judge is writing the decisions and reasons. You will be notified when it is available to view.`
    And I should see the case details
    And I should see the hearing details
    And I should not see the `Next step` field

    ### send decision and reasons

    # CO:

    When I switch to be a `Case Officer`
    And I generate decision and reasons
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_decision` case progress image
    And I should see the case details
    And I should see the hearing details
    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change the direction due date` for the `Next step` field
    And I should see the option `Complete decision and reasons` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should see the option `Edit case listing` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field

    When I click the `Send decision and reasons` link
    Then I am on the `Complete decision and reasons` page
    And I click the `Cancel` link

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab

    Then I should only see the `legalRep_decision` case progress image
    And I should see the text `Do this next`
    And I should see the text `The judge is writing the decisions and reasons. You will be notified when it is available to view.`
    And I should see the case details
    And I should see the hearing details
    And I should not see the `Next step` field

    # Home Office APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_decision` case progress image

    And I should see the text `Do this next`
    And I should see the text `The Judge is writing up the Decision and Reasons document, you'll be notified when this is ready to view.`

    And I should see the case details
    And I should see the hearing details

    # Home Office LART
    When I switch to be a `Home Office LART`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_decision` case progress image

    And I should see the text `Do this next`
    And I should see the text `The Judge is writing up the Decision and Reasons document, you'll be notified when this is ready to view.`

    And I should see the case details
    And I should see the hearing details

    # Home Office POU
    When I switch to be a `Home Office POU`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_decision` case progress image

    And I should see the text `Do this next`
    And I should see the text `The Judge is writing up the Decision and Reasons document, you'll be notified when this is ready to view.`

    And I should see the case details
    And I should see the hearing details

    # Home Office Generic
    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_decision` case progress image

    And I should see the text `Do this next`
    And I should see the text `The Judge is writing up the Decision and Reasons document, you'll be notified when this is ready to view.`

    And I should see the case details
    And I should see the hearing details

    # Decided

    # CO:

    When I switch to be a `Case Officer`
    And I send decision and reasons
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_decided` case progress image
    And I should see the text `The case has been decided. Either party has the right to appeal this decision, they have 14 days from the date of decision to do this.`
    And I should see the case details
    And I should see the hearing details
    And I should see the option `Add case note` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab

    Then I should only see the `legalRep_decided` case progress image
    And I should see the text `The case has been decided. You can now view the decision and reasons in the documents tab.`
    And I should see the text `Either party can appeal the decision by making an application to the Upper Tribunal. If you decide to appeal, you must do this within 14 days of the judge’s signature on the decision.`
    And I should see the text `To submit an appeal, you will need to complete form IAFT-4: First-tier Tribunal Application for Permission to Appeal to Upper Tribunal.`
    And I should see the case details
    And I should see the hearing details
    And I should not see the `Next step` field

    # Home Office APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `appeal_allowed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The appeal has been allowed. The Decision and Reasons document is available in the documents tab`

    And I should see the case details
    And I should see the hearing details

    # Home Office LART
    When I switch to be a `Home Office LART`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `appeal_allowed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The appeal has been allowed. The Decision and Reasons document is available in the documents tab`

    And I should see the case details
    And I should see the hearing details

    # Home Office POU
    When I switch to be a `Home Office POU`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `appeal_allowed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The appeal has been allowed. The Decision and Reasons document is available in the documents tab`

    And I should see the case details
    And I should see the hearing details

    # Home Office Generic
    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `appeal_allowed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The appeal has been allowed. The Decision and Reasons document is available in the documents tab`

    And I should see the case details
    And I should see the hearing details


    # AO

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_decided` case progress image
    And I should see the text `Record the attendees and duration of the hearing.`

    When I click the `Record attendees and duration` link
    And I type `Judge Judy` for the `The judge` field
    And I type `2` for the `Hours` field
    And I type `30` for the `Minutes` field
    And I click the `Continue` button
    And I click the `Save details` button
    And I click the `Close and Return to case details` button
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_decided` case progress image
    And I should see the text `The case has been decided. Either party has the right to appeal this decision, they have 14 days from the date of decision to do this.`

  # HO APC

    When I switch to be a `Home Office APC`
    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see `AppealResponse.pdf` in the `Upload the appeal response` field
    And I should see `This is the appeal response` in the first `Describe the document` field
    And within the first `Add any additional evidence here` collection's first item, I should see `AppealResponseEvidence.pdf` in the `Document` field
    And I should see `CaseArgument.pdf` in the `Appeal skeleton argument` field
    And I should see `This is the case argument` in the `Description` field
    And within the first `Evidence` collection's first item, I should see `CaseArgumentEvidence.pdf` in the `Document` field
    And within the first `Evidence` collection's first item, I should see `The is the case argument evidence` in the `Describe the document` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` in the `Grounds of appeal` field
    And I should see `The refusal of a protection claim` in the `Type of appeal` field

    When I click the `Case details` tab
    Then the `Reference number` field should be 13 characters long
    And I should see `A123456` in the `Home Office reference number` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Date on the decision letter` field
    And I should see `José` in the `Given names` field
    And I should see `González` in the `Family name` field
    And I should see `The refusal of a protection claim` in the `Type of appeal` field
    And I should see `some-ref` in the `If you prefer to use your own reference number for this case, you can enter it here.` field
    And I should see `Taylor House` in the `Hearing centre` field

    When I click the `Documents` tab
    Then I should see the `Documents` page
    And I should see the `Hearing documents` field
    And within the `Hearing documents` collection's first item, I should see `-González-hearing-bundle.PDF` in the `Document` field
    And within the `Hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Hearing documents` collection's second item, I should see `CaseSummary.pdf` in the `Document` field
    And within the `Hearing documents` collection's second item, I should see `This is the case summary` in the `Description` field
    And within the `Hearing documents` collection's third item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field
    And within the `Hearing documents` collection's third item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Legal representative documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And I should see the `Legal representative documents` field
    And within the `Legal representative documents` collection's first item, I should see `-González-appeal-skeleton-argument.PDF` in the `Document` field
    And within the `Legal representative documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Legal representative documents` collection's second item, I should see `CaseArgument.pdf` in the `Document` field
    And within the `Legal representative documents` collection's second item, I should see `This is the case argument` in the `Description` field
    And within the `Legal representative documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Legal representative documents` collection's third item, I should see `CaseArgumentEvidence.pdf` in the `Document` field
    And within the `Legal representative documents` collection's third item, I should see `The is the case argument evidence` in the `Description` field
    And within the `Legal representative documents` collection's third item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Legal representative documents` collection's fourth item, I should see `-Gonzlez-appeal-form.PDF` in the `Document` field
    And within the `Legal representative documents` collection's fourth item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Respondent documents` collection's first item, I should see `AppealResponse.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the appeal response` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Respondent documents` collection's second item, I should see `AppealResponseEvidence.pdf` in the `Document` field
    And within the `Respondent documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Respondent documents` collection's third item, I should see `RespondentEvidenceUpdated.pdf` in the `Document` field
    And within the `Respondent documents` collection's third item, I should see `This is the updated evidence` in the `Description` field
    And within the `Respondent documents` collection's third item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Respondent documents` collection's fourth item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Respondent documents` collection's fourth item, I should see `This is the respondent evidence` in the `Description` field
    And within the `Respondent documents` collection's fourth item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Decision and reason documents` collection's first item, I should see `-Gonzlez-Decision-and-reasons-FINAL.pdf` in the `Document` field
    And within the `Decision and reason documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Decision and reason documents` collection's second item, I should see `-Gonzlez-Decision-and-reasons-Cover-letter.PDF` in the `Document` field
    And within the `Decision and reason documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I click the `Directions` tab
    Then I should see the `Directions` page
    And within the `Directions` collection's first item, I should see `Your appeal is going to a hearing. Login to submit your hearing requirements on the overview tab.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `If you do not supply your hearing requirements within 5 days, we may not be able to accommodate your needs for the hearing.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` for the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+5|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field
    And within the `Directions` collection's fifth item, I should see `A notice of appeal has been lodged against this asylum decision.` in the `Explanation` field
    And within the `Directions` collection's fifth item, I should see `You must now send all documents to the case officer.` in the `Explanation` field
    And within the `Directions` collection's fifth item, I should see `You have 14 days to supply` in the `Explanation` field
    And within the `Directions` collection's fifth item, I should see `Respondent` for the `Parties` field
    And within the `Directions` collection's fifth item, I should see `{$TODAY+14|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's fifth item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field
