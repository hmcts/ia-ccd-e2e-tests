Feature: Case progression path when case and continue is disabled 

  @case-progression @case-progression-core-save-and-continue-false @RIA-574 @RIA-908 @RIA-909 @RIA-910 @RIA-911 @RIA-912 @RIA-914 @RIA-915 @RIA-905 @RIA-653 @RIA-944 @RIA-985 @RIA-412 @RIA-364 @RIA-1534 @RIA-1568
  @RIA-1571 @RIA-1561 @RIA-1560 @RIA-1284 @RIA-1609 @RIA-1485 @RIA-572 @RIA-1622 @RIA-1563 @RIA-1564 @RIA-1565 @RIA-1707 @RIA-1789 @RIA-1799 @RIA-1356 @RIA-1357 @RIA-1794
  @RIA-1810 @RIA-1771 @RIA-2177 @RIA-436 @RIA-2049 @RIA-2087 @RIA-1899 @RIA-2047 @RIA-597 @RIA-587 @RIA-2022 @RIA-2048 @RIA-2051 @RIA-2011 @RIA-2052 @RIA-2277 @RIA-2343 @RIA-2304 @RIA-2041
  @RIA-2236 @RIA-2736 @RIA-1360 @RIA-1280 @RIA-1939 @RIA-1903 @RIA-2694 @RIA-3555 @RIA-4642
  Scenario: Case progression information is displayed for each case state (contextualised to Case Officer, Admin Officer, Legal Rep or Home Office)

    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal

    ### appeal started

    # LR:

    When I click the `Overview` tab

    Then I should only see the `progress_legalRep_appealStarted` case progress image

    And I should see the text `Do this next`
    And I should see the text `You still need to submit your appeal`
    And I should see the text `You can also review and edit your appeal`

    And I should not see the hearing details
    And I should see the case details

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
    And I should not see `Legally Represented` tag
    Then I should only see the `progress_legalRep_appealSubmitted` case progress image

    And I should see the text `Do this next`
    And I should see the text `You have submitted your appeal`
    And I should see the text `You don't need to do anything else right now`

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    # CO:

    When I switch to be a `Case Officer`
    And I click the `Overview` tab
    And I should see `Legally Represented` tag

    Then I should only see the `caseOfficer_appealSubmitted` case progress image

    And I should see the text `Do this next`
    And I should see the text `You must review the appeal in the documents tab`
    And I should see the text `tell the respondent to supply their evidence`

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change a direction due date` for the `Next step` field
    And I should see the option `Request respondent evidence` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field

    When I click the `Request respondent evidence` link
    Then I am on the `Request respondent evidence` page
    And I click the `Cancel` link

    ### Request Home Office data

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

    When I click the `Close and Return to case details` button

    Then I click the `Validation` tab
    And I should see the text `There are no matching details for this appellant. You can contact the Home Office if you need more information to validate the appeal.`

    ### awaiting respondent evidence

    When I request respondent evidence
    And I click the `Overview` tab
    And I should see `Legally Represented` tag
    Then I should only see the `caseOfficer_awaitingRespondentEvidence_preUpload` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Home Office will prepare their bundle.`
    And I should not see the `Upload respondent evidence` link

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I should not see the option `Build your case` for the `Next step` field

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change a direction due date` for the `Next step` field
    And I should see the option `Upload respondent evidence` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab
    And I should not see `Legally Represented` tag
    Then I should only see the `progress_legalRep_awaitingRespondentEvidence` case progress image

    And I should see the text `Do this next`
    And I should see the text `You'll get an email when the respondent evidence is available in the documents tab`

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I should not see the option `Send direction` for the `Next step` field
    And I should not see the option `Change a direction due date` for the `Next step` field
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
    And I should not see `Legally Represented` tag
    Then I should only see the `homeOffice_uploadBundle` case progress image

    And I should see the text `Do this next`
    And I should see the text `An appeal against the Home Office decision in this case has been submitted. You can view the appeal form in the documents tab`
    And I should see the text `If you accept that there is a right of appeal you should upload the Home Office bundle`
    And I should see the text `If you consider the appeal is not valid, you should contact the Tribunal and the appellant with your reasons`

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I should not see the option `Send direction` for the `Next step` field
    And I should not see the option `Change a direction due date` for the `Next step` field
    And I should see the option `Upload Home Office bundle` for the `Next step` field
    And I should not see the option `Submit your case` for the `Next step` field
    And I should not see the option `Add case note` for the `Next step` field
    And I should not see the option `Record an application` for the `Next step` field
    And I should not see the option `Build your case` for the `Next step` field

    When I click the `upload the Home Office bundle` link
    Then I am on the `Upload Home Office bundle` page
    And I should see the text `Already uploaded files:`
    And I should see the text `- None`

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
    And I should see `Legally Represented` tag
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
    And I should not see `Legally Represented` tag
    Then I should only see the `homeOffice_uploadBundle` case progress image

    And I should see the text `Do this next`
    And I should see the text `An appeal against the Home Office decision in this case has been submitted. You can view the appeal form in the documents tab`
    And I should see the text `If you accept that there is a right of appeal you should upload the Home Office bundle`
    And I should see the text `If you consider the appeal is not valid, you should contact the Tribunal and the appellant with your reasons`

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I should not see the option `Send direction` for the `Next step` field
    And I should not see the option `Change a direction due date` for the `Next step` field
    And I should see the option `Upload Home Office bundle` for the `Next step` field
    And I should not see the option `Submit your case` for the `Next step` field
    And I should not see the option `Add case note` for the `Next step` field
    And I should not see the option `Record an application` for the `Next step` field
    And I should not see the option `Build your case` for the `Next step` field

    When I click the `upload the Home Office bundle` link
    Then I am on the `Upload Home Office bundle` page
    And I should see the text `Already uploaded files:`
    And I should see the text `- Evidence1.pdf`
    And I click the `Add new` button
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

    And within the `Respondent documents` collection's first item, I should see `RespondentEvidenceUpdated.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the updated evidence` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And within the `Respondent documents` collection's second item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Respondent documents` collection's second item, I should see `This is the respondent evidence` in the `Description` field
    And within the `Respondent documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I select the `Upload Home Office bundle` Next step
    Then I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `You cannot upload more documents until the evidence bundle has been reviewed`

    ### case building, not ready to submit

    # CO - notify appellant to build the case

    And I switch to be a `Case Officer`
    And I click the `Overview` tab
    And I should see `Legally Represented` tag
    Then I should only see the `caseOfficer_awaitingRespondentEvidence_postUpload` case progress image

    And I should see the text `Do this next`
    And I should see the text `If it complies with the procedure rules and practice directions, direct the legal representative to build their case`
    And I should see the text `If it does not comply, direct the respondent to make the appropriate changes`

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I should not see the option `Build your case` for the `Next step` field
    And I should not see the option `Submit your case` for the `Next step` field
    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change a direction due date` for the `Next step` field
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
    And I should see `Legally Represented` tag
    Then I should only see the `caseOfficer_caseBuilding` case progress image

    And I should not see the `Request respondent review` link
    And I should not see the `Request case edit` link

    And I should see the text `Do this next`
    And I should see the text `Wait for the appellant to submit their built case. If they ask for a time extension, you can respond by changing the due date on the direction`
    And I should see the `Change the direction due date` link

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I should not see the option `Build your case` for the `Next step` field
    And I should not see the option `Submit your case` for the `Next step` field
    And I should not see the option `Upload respondent evidence` for the `Next step` field
    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change a direction due date` for the `Next step` field
    And I should see the option `Add additional evidence` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field
    And I should see the option `End the appeal` for the `Next step` field

    When I click the `Change the direction due date` link
    Then I am on the `Change a direction due date` page
    And I click the `Cancel` link

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab
    And I should not see `Legally Represented` tag
    Then I should only see the `progress_legalRep_caseBuilding` case progress image

    And I should see the text `Do this next`
    And I should see the text `The respondent evidence is now available in the documents tab. You now need to build your case`
    And I should see the `Build your case` link
    And I should not see the text `submit your case`

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I should not see the option `Send direction` for the `Next step` field
    And I should not see the option `Change a direction due date` for the `Next step` field
    And I should not see the option `Add case note` for the `Next step` field
    And I should not see the option `Record an application` for the `Next step` field
    And I should not see the option `End the appeal` for the `Next step` field

    And I should see the option `Build your case` for the `Next step` field
    And I should see the option `Submit your case` for the `Next step` field

    When I click the `Build your case` link
    Then I am on the `Build your case` page
    And I click the `Cancel` link

    ### case building, ready to submit, case under review

    # LR:

    When I build my case
    And I click the `Overview` tab
    And I should not see `Legally Represented` tag
    Then I should only see the `progress_legalRep_caseUnderReview` case progress image

    And I should see the text `Do this next`
    And I should see the text `Your case is now under review`
    And I should see the text `You'll get an email telling you what happens next`

    And I should not see the `Request respondent review` link
    And I should not see the `Request case edit` link

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I should not see the option `Build your case` for the `Next step` field
    And I should not see the option `Submit your case` for the `Next step` field
    And I should not see the option `Add case note` for the `Next step` field
    And I should not see the option `Record an application` for the `Next step` field

    And I should see the option `Upload additional evidence` for the `Next step` field

    # HO:

    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    And I should not see `Legally Represented` tag
    Then I should only see the `homeOffice_awaitAppealSkeletonArgument` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Tribunal will:`
    And I should see the text `check that the bundle complies with the Procedural Rules and Practice Directions`
    And I should see the text `inform you of any issues`
    And I should see the text `The Home Office will be notified when the Appeal Skeleton Argument is ready to review`

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I should not see the option `Build your case` for the `Next step` field
    And I should not see the option `Submit your case` for the `Next step` field
    And I should not see the option `Add case note` for the `Next step` field
    And I should not see the option `Record an application` for the `Next step` field
    And I should not see the option `Request respondent review` for the `Next step` field
    And I should see the option `Upload additional evidence` for the `Next step` field

    # CO:

    When I switch to be a `Case Officer`
    And I click the `Overview` tab
    And I should see `Legally Represented` tag
    Then I should only see the `caseOfficer_caseUnderReview` case progress image

    And I should see the text `Do this next`
    And I should see the text `The appellant has submitted their built case`
    And I should see the text `send it to the respondent for their review`
    And I should see the text `If the appellant needs to make any changes, you can direct them to edit the case`

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I should not see the option `Upload additional evidence` for the `Next step` field

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change a direction due date` for the `Next step` field
    And I should see the option `Request case edit` for the `Next step` field
    And I should see the option `Request respondent review` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field

    When I click the `Request case edit` link
    Then I am on the `Request case edit` page
    And I click the `Cancel` link

    When I click the `Overview` tab
    When I click the `Request respondent review` link
    Then I am on the `Request respondent review` page
    And I click the `Continue` button
    And I click the `Send direction` button

    And I should see the text `You have sent a direction`
    And I should see the text `What happens next`
    And I should see the text `Wait for the respondent to complete the direction. You must upload the response as soon as you receive it.`
    And I click the `Close and Return to case details` button

    ### respondent review, no appeal response

    And I click the `Overview` tab
    And I should see `Legally Represented` tag
    Then I should only see the `caseOfficer_respondentReviewStarted` case progress image

    And I should see the text `Do this next`
    And I should see the text `The respondent is reviewing the case, you'll be notified when their response has been uploaded`

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I should not see the option `Request case edit` for the `Next step` field
    And I should not see the option `Request respondent review` for the `Next step` field
    And I should not see the option `Upload additional evidence` for the `Next step` field

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change a direction due date` for the `Next step` field
    And I should see the option `Add appeal response` for the `Next step` field
    And I should see the option `Request hearing requirements` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab
    And I should not see `Legally Represented` tag
    Then I should only see the `progress_legalRep_respondentReview` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been sent to the respondent for review`
    And I should see the text `If you want to reply to the response, you should contact the Tribunal by the date indicated in the direction.`
    And I should see the text `If you don't respond, the case will proceed to a hearing`

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I should not see the option `Send direction` for the `Next step` field
    And I should not see the option `Change a direction due date` for the `Next step` field
    And I should not see the option `Add appeal response` for the `Next step` field

    And I should not see the option `Add case note` for the `Next step` field
    And I should not see the option `Request respondent review` for the `Next step` field
    And I should not see the option `Record an application` for the `Next step` field

    And I should see the option `Upload additional evidence` for the `Next step` field
    And I should see the option `Request hearing requirements` for the `Next step` field

    ### respondent review, appeal response added

    # Home Office Lart - upload appeal response

    When I switch to be a `Home Office LART`
    Then I should see the option `Upload the appeal response` for the `Next step` field
    And I should see the option `Upload additional evidence` for the `Next step` field

    When I click the `Overview` tab
    And I should not see `Legally Represented` tag
    Then I should only see the `homeOffice_respondentReview` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Appeal Skeleton Argument is ready to view in the documents tab`
    And I should see the text `Review the documents and add the Home Office's response.`

    And I click the `add the Home Office's response` link
    And I select `Decision maintained` for the `Outcome` field
    And I click the `Continue` button
    And I am on the `Upload the appeal response` page
    And I should see the text `Already uploaded files:`
    And I should see the text `- None`

    When I upload `{@AppealResponse.pdf}` for the `Upload the appeal response` field
    And I type `This is the appeal response` for the `Describe the document (Optional)` field
    And I add an item to the `Add any additional evidence here (Optional)` collection
    And within the `Add any additional evidence here (Optional)` collection's first item, I upload `{@Evidence1.pdf}` for the `Document (Optional)` field
    And within the `Add any additional evidence here (Optional)` collection's first item, I type `This is the evidence` for the `Describe the document (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `AppealResponse.pdf` in the `Upload the appeal response` field
    And I should see `This is the appeal response` in the `Describe the document` field
    And within the `Add any additional evidence here` collection's first item, I should see `Evidence1.pdf` for the `Document` field
    And within the `Add any additional evidence here` collection's first item, I should see `This is the evidence` in the `Describe the document` field

    When I click the `Upload` button
    Then I should see the text `You've uploaded the appeal response`
    Then I should see the text `What happens next`
    Then I should see the text `Providing there are no issues, the response will be shared with the appellant.`

    When I click the `Close and Return to case details` button
    And I click the `Documents` tab

    And within the `Respondent documents` collection's first item, I should see `AppealResponse.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the appeal response` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Respondent documents` collection's second item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Respondent documents` collection's second item, I should see `This is the evidence` in the `Description` field
    And within the `Respondent documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I select the `Upload the appeal response` Next step
    Then I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `You cannot upload more documents until your response has been reviewed`

    # CO:

    And I switch to be a `Case Officer`
    And I click the `Overview` tab
    And I should see `Legally Represented` tag
    Then I should only see the `caseOfficer_respondentReview_submittedResponse` case progress image

    And I should see the text `Do this next`
    And I should see the text `Check the response uploaded by the respondent`
    And I should see the text `If it complies with the Procedure Rules and Practice Directions, direct the appellant to review the Home Office response`
    And I should see the text `If it does not comply, direct the respondent to make the appropriate changes`

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I should not see the option `Upload additional evidence` for the `Next step` field

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change a direction due date` for the `Next step` field
    And I should see the option `Add appeal response` for the `Next step` field
    And I should see the option `Review Home Office response` for the `Next step` field
    And I should see the option `Amend appeal response` for the `Next step` field
    And I should see the option `Request hearing requirements` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field
    And I should see the option `End the appeal` for the `Next step` field

    When I click the `direct the respondent to make the appropriate changes` link
    Then I am on the `Amend appeal response` page
    And I type `Do the thing` for the `Explain the direction you are issuing` field
    And I should see `Respondent` for the `Who are you giving the direction to?` field
    And I type `15-10-2019` for the `By what date must they comply?` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Do the thing` for the `Explain the direction you are issuing` answer
    And I should see `Respondent` for the `Who are you giving the direction to?` answer
    And I should see `15 Oct 2019` for the `By what date must they comply?` answer

    When I click the `Send direction` button
    Then I should see the text `You have sent a direction`
    And I should see the text `What happens next`
    Then I should see the text `You can see the status of the direction in the directions tab`

    When I click the `Close and Return to case details` button
    Then I should only see the `caseOfficer_respondentReview_amendResponse` case progress image
    And I should see the text `Do this next`
    And I should see the text `The respondent has been directed to make changes with their response`
    And I should see the text `You'll be notified when the revised response has been uploaded`

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    # HO:

    And I switch to be a `Home Office LART`
    Then I click the `Overview` tab
    And I should not see `Legally Represented` tag
    Then I should only see the `homeOffice_respondentReview` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Appeal Skeleton Argument is ready to view in the documents tab`
    And I should see the text `Review the documents and add the Home Office's response.`

    And I click the `add the Home Office's response` link
    And I select `Decision maintained` for the `Outcome` field
    And I click the `Continue` button
    And I am on the `Upload the appeal response` page
    And I should see the text `Already uploaded files:`
    And I should see the text `- AppealResponse.pdf`
    And I should see the text `- Evidence1.pdf`

    When I upload `{@AppealResponseUpdated.pdf}` for the `Upload the appeal response` field
    And I type `This is the updated appeal response` for the `Describe the document (Optional)` field
    And I add an item to the `Add any additional evidence here (Optional)` collection
    And within the `Add any additional evidence here (Optional)` collection's first item, I upload `{@AppealResponseEvidenceUpdated.pdf}` for the `Document (Optional)` field
    And within the `Add any additional evidence here (Optional)` collection's first item, I type `This is the updated evidence` for the `Describe the document (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `AppealResponseUpdated.pdf` in the `Upload the appeal response` field
    And I should see `This is the updated appeal response` in the `Describe the document` field
    And within the `Add any additional evidence here` collection's first item, I should see `AppealResponseEvidenceUpdated.pdf` for the `Document` field
    And within the `Add any additional evidence here` collection's first item, I should see `This is the updated evidence` in the `Describe the document` field

    When I click the `Upload` button
    Then I should see the text `You've uploaded the appeal response`
    Then I should see the text `What happens next`
    Then I should see the text `Providing there are no issues, the response will be shared with the appellant.`

    When I click the `Close and Return to case details` button
    And I click the `Documents` tab

    And within the `Respondent documents` collection's first item, I should see `AppealResponseUpdated.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the updated appeal response` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Respondent documents` collection's second item, I should see `AppealResponseEvidenceUpdated.pdf` in the `Document` field
    And within the `Respondent documents` collection's second item, I should see `This is the updated evidence` in the `Description` field
    And within the `Respondent documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Respondent documents` collection's third item, I should see `AppealResponse.pdf` in the `Document` field
    And within the `Respondent documents` collection's third item, I should see `This is the appeal response` in the `Description` field
    And within the `Respondent documents` collection's third item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Respondent documents` collection's fourth item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Respondent documents` collection's fourth item, I should see `This is the evidence` in the `Description` field
    And within the `Respondent documents` collection's fourth item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    # CO Direct Appellant to review HO Appeal Response
    When I switch to be a `Case Officer`
    And I click the `Overview` tab
    And I should see `Legally Represented` tag
    Then I should only see the `caseOfficer_respondentReview_submittedResponse` case progress image

    When I click the `direct the appellant to review the Home Office response` link
    Then I am on the `Review Home Office response` page

    And I should see `The Home Office has replied to your Appeal Skeleton Argument and evidence. You should review their response` in the `Explain the direction you are issuing` field
    And I should see `Next steps` in the `Explain the direction you are issuing` field
    And I should see `Review the Home Office response. If you want to respond to what they have said, you should email the Tribunal` in the `Explain the direction you are issuing` field
    And I should see `If you do not respond by the date indicated below, the case will automatically go to hearing` in the `Explain the direction you are issuing` field
    And I should see `Legal representative` for the `Who are you giving the direction to?` field
    And I should see `{$TODAY+5}` for the `By what date must they comply?` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `The Home Office has replied to your Appeal Skeleton Argument and evidence. You should review their response` in the `Explain the direction you are issuing` field
    And I should see `Next steps` in the `Explain the direction you are issuing` field
    And I should see `Review the Home Office response. If you want to respond to what they have said, you should email the Tribunal` in the `Explain the direction you are issuing` field
    And I should see `If you do not respond by the date indicated below, the case will automatically go to hearing` in the `Explain the direction you are issuing` field
    And I should see `Legal representative` for the `Who are you giving the direction to?` field
    And I should see `{$TODAY+5|D MMM YYYY}` for the `By what date must they comply?` field

    When I click the `Send direction` button
    Then I should see the text `You have sent a direction`
    And I should see the text `What happens next`
    And I should see the text `Legal representative will be notified by email.`

    When I click the `Close and Return to case details` button
    Then I should only see the `caseOfficer_respondentReview_appealResponseAvailable` case progress image
    And I should see the text `What happens next`
    And I should see the text `The appellant has been directed to review the Home Office response.`
    And I should see the text `If they do not respond within 5 working days of the direction, the case automatically proceeds to a hearing.`

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    Then I click the `Directions` tab
    And within the `Directions` collection's first item, I should see `The Home Office has replied to your Appeal Skeleton Argument and evidence. You should review their response` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Next steps` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Review the Home Office response. If you want to respond to what they have said, you should email the Tribunal` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `If you do not respond by the date indicated below, the case will automatically go to hearing` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` in the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+5|D MMM YYYY} in the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY} in the `Date sent` field

    # AO:

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab
    And I should see `Legally Represented` tag
    Then I should only see the `caseOfficer_respondentReview_appealResponseAvailable` case progress image
    And I should see the text `What happens next`
    And I should see the text `The appellant has been directed to review the Home Office response.`

    And I should see the case details
    And I should not see the hearing details
    And I should see the legal representative details

    Then I click the `Directions` tab
    And within the `Directions` collection's first item, I should see `The Home Office has replied to your Appeal Skeleton Argument and evidence. You should review their response` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Next steps` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Review the Home Office response. If you want to respond to what they have said, you should email the Tribunal` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `If you do not respond by the date indicated below, the case will automatically go to hearing` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` in the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+5|D MMM YYYY} in the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY} in the `Date sent` field

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab
    And I should not see `Legally Represented` tag
    Then I should only see the `progress_legalRep_respondentReview_appeal_response` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Home Office is proceeding with the case and you've been directed to review their response in the Documents tab.`
    And I should see the text `If you want to respond to the Home Office, you should contact The Tribunal within 5 working days or the case will automatically proceed to a hearing.`
    And I should see the text `If you want to continue the appeal without responding, you can proceed to a hearing.`
    And I should see the text `If not, you should apply to the Tribunal to withdraw the appeal.`

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I should not see the option `Send direction` for the `Next step` field
    And I should not see the option `Change a direction due date` for the `Next step` field
    And I should not see the option `Add appeal response` for the `Next step` field
    And I should not see the option `Add case note` for the `Next step` field
    And I should not see the option `Record an application` for the `Next step` field
    And I should see the option `Request hearing requirements` for the `Next step` field
    And I should see the option `Upload additional evidence` for the `Next step` field

    # Home Office APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    And I should not see `Legally Represented` tag
    Then I should only see the `homeOffice_appealResponseUploaded` case progress image
    And I should see the text `Do this next`
    #And I should see the text `check that the Home Office response complies with the Procedural Rules and Practice Directions`
    #And I should see the text `inform you of any issues`
    And I should see the text `Providing there are no issues, the response will be shared with the appellant.`
    And I should see the text `All parties will be notified when the Hearing Notice is ready.`

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    # CO:

    When I switch to be a `Case Officer`
    And I request hearing requirements
    Then I click the `Overview` tab
    And I should see `Legally Represented` tag
    And I should only see the `caseOfficer_submitHearingRequirements` case progress image
    And I should see the text `What happens next`
    And I should see the text `The appellant has been directed to submit their hearing requirements.`

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I should not see the option `Add appeal response` for the `Next step` field
    And I should not see the option `Request hearing requirements` for the `Next step` field
    And I should not see the option `Upload additional evidence` for the `Next step` field

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change a direction due date` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should not see the option `List the case` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field
    And I should see the option `List without requirements` for the `Next step` field

    When I select the `List without requirements` Next step
    Then I should see the text `List without requirements`
    And I should see the option `30 minutes` for the `Length of appointment` field
    And I should see the option `1 hour` for the `Length of appointment` field
    And I should see the option `1 hour 30 minutes` for the `Length of appointment` field
    And I should see the option `2 hours` for the `Length of appointment` field
    And I should see the option `2 hours 30 minutes` for the `Length of appointment` field
    And I should see the option `3 hours` for the `Length of appointment` field
    And I should see the option `3 hours 30 minutes` for the `Length of appointment` field
    And I should see the option `4 hours` for the `Length of appointment` field
    And I should see the option `4 hours 30 minutes` for the `Length of appointment` field
    And I should see the option `5 hours` for the `Length of appointment` field
    And I should see the option `5 hours 30 minutes` for the `Length of appointment` field
    And I should see the option `6 hours` for the `Length of appointment` field
    And I select `6 hours` for the `Length of appointment` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `6 hours` for the `Length of appointment` field
    And I click the `Cancel` link

    # Admin Officer
    When I switch to be a `Admin Officer`
    And I click the `Overview` tab
    And I should see `Legally Represented` tag
    And I should only see the `caseOfficer_submitHearingRequirements` case progress image
    And I should see the text `What happens next`
    And I should see the text `The appellant will submit their hearing requirements.`

    ### submit hearing requirements

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab
    And I should not see `Legally Represented` tag
    Then I should only see the `progress_legalRep_submitHearingRequirements` case progress image
    And I should see the text `Do this next`
    And I should see the text `The appeal is now going to a hearing. You need to submit the appellant's hearing requirements.`
    And I should see the case details
    And I should not see the hearing details
    And I should see the legal representative details

    And I should see the option `Upload additional evidence` for the `Next step` field
    And I should see the option `Submit hearing requirements` for the `Next step` field
    And I should not see the option `Send direction` for the `Next step` field
    And I should not see the option `Change a direction due date` for the `Next step` field
    And I should not see the option `List the case` for the `Next step` field
    And I should not see the option `Add case note` for the `Next step` field
    And I should not see the option `Record an application` for the `Next step` field

    When I click the `Appeal` tab
    Then I should see the appeal details
    And I should see the submission details

    When I click the `Appellant` tab
    Then I should see the appellant's details
    And I should see the legal representative's details

    When I select the `Submit hearing requirements` Next step
    Then I should see the text `Submit hearing requirements`
    And I should see the text `If the appellant needs interpreter services, step-free access or a hearing loop, these will be provided.`
    And I should see the text `You'll also be able to request additional adjustments based on the appellant's personal circumstances. The tribunal will review these and decide whether a request can be granted.`
    And I click the `Cancel` link

    When I click the `submit the appellant's hearing requirements` link
    Then I click the `Continue` button
    And I select `Yes` for the `Will the appellant attend the hearing?` field

    When I click the `Continue` button
    Then I select `Yes` for the `Will the appellant give oral evidence at the hearing?` field

    When I click the `Continue` button
    And I select `Yes` for the `Will any witnesses attend the hearing?` field
    Then I see the text `Witness details`
    And the `Continue` button is disabled

    When I click the `Add new` button
    And I type `Jenny Button` for the `Name` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    And I select `Yes` for the `Do you need interpreter services on the day?` field
    Then I see the text `Interpreter details`
    And the `Continue` button is disabled

    When I click the `Add new` button
    And I select `Zulu` for the `Language` field
    And I type `Kwabe` for the `Dialect` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    Then I select `Yes` for the `Do you need a hearing room with step-free access?` field

    When I click the `Continue` button
    Then I select `Yes` for the `Do you need a hearing loop?` field

    When I click the `Continue` button
    Then I should see the text `Additional requests`
    And I should see the text `You can request additional adjustments based on the appellant's personal circumstances. The Tribunal will review the information you provide and decide whether a request can be granted.`

    When I click the `Continue` button
    And I select `Yes` for the `Does the appellant have any physical or mental health issues that may impact them on the day?` field
    Then the `Continue` button is disabled
    When I type `The appellant is deaf in one ear` for the `Explain in detail how any physical or mental health issues may affect them on the day.` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    And I select `Yes` for the `Has the appellant had any past experiences that may impact them on the day?` field
    Then the `Continue` button is disabled
    When I type `The appellant is fearful of the law` for the `Explain in detail how any past experiences may affect them on the day?` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    And I select `Yes` for the `Do you have multimedia evidence?` field
    Then the `Continue` button is disabled
    When I type `The appellant has a video recording on a memory stick which needs to be played on a computer` for the `You should provide the equipment to play this evidence. If this is not possible, explain why and what equipment you'll need to play it.` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    And I select `Yes` for the `Does the appellant need a single-sex court?` field

    When I click the `Continue` button
    And I select `All female` for the `What type of court do they need?` field
    Then the `Continue` button is disabled
    When I type `The appellant is fearful of men` for the `Explain in detail why the appellant needs a single-sex court.` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    And I select `Yes` for the `Does the appellant need an in camera court?` field
    Then the `Continue` button is disabled
    When I type `The appellant is afraid of the general public` for the `Explain in detail why the appellant needs an in camera court.` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    And I select `Yes` for the `Is there anything else you would like to request?` field
    Then the `Continue` button is disabled
    When I type `The appellant would like fresh orange juice and doughnuts` for the `Provide details of any additional requests and why they are necessary.` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    Then I should see the text `Hearing dates to avoid`

    When I select `Yes` for the `Are there any dates that the appellant or their on-day representation cannot attend?` field
    Then I should see the text `Tell us which dates and explain why the case cannot be heard on these dates.`
    And I should see the text `Dates to avoid`
    When I click the `Add new` button
    And I type `31-12-2019` for the `Date` field
    And I type `New Year's Eve` for the `Reason` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Yes` in the `Will the appellant attend the hearing?` field
    And I should see `Yes` in the `Will the appellant give oral evidence at the hearing?` field
    And I should see `Yes` in the `Will any witnesses attend the hearing?` field
    And I should see `Jenny Button` in the `Witness details` field
    And I should see `Yes` in the `Do you need interpreter services on the day?` field
    And I should see `Zulu` in the `Language` field
    And I should see `Kwabe` in the `Dialect` field
    And I should see `Yes` in the `Do you need a hearing room with step-free access?` field
    And I should see `Yes` in the `Do you need a hearing loop?` field
    And I should see `Yes` in the `Does the appellant have any physical or mental health issues that may impact them on the day?` field
    And I should see `The appellant is deaf in one ear` in the `Explain in detail how any physical or mental health issues may affect them on the day.` field
    And I should see `Yes` in the `Has the appellant had any past experiences that may impact them on the day?` field
    And I should see `The appellant is fearful of the law` in the `Explain in detail how any past experiences may affect them on the day?` field
    And I should see `Yes` in the `Do you have multimedia evidence?` field
    And I should see `The appellant has a video recording on a memory stick which needs to be played on a computer` in the `You should provide the equipment to play this evidence. If this is not possible, explain why and what equipment you'll need to play it.` field
    And I should see `Yes` in the `Does the appellant need a single-sex court?` field
    And I should see `All female` in the `What type of court do they need?` field
    And I should see `The appellant is fearful of men` in the `Explain in detail why the appellant needs a single-sex court.` field
    And I should see `Yes` in the `Does the appellant need an in camera court?` field
    And I should see `The appellant is afraid of the general public` in the `Explain in detail why the appellant needs an in camera court.` field
    And I should see `Yes` in the `Is there anything else you would like to request?` field
    And I should see `The appellant would like fresh orange juice and doughnuts` in the `Provide details of any additional requests and why they are necessary.` field
    And I should see the `Dates to avoid` field
    And I should see `31 Dec 2019` in the `Date` field
    And I should see `New Year's Eve` in the `Reason` field

    When I click the `Submit` button
    Then I should see the text `You've submitted your hearing requirements`
    And I should see the text `What happens next`
    And I should see the text `The Tribunal will review your hearing requirements and any additional requests for adjustments.`
    And I should see the text `We'll notify you when the hearing is listed. You'll then be able to review the hearing requirements.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Submit hearing requirements`

    When I click the `Hearing` tab
    Then I should see the `Hearing` page
    And I should see the `Hearing requirements and requests` field
    And within the `Hearing requirements and requests` collection's first item, I should see `-Gonzlez-hearing-requirements.PDF` in the `Document` field
    And within the `Hearing requirements and requests` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And I should see the hearing requirements yes path
    And I should see the requests for additional adjustments yes path
    And I should not see the agreed additional adjustments yes path
    And I should see the text `Record of hearing details`
    And I should see the text `Hearing requirements and requests`


    When I click the `Documents` tab

    And I should not see the `Hearing documents` field

    When I switch to be a `Home Office APC`
    Then I click the `Hearing` tab
    And I should see the hearing requirements yes path
    And I should not see the requests for additional adjustments yes path
    And I should not see the agreed additional adjustments yes path
    And I should not see the text `Record of hearing details`
    And I should not see the text `Hearing requirements and requests`
    And I should not see the text `-Gonzlez-hearing-requirements.PDF`

    ### validate list case

    # Admin Officer
    When I switch to be a `Admin Officer`

    And I click the `Hearing` tab
    And I should not see the agreed additional adjustments yes path
    And I should see the requests for additional adjustments yes path
    And I should see the text `Record of hearing details`
    And I should see the text `Hearing requirements and requests`

    When I click the `Overview` tab
    And I should see `Legally Represented` tag
    Then I should only see the `adminOfficer_listing_submittedRequirements` case progress image

    And I should see the text `What happens next`
    And I should see the text `The Tribunal Caseworker will agree what adjustments the Tribunal will make.`

    When I select the `List the case` Next step
    Then I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `You've made an invalid request. You cannot list the case until the hearing requirements have been reviewed.`


    ### record agreed hearing requirements

    # CO:

    When I switch to be a `Case Officer`
    Then I click the `Overview` tab
    And  I should see `Legally Represented` tag
    And I should only see the `caseOfficer_reviewHearingRequirements.png` case progress image
    And I should see the text `You can view the hearing requirements and any requests for additional adjustments in the Hearing tab.`
    And I should see the text `You should contact the appellant if you need more information.`
    And I should see the text `You should then review and submit the hearing requirements and any additional adjustments.`

    And I click the review and submit link
    Then I should see the `Hearing requirements` page

    And I should see `Yes` in the `Will the appellant attend the hearing?` field
    And I should see `Yes` in the `Will the appellant give oral evidence at the hearing?` field
    And I should see `Yes` in the `Will any witnesses attend the hearing?` field
    And I should see `Jenny Button` in the `Witness details` field
    And I should see `Yes` in the `Do you need interpreter services on the day?` field
    And I should see `Yes` in the `Do you need a hearing room with step-free access?` field
    And I should see `Yes` in the `Do you need a hearing loop?` field
    Then I select `6 hours` for the `Length of appointment` field
    And I click the `Continue` button
    And I should see the text `Additional adjustments`
    And I should see the text `Check if the appellant has requested any additional adjustments and record your response in the relevant field.
    And I should see the text `Do not enter the reason the appellant made the request.`
    And I should see the text `The respondent will be able to see this information and must not be informed of the appellant's personal circumstances.`
    And I should see the text `Adjustment request`
    And I should see `Yes` in the `Does the appellant have any physical or mental health issues that may impact them on the day?` field
    And I should see `The appellant is deaf in one ear` in the `Explain in detail how any physical or mental health issues may affect them on the day.` field
    And I should see the text `Tribunal response`
    And I type `Physical or mental health conditions will be reviewed` for the `Physical or mental health conditions` field
    And I click the `Continue` button
    And I should see `Yes` in the `Do you have multimedia evidence?` field
    And I should see `The appellant has a video recording on a memory stick which needs to be played on a computer` in the `You should provide the equipment to play this evidence. If this is not possible, explain why and what equipment you'll need to play it.` field
    And I should see the text `Tribunal response`
    And I type `Multimedia equipment requirement will be reviewed` for the `Multimedia equipment` field
    And I click the `Continue` button
    And I should see `Yes` in the `Does the appellant need a single-sex court?` field
    And I should see `All female` in the `What type of court do they need?` field
    And I should see `The appellant is fearful of men` in the `Explain in detail why the appellant needs a single-sex court.` field
    And I type `Single sex court requirement will be reviewed` for the `Single-sex court` field
    And I click the `Continue` button
    And I should see `Yes` in the `Does the appellant need an in camera court?` field
    And I should see `The appellant is afraid of the general public` in the `Explain in detail why the appellant needs an in camera court.` field
    And I type `Private hearing requirement will be reviewed` for the `In camera court` field
    And I click the `Continue` button
    And I should see `Yes` in the `Is there anything else you would like to request?` field
    And I should see `The appellant would like fresh orange juice and doughnuts` in the `Provide details of any additional requests and why they are necessary.` field
    And I type `Additional adjustments requirement will be reviewed` for the `Other adjustments` field
    And I click the `Continue` button

    When I click the `Submit` button
    Then I should see the text `You've recorded the agreed hearing adjustments`
    And I should see the text `What happens next`
    And I should see the text `The listing team will now list the case. All parties will be notified when the Hearing Notice is available to view.`
    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Hearing requirements`

    When I select the `Hearing requirements` Next step
    Then I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `You've made an invalid request. The hearing requirements have already been reviewed.`

    When I click the `Hearing` tab
    Then I should not see the requests for additional adjustments yes path
    And I should see the agreed additional adjustments yes path

    ### listing

    # CO:

    When I switch to be a `Case Officer`
    And I click the `Overview` tab
    And I should see `Legally Represented` tag
    Then I should only see the `caseOfficer_listing` case progress image
    And I should see the text `Do this next`
    And I should see the text `The agreed hearing requirements and adjustments have been recorded.`
    And I should see the text `The listing team will now list the case.`

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I should not see the option `Add appeal response` for the `Next step` field
    And I should not see the option `Request hearing requirements` for the `Next step` field
    And I should not see the option `Upload additional evidence` for the `Next step` field

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change a direction due date` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should not see the option `List the case` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field

    When I click the `Hearing` tab
    Then I should see the hearing requirements yes path
    And I should not see the requests for additional adjustments yes path
    And I should see the agreed additional adjustments yes path
    And I should see the text `Record of hearing details`
    And I should see the text `Hearing requirements and requests`

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab
    And I should not see `Legally Represented` tag
    Then I should only see the `progress_legalRep_listing` case progress image
    And I should see the text `Do this next`
    And I should see the text `The case officer is reviewing the hearing requirements`
    And I should see the text `Once the requirements have been agreed with the Tribunal,`
    And I should see the text `the case will be listed and you will receive a notification with the hearing notice.`

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I should not see the option `Send direction` for the `Next step` field
    And I should not see the option `Change a direction due date` for the `Next step` field
    And I should not see the option `List the case` for the `Next step` field
    And I should not see the option `Add case note` for the `Next step` field
    And I should not see the option `Record an application` for the `Next step` field

    And I should see the option `Upload additional evidence` for the `Next step` field

    # Home Office APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab

    And I should not see `Legally Represented` tag
    And I should only see the `homeOffice_listing` case progress image
    And I should see the text `Do this next`
    And I should see the text `check that the Home Office response complies with the Procedural Rules and Practice Directions`
    And I should see the text `inform you of any issues`
    And I should see the text `Providing there are no issues, the response will be shared with the appellant.`
    And I should see the text `All parties will be notified when the Hearing Notice is ready.`
    And I should see the option `Upload additional evidence` for the `Next step` field

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    When I click the `Hearing` tab
    Then I should see the hearing requirements yes path
    And I should not see the requests for additional adjustments yes path
    And I should see the agreed additional adjustments yes path
    And I should not see the text `Record of hearing details`
    And I should not see the text `Hearing requirements and requests`



    # AO:

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab
    And I should see `Legally Represented` tag
    Then I should only see the `caseOfficer_listing` case progress image

    And I should see the text `Do this next`
    And I should see the text `The agreed hearing requirements and dates to avoid are available to view in the Hearing tab.`
    And I should see the text `When the case has been listed in Aria, you should list the case here.`

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I should not see the option `Add appeal response` for the `Next step` field
    And I should not see the option `Request hearing requirements` for the `Next step` field
    And I should not see the option `Upload additional evidence` for the `Next step` field
    And I should not see the option `Send direction` for the `Next step` field
    And I should not see the option `Change a direction due date` for the `Next step` field
    And I should see the option `List the case` for the `Next step` field

    When I click the `Hearing tab` link
    Then I should not see the requests for additional adjustments yes path
    Then I should see the agreed additional adjustments yes path

    ### prepare for hearing

    When I list the case

    And I click the `Overview` tab
    And I should see `Legally Represented` tag
    Then I should only see the `caseOfficer_prepareForHearing` case progress image

    And I should see the text `What happens next`
    And I should see the text `The Notice of Hearing will be sent to all parties.`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    When I click the `Hearing` tab
    Then I should see the hearing requirements yes path
    Then I should not see the requests for additional adjustments yes path
    Then I should see the agreed additional adjustments yes path
    And I should see the text `Record of hearing details`
    And I should see the text `Hearing requirements and requests`

    And I should see `LP/12345/2019` for the `Listing reference` field
    And I should see `6 hours` for the `Length of appointment` field
    And I should see `Taylor House` for the `Hearing centre` field
    And I should see `{$TODAY+14|D MMM YYYY}, 10:30:00 AM` for the `Appointment date and time` field
    And I should not see the `Hearing documents` field
    And within the `Hearing requirements and requests` collection's first item, I should see `-Gonzlez-hearing-requirements.PDF` in the `Document` field

    When I click the `Documents` tab
    And within the `Hearing documents` collection's first item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field

    # CO

    When I switch to be a `Case Officer`
    And I click the `Overview` tab
    And I should see `Legally Represented` tag
    Then I should only see the `caseOfficer_prepareForHearing` case progress image

    And I should see the text `Do this next`
    And I should see the text `You must create a case summary for the judge to use at the hearing`

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change a direction due date` for the `Next step` field
    And I should see the option `Create case summary` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should see the option `Edit case listing` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    When I click the `Create case summary` link
    Then I am on the `Create case summary` page
    And I click the `Cancel` link

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab
    And I should not see `Legally Represented` tag
    Then I should only see the `progress_legalRep_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the hearing details are ready to view in the Hearing tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I should see the option `Upload additional evidence` for the `Next step` field

    When I click the `Hearing tab` link
    Then I am on the `Hearing` page

    # Home Office APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab

    And I should not see `Legally Represented` tag
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the hearing details are ready to view in the Hearing tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`
    And I should see the option `Upload additional evidence` for the `Next step` field

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details
    And I click the `Hearing` tab
    Then I should see the hearing requirements yes path
    And I should not see the requests for additional adjustments yes path
    And I should see the agreed additional adjustments yes path
    And I should not see the text `Record of hearing details`
    And I should not see the text `Hearing requirements and requests`


    ### final bundling

    # CO:

    When I switch to be a `Case Officer`
    And I create case summary
    And I click the `Overview` tab
    And I should see `Legally Represented` tag
    Then I should only see the `caseOfficer_finalBundling` case progress image

    And I should see the case details
    And I should see the legal representative details
    And I should see the hearing details

    And I should not see the option `Create case summary` for the `Next step` field

    And I should see the option `Generate hearing bundle` for the `Next step` field
    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change a direction due date` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should see the option `Edit case listing` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field

    When I click the `Generate hearing bundle` link
    Then I am on the `Generate hearing bundle` page
    And I click the `Cancel` link

    # Home Office APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab

    And I should not see `Legally Represented` tag
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the hearing details are ready to view in the Hearing tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab
    And I should not see `Legally Represented` tag
    Then I should only see the `progress_legalRep_listed` case progress image
    And I should see the text `Do this next`
    And I should see the text `The case has now been listed. Go to the documents tab to see the Hearing notice, which includes the hearing details.`
    And I should see the text `Go to the documents`
    And I should see the case details
    And I should see the legal representative details
    And I should see the hearing details

    When I click the `Go to the documents tab` link


    ### start decision and reasons

    # CO:

    When I switch to be a `Case Officer`
    And I generate the hearing bundle
    And I click the `Overview` tab
    And I should see `Legally Represented` tag
    Then I should only see the `caseOfficer_preHearing` case progress image

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I should not see the option `Generate hearing bundle` for the `Next step` field

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change a direction due date` for the `Next step` field
    And I should see the option `Start decision and reasons` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should see the option `Edit case listing` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field
    And I should see the option `Upload additional evidence` for the `Next step` field

    When I click the `Start decision and reasons` link
    Then I am on the `Start decision and reasons` page
    And I click the `Cancel` link

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab
    And I should not see `Legally Represented` tag
    Then I should only see the `progress_legalRep_preHearing` case progress image
    And I should see the text `Do this next`
    And I should see the text `You can now view the hearing bundle in the documents tab.`
    And I should see the text `Go to the documents`
    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details
    And I should see the option `Upload additional evidence` for the `Next step` field

    When I click the `Go to the documents tab` link


    # Home Office APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab

    And I should not see `Legally Represented` tag
    And I should only see the `homeOffice_preHearing` case progress image

    And I should see the text `Do this next`
    And I should see the text `The hearing bundle is ready to view in the documents tab`
    And I should see the option `Upload additional evidence` for the `Next step` field

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    # Prepare decision and reasons

    # CO:

    When I switch to be a `Case Officer`
    And I start decision and reasons
    And I click the `Overview` tab
    And I should see `Legally Represented` tag
    Then I should only see the `caseOfficer_decision` case progress image
    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change a direction due date` for the `Next step` field
    And I should see the option `Prepare Decision and Reasons` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should see the option `Edit case listing` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field
    And I should see the option `Upload additional evidence` for the `Next step` field

    And I should see the text `What happens next`
    And I should see the text `The judge will complete the Decision and Reasons document and upload it to the service.`
    And I should see the text `Both parties will be notified when it's available to view and download from the Documents tab.`

    When I select the `Prepare Decision and Reasons` Next step
    Then I am on the `Prepare Decision and Reasons` page
    And I click the `Cancel` link

    # Judge:
    When I switch to be a `Judge`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_decision` case progress image
    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details
    And I should see the text `Do this next`
    Then I should see the `Prepare the Decision and Reasons document` link

    And I should see the option `Prepare Decision and Reasons` for the `Next step` field

    When I click the `Prepare the Decision and Reasons document` link
    Then I am on the `Prepare Decision and Reasons` page
    And I click the `Cancel` link

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab
    And I should not see `Legally Represented` tag
    Then I should only see the `progress_legalRep_decision` case progress image
    And I should see the text `Do this next`
    And I should see the text `The judge is writing the decisions and reasons. You will be notified when it is available to view.`
    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details
    And I should see the option `Upload additional evidence` for the `Next step` field

    ### add case note
    When I switch to be a `Case Officer`
    When I select the `Add case note` Next step
    Then I am on the `Add case note` page
    And I should see the text `Add your case note below`
    And the `Continue` button is disabled

    When I type `some case note subject` for the `Subject` field
    Then the `Continue` button is disabled

    When I type `some case note description` for the `Case note` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `some case note subject` in the `Subject` field
    And I should see `some case note description` in the `Case note` field

    When I click the `Save note` button
    Then I should see the text `You have added a case note`
    Then I should see the text `What happens next`
    Then I should see the text `You can review this note in the case notes tab.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Add case note`

    When I click the `Case notes` tab
    Then I should see the `Case notes` field

    ### record application
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
    And I click the `Refused` label
    And I type `some application decision reason` for the `Reasons for decision` field

    Then the `Continue` button is enabled

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `test.doc` in the `Application email` field
    And I should see `The legal representative` in the `Application from` field
    And I should see `Transfer` in the `Type of application` field
    And I should see `some application reason` in the `Reason for application` field
    And I should see `{$TODAY-5|D MMM YYYY}` in the `Date application was made` field
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

    ### send decision and reasons

    # CO:
    And I click the `Overview` tab
    And I should see the text `What happens next`
    And I should see the text `The judge will complete the Decision and Reasons document and upload it to the service.`
    And I should see the text `Both parties will be notified when it's available to view and download from the Documents tab.`
    And I prepare decision and reasons
    And I click the `Overview` tab
    And I should see the text `What happens next`
    And I should see the text `The judge will complete the Decision and Reasons document and upload it to the service.`
    And I should see the text `Both parties will be notified when it's available to view and download from the Documents tab.`

    Then I should only see the `caseOfficer_decision` case progress image
    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change a direction due date` for the `Next step` field
    And I should see the option `Complete decision and reasons` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should see the option `Edit case listing` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field
    And I should see the option `Upload additional evidence` for the `Next step` field

    When I select the `Complete decision and reasons` Next step
    Then I am on the `Complete decision and reasons` page
    And I click the `Cancel` link

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab
    And I should not see `Legally Represented` tag
    Then I should only see the `progress_legalRep_decision` case progress image
    And I should see the text `Do this next`
    And I should see the text `The judge is writing the decisions and reasons. You will be notified when it is available to view.`
    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details
    And I should see the option `Upload additional evidence` for the `Next step` field

    # Home Office APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab

    And I should not see `Legally Represented` tag
    And I should only see the `homeOffice_decision` case progress image

    And I should see the text `Do this next`
    And I should see the text `The Judge is writing up the Decision and Reasons document, you'll be notified when this is ready to view.`
    And I should see the option `Upload additional evidence` for the `Next step` field

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I click the `Appellant` tab
    And I should see the appellant's details
    And I should not see the decision fields

    # Decided

    # CO:

    When I switch to be a `Case Officer`
    And I send decision and reasons
    And I click the `Overview` tab
    And I should see `Legally Represented` tag
    Then I should only see the `appeal_allowed` case progress image
    And I should see the text `The case has been decided. Either party has the right to appeal this decision, they have 14 days from the date of decision to do this.`
    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details
    And I should see the option `Add case note` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field
    And I should see the option `Upload additional evidence` for the `Next step` field

    And I click the `Appellant` tab
    And I should see the appellant's details
    And I should not see the decision fields

    # LR:

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab
    And I should not see `Legally Represented` tag
    Then I should only see the `appeal_allowed` case progress image
    And I should see the text `What happens next`
    And I should see the text `The appeal has been decided. You have the right to apply for permission to appeal to the Upper Tribunal.`
    And I should see the text `You have 14 days to apply from the date the Decision and Reasons document was uploaded.`
    Then I should see the `apply for permission to appeal` link
    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details
    And I should see the option `Upload additional evidence` for the `Next step` field

    And I click the `apply for permission to appeal` link
    Then I should see the text `Apply for permission to appeal`
    And I click the `Cancel` link

    And I click the `Appellant` tab
    And I should see the appellant's details
    And I should not see the decision fields

    # Home Office APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab

    And I should not see `Legally Represented` tag
    And I should only see the `appeal_allowed` case progress image

    And I should see the text `What happens next`
    And I should see the text `The appeal has been allowed. The Decision and Reasons document is available in the documents tab`
    And I should see the option `Upload additional evidence` for the `Next step` field

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I click the `Appellant` tab
    And I should see the appellant's details
    And I should not see the decision fields

    # Home Office POU
    When I switch to be a `Home Office POU`
    And I should see the image `appeal_allowed.png`
    And I should see the text `What happens next`
    And I should see the text `The appeal has been decided. You have the right to apply for permission to appeal to the Upper Tribunal.`
    And I should see the text `You have 14 days to apply from the date the Decision and Reasons document was uploaded.`
    Then I should see the `apply for permission to appeal` link
    And I click the `apply for permission to appeal` link
    Then I should see the text `Apply for permission to appeal`
    And I click the `Cancel` link

    # AO

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab
    And I should see `Legally Represented` tag
    Then I should only see the `appeal_allowed` case progress image
    And I should see the text `Record the attendees and duration of the hearing.`

    When I click the `Record attendees and duration` link
    And I type `Judge Judy` for the `The judge` field
    And I type `2` for the `Hours` field
    And I type `30` for the `Minutes` field
    And I select `All participants at the hearing centre` for the `How was the hearing conducted?` field
    And I click the `Continue` button
    And I click the `Save details` button
    And I click the `Close and Return to case details` button
    And I click the `Overview` tab

    Then I should only see the `appeal_allowed` case progress image
    And I should see the text `The case has been decided. Either party has the right to appeal this decision, they have 14 days from the date of decision to do this.`

    And I click the `Appellant` tab
    And I should see the appellant's details
    And I should not see the decision fields

    And I click the `Hearing` tab
    And I should see the `Hearing` page
    And I should see the `Hearing attendance` field
    And I should see `Judge Judy` for the `The judge` field
    And I should see `2` for the `Hours` field
    And I should see `30` for the `Minutes` field

    # HO APC

    When I switch to be a `Home Office APC`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `CaseArgument.pdf` in the first `Appeal skeleton argument` field
    And I should see `This is the case argument` in the first `Description` field
    And within the first `Evidence` collection's first item, I should see `CaseArgumentEvidence.pdf` in the `Document` field
    And within the first `Evidence` collection's first item, I should see `The is the case argument evidence` in the `Describe the document` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` in the `Grounds of appeal` field
    And I should see `Refusal of protection claim` in the `Type of appeal` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` in the `Grounds of appeal` field

    When I click the `Appellant` tab
    Then the `Appeal reference` field should be 13 characters long
    And I should see `Mr` in the `Title` field
    And I should see `José` in the `Given names` field
    And I should see `González` in the `Family name` field
    And I should see `31 Dec 1999` in the `Date of birth` field
    And I should see `Finland` in the `Nationality` field
    And I should see `No` in the `Does the appellant have a fixed address?` field
    And I should see `Stephen Fenn` in the `Name` field
    And I should see `IA Legal Services` in the `Company` field
    And I should see `ia-law-firm-a@fake.hmcts.net` in the `Email` field
    And I should see `ia-legal-fenn` in the `Legal representative reference` field

    And I should not see the decision fields

    When I click the `Documents` tab

    And I should see the `Hearing documents` field
    And within the `Hearing documents` collection's first item, I should see `-González-hearing-bundle.PDF` in the `Document` field
    And within the `Hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Hearing documents` collection's second item, I should see `CaseSummary.pdf` in the `Document` field
    And within the `Hearing documents` collection's second item, I should see `This is the case summary` in the `Description` field
    And within the `Hearing documents` collection's third item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field
    And within the `Hearing documents` collection's third item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And I should see the `Appellant documents` field
    And within the `Appellant documents` collection's first item, I should see `-González-appeal-skeleton-argument.PDF` in the `Document` field
    And within the `Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Appellant documents` collection's second item, I should see `CaseArgument.pdf` in the `Document` field
    And within the `Appellant documents` collection's second item, I should see `This is the case argument` in the `Description` field
    And within the `Appellant documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Appellant documents` collection's third item, I should see `CaseArgumentEvidence.pdf` in the `Document` field
    And within the `Appellant documents` collection's third item, I should see `The is the case argument evidence` in the `Description` field
    And within the `Appellant documents` collection's third item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Appellant documents` collection's fourth item, I should see `-Gonzlez-appeal-form.PDF` in the `Document` field
    And within the `Appellant documents` collection's fourth item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Respondent documents` collection's first item, I should see `AppealResponseUpdated.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the updated appeal response` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Respondent documents` collection's second item, I should see `AppealResponseEvidenceUpdated.pdf` in the `Document` field
    And within the `Respondent documents` collection's second item, I should see `This is the updated evidence` in the `Description` field
    And within the `Respondent documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Respondent documents` collection's third item, I should see `AppealResponse.pdf` in the `Document` field
    And within the `Respondent documents` collection's third item, I should see `This is the appeal response` in the `Description` field
    And within the `Respondent documents` collection's third item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Respondent documents` collection's fourth item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Respondent documents` collection's fourth item, I should see `This is the evidence` in the `Description` field
    And within the `Respondent documents` collection's fourth item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Respondent documents` collection's fifth item, I should see `RespondentEvidenceUpdated.pdf` in the `Document` field
    And within the `Respondent documents` collection's fifth item, I should see `This is the updated evidence` in the `Description` field
    And within the `Respondent documents` collection's fifth item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Respondent documents` collection's sixth item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Respondent documents` collection's sixth item, I should see `This is the respondent evidence` in the `Description` field
    And within the `Respondent documents` collection's sixth item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Decision and reason documents` collection's first item, I should see `-Gonzlez-Decision-and-reasons-FINAL.pdf` in the `Document` field
    And within the `Decision and reason documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Decision and reason documents` collection's second item, I should see `-Gonzlez-Decision-and-reasons-Cover-letter.PDF` in the `Document` field
    And within the `Decision and reason documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I click the `Directions` tab
    And within the `Directions` collection's first item, I should see `The appeal is going to a hearing and you should tell the Tribunal if the appellant has any hearing requirements.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` for the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+5|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field
    And within the `Directions` collection's second item, I should see `The Home Office has replied to your Appeal Skeleton Argument and evidence. You should review their response.` in the `Explanation` field
    And within the `Directions` collection's second item, I should see `Review the Home Office response. If you want to respond to what they have said, you should email the Tribunal.` in the `Explanation` field
    And within the `Directions` collection's second item, I should see `Legal representative` for the `Parties` field
    And within the `Directions` collection's second item, I should see `{$TODAY+5|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field
    And within the `Directions` collection's seventh item, I should see `A notice of appeal has been lodged against this asylum decision.` in the `Explanation` field
    And within the `Directions` collection's seventh item, I should see `You must now send all documents to the case officer.` in the `Explanation` field
    And within the `Directions` collection's seventh item, I should see `You have until the date indicated below to supply` in the `Explanation` field
    And within the `Directions` collection's seventh item, I should see `Respondent` for the `Parties` field
    And within the `Directions` collection's seventh item, I should see `{$TODAY+14|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's seventh item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

    # Judge read-only
    When I switch to be a `Judge`

    When I click the `Overview` tab
    Then I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    When I click the `Appeal` tab
    Then I should see the appeal details
    And I should see the submission details

    When I click the `Appellant` tab
    Then I should see the appellant's details

    When I click the `Documents` tab

    And I should see the `Hearing documents` field
    And I should see the `Appellant documents` field
    And I should see the `Respondent documents` field

    When I click the `Directions` tab
    And within the `Directions` collection's first item, I should see `The appeal is going to a hearing and you should tell the Tribunal if the appellant has any hearing requirements.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` for the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+5|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field
    And within the `Directions` collection's seventh item, I should see `A notice of appeal has been lodged against this asylum decision.` in the `Explanation` field
    And within the `Directions` collection's seventh item, I should see `You must now send all documents to the case officer.` in the `Explanation` field
    And within the `Directions` collection's seventh item, I should see `You have until the date indicated below to supply` in the `Explanation` field
    And within the `Directions` collection's seventh item, I should see `Respondent` for the `Parties` field
    And within the `Directions` collection's seventh item, I should see `{$TODAY+14|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's seventh item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

    When I click the `Case notes` tab
    Then I should see the `Case notes` field

    When I click the `Applications` tab
    Then I should see the `Applications` field

    When I click the `Hearing` tab
    Then I should see the hearing requirements yes path
    And I should not see the requests for additional adjustments yes path
    And I should see the agreed additional adjustments yes path
    And I should see the text `Record of hearing details`
    And I should see the text `Hearing requirements and requests`
