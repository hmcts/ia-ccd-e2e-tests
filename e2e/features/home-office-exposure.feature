Feature: Different Home Office roles have different functionality


  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence

  @regression @home-office-exposure @RIA-1707 @RIA-1798 @RIA-1357 @RIA-2236
  Scenario: Home office functionality


    # HO LART:
    When I switch to be a `Home Office LART`
    And I click the `Overview` tab

    Then I should only see the `homeOffice_uploadBundle` case progress image

    And I should see the text `Do this next`
    And I should see the text `An appeal against the Home Office decision in this case has been submitted. You can view the appeal form in the documents tab`

    And I should see the case details
    And I should not see the hearing details
    And I should see the legal representative details
    And I should not see the `Next step` field

    When I click the `documents tab` link
    Then I am on the `Documents` page

    # HO POU:
    When I switch to be a `Home Office POU`
    And I click the `Overview` tab

    Then I should only see the `homeOffice_uploadBundle` case progress image

    And I should see the text `Do this next`
    And I should see the text `An appeal against the Home Office decision in this case has been submitted. You can view the appeal form in the documents tab`

    And I should see the case details
    And I should not see the hearing details
    And I should see the legal representative details
    And I should not see the `Next step` field

    When I click the `documents tab` link
    Then I am on the `Documents` page

    # HO GENERIC:
    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab

    Then I should only see the `homeOffice_uploadBundle` case progress image

    And I should see the text `Do this next`
    And I should see the text `An appeal against the Home Office decision in this case has been submitted. You can view the appeal form in the documents tab`
    And I should see the text `If you accept that there is a right of appeal you should upload the Home Office bundle`
    And I should see the text `If you consider the appeal is not valid, you should contact the Tribunal and the appellant with your reasons`

    And I should see the case details
    And I should not see the hearing details
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
    And I click the `Cancel` link

    When I click the `documents tab` link
    Then I am on the `Documents` page

    # HO APC:
    Given I switch to be a `Home Office APC`
    And I click the `Overview` tab

    Then I should only see the `homeOffice_uploadBundle` case progress image

    And I should see the text `Do this next`
    And I should see the text `An appeal against the Home Office decision in this case has been submitted. You can view the appeal form in the documents tab`
    And I should see the text `If you accept that there is a right of appeal you should upload the Home Office bundle`
    And I should see the text `If you consider the appeal is not valid, you should contact the Tribunal and the appellant with your reasons`

    And I should see the case details
    And I should not see the hearing details
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

    When I add an item to the `Upload Home Office bundle` collection
    And within the `Upload Home Office bundle` collection's first item, I upload `{@RespondentEvidence.pdf}` for the `Document` field
    And within the `Upload Home Office bundle` collection's first item, I type `This is the evidence` for the `Describe the document` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `RespondentEvidence.pdf` in the `Document` field
    And I should see `This is the evidence` in the `Describe the document` field

    When I click the `Upload` button
    Then I should see the text `You've uploaded the Home Office bundle`
    And I should see the text `What happens next`
    And I should see the text `The Home Office will be notified when the Appeal Skeleton Argument is ready to review.`

    When I click the `Close and Return to case details` button
    And I click the `Documents` tab
    Then I should see the `Documents` page
    And within the `Respondent documents` collection's first item, I should see `RespondentEvidence.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the evidence` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    Then I should only see the `homeOffice_awaitAppealSkeletonArgument` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Tribunal will:`
    And I should see the text `check that the bundle complies with the Procedural Rules and Practice Directions`
    And I should see the text `inform you of any issues`
    And I should see the text `The Home Office will be notified when the Appeal Skeleton Argument is ready to review`

    # HO LART:
    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    Then I should only see the `homeOffice_awaitAppealSkeletonArgument` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Tribunal will:`
    And I should see the text `check that the bundle complies with the Procedural Rules and Practice Directions`
    And I should see the text `inform you of any issues`
    And I should see the text `The Home Office will be notified when the Appeal Skeleton Argument is ready to review`

    # HO POU:
    When I switch to be a `Home Office POU`
    And I click the `Overview` tab
    Then I should only see the `homeOffice_awaitAppealSkeletonArgument` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Tribunal will:`
    And I should see the text `check that the bundle complies with the Procedural Rules and Practice Directions`
    And I should see the text `inform you of any issues`
    And I should see the text `The Home Office will be notified when the Appeal Skeleton Argument is ready to review`

    # HO GENERIC:
    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab
    Then I should only see the `homeOffice_awaitAppealSkeletonArgument` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Tribunal will:`
    And I should see the text `check that the bundle complies with the Procedural Rules and Practice Directions`
    And I should see the text `inform you of any issues`
    And I should see the text `The Home Office will be notified when the Appeal Skeleton Argument is ready to review`

    # CO
    And I switch to be a `Case Officer`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_awaitingRespondentEvidence_postUpload` case progress image

    And I should see the text `Do this next`
    And I should see the text `The respondent has submitted their evidence`
    And I should see the `direct the legal representative to build their case` link
    And I should see the `direct the respondent to make the appropriate changes` link

    And I should see the case details
    And I should not see the hearing details
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

    When I click the `direct the legal representative to build their case` link
    Then I am on the `Request case building` page
    And I click the `Continue` button
    And I click the `Send direction` button
    And I click the `Close and Return to case details` button

    # HO APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    Then I should only see the `homeOffice_awaitAppealSkeletonArgument` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Tribunal will:`
    And I should see the text `check that the bundle complies with the Procedural Rules and Practice Directions`
    And I should see the text `inform you of any issues`
    And I should see the text `The Home Office will be notified when the Appeal Skeleton Argument is ready to review`

    # HO LART:
    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    Then I should only see the `homeOffice_awaitAppealSkeletonArgument` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Tribunal will:`
    And I should see the text `check that the bundle complies with the Procedural Rules and Practice Directions`
    And I should see the text `inform you of any issues`
    And I should see the text `The Home Office will be notified when the Appeal Skeleton Argument is ready to review`

    # HO POU:
    When I switch to be a `Home Office POU`
    And I click the `Overview` tab
    Then I should only see the `homeOffice_awaitAppealSkeletonArgument` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Tribunal will:`
    And I should see the text `check that the bundle complies with the Procedural Rules and Practice Directions`
    And I should see the text `inform you of any issues`
    And I should see the text `The Home Office will be notified when the Appeal Skeleton Argument is ready to review`

    # HO GENERIC:
    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab
    Then I should only see the `homeOffice_awaitAppealSkeletonArgument` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Tribunal will:`
    And I should see the text `check that the bundle complies with the Procedural Rules and Practice Directions`
    And I should see the text `inform you of any issues`
    And I should see the text `The Home Office will be notified when the Appeal Skeleton Argument is ready to review`

    # LR:
    And I switch to be a `Legal Rep`
    And I build my case
    And I submit my case

    # HO APC:
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    Then I should only see the `homeOffice_awaitAppealSkeletonArgument` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Tribunal will:`
    And I should see the text `check that the bundle complies with the Procedural Rules and Practice Directions`
    And I should see the text `inform you of any issues`
    And I should see the text `The Home Office will be notified when the Appeal Skeleton Argument is ready to review`
    And I should not see the option `Request respondent review` for the `Next step` field

    # HO LART:
    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    Then I should only see the `homeOffice_awaitAppealSkeletonArgument` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Tribunal will:`
    And I should see the text `check that the bundle complies with the Procedural Rules and Practice Directions`
    And I should see the text `inform you of any issues`
    And I should see the text `The Home Office will be notified when the Appeal Skeleton Argument is ready to review`
    And I should not see the option `Request respondent review` for the `Next step` field

    # HO POU:
    When I switch to be a `Home Office POU`
    And I click the `Overview` tab
    Then I should only see the `homeOffice_awaitAppealSkeletonArgument` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Tribunal will:`
    And I should see the text `check that the bundle complies with the Procedural Rules and Practice Directions`
    And I should see the text `inform you of any issues`
    And I should see the text `The Home Office will be notified when the Appeal Skeleton Argument is ready to review`
    And I should not see the option `Request respondent review` for the `Next step` field

    # HO GENERIC:
    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab
    Then I should only see the `homeOffice_awaitAppealSkeletonArgument` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Tribunal will:`
    And I should see the text `check that the bundle complies with the Procedural Rules and Practice Directions`
    And I should see the text `inform you of any issues`
    And I should see the text `The Home Office will be notified when the Appeal Skeleton Argument is ready to review`
    And I should not see the option `Request respondent review` for the `Next step` field

    #####################################
    ### Moved out of case progression ###
    #####################################

    And I switch to be a `Case Officer`
    And I request respondent review
    And I add the appeal response
    And I request appellant review
    And I request hearing requirements
    And I switch to be a `Legal Rep`
    And I submit hearing requirements with all yes
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path

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

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

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

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

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

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

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

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I switch to be a `Admin Officer`
    And I list the case

    # Home Office APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the hearing details are ready to view in the Hearing tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    # Home Office LART
    When I switch to be a `Home Office LART`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the hearing details are ready to view in the Hearing tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    # Home Office POU
    When I switch to be a `Home Office POU`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the hearing details are ready to view in the Hearing tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    # Home Office Generic
    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the hearing details are ready to view in the Hearing tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details


    And I switch to be a `Case Officer`
    And I create case summary


    # Home Office APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the hearing details are ready to view in the Hearing tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    # Home Office LART
    When I switch to be a `Home Office LART`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the hearing details are ready to view in the Hearing tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    # Home Office POU
    When I switch to be a `Home Office POU`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the hearing details are ready to view in the Hearing tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    # Home Office Generic
    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the hearing details are ready to view in the Hearing tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details


    And I switch to be a `Case Officer`
    And I generate the hearing bundle


    # Home Office APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_preHearing` case progress image

    And I should see the text `Do this next`
    And I should see the text `The hearing bundle is ready to view in the documents tab`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    # Home Office LART
    When I switch to be a `Home Office LART`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_preHearing` case progress image

    And I should see the text `Do this next`
    And I should see the text `The hearing bundle is ready to view in the documents tab`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    # Home Office POU
    When I switch to be a `Home Office POU`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_preHearing` case progress image

    And I should see the text `Do this next`
    And I should see the text `The hearing bundle is ready to view in the documents tab`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    # Home Office Generic
    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_preHearing` case progress image

    And I should see the text `Do this next`
    And I should see the text `The hearing bundle is ready to view in the documents tab`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details


    When I switch to be a `Case Officer`
    And I start decision and reasons
    And I generate decision and reasons


    # Home Office APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_decision` case progress image

    And I should see the text `Do this next`
    And I should see the text `The Judge is writing up the Decision and Reasons document, you'll be notified when this is ready to view.`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I click the `Appellant` tab
    And I should see the appellant's details
    And I should not see the decision fields

    # Home Office LART
    When I switch to be a `Home Office LART`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_decision` case progress image

    And I should see the text `Do this next`
    And I should see the text `The Judge is writing up the Decision and Reasons document, you'll be notified when this is ready to view.`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I click the `Appellant` tab
    And I should see the appellant's details
    And I should not see the decision fields

    # Home Office POU
    When I switch to be a `Home Office POU`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_decision` case progress image

    And I should see the text `Do this next`
    And I should see the text `The Judge is writing up the Decision and Reasons document, you'll be notified when this is ready to view.`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I click the `Appellant` tab
    And I should see the appellant's details
    And I should not see the decision fields

    # Home Office Generic
    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `homeOffice_decision` case progress image

    And I should see the text `Do this next`
    And I should see the text `The Judge is writing up the Decision and Reasons document, you'll be notified when this is ready to view.`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I click the `Appellant` tab
    And I should see the appellant's details
    And I should not see the decision fields


    When I switch to be a `Case Officer`
    And I send decision and reasons


    # Home Office APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `appeal_allowed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The appeal has been allowed. The Decision and Reasons document is available in the documents tab`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I click the `Appellant` tab
    And I should see the appellant's details
    And I should not see the decision fields

    # Home Office LART
    When I switch to be a `Home Office LART`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `appeal_allowed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The appeal has been allowed. The Decision and Reasons document is available in the documents tab`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I click the `Appellant` tab
    And I should see the appellant's details
    And I should not see the decision fields

    # Home Office POU
    When I switch to be a `Home Office POU`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `appeal_allowed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The appeal has been allowed. The Decision and Reasons document is available in the documents tab`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I click the `Appellant` tab
    And I should see the appellant's details
    And I should not see the decision fields

    # Home Office Generic
    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab

    Then I should see the `Overview` page
    And I should only see the `appeal_allowed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The appeal has been allowed. The Decision and Reasons document is available in the documents tab`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I click the `Appellant` tab
    And I should see the appellant's details
    And I should not see the decision fields
