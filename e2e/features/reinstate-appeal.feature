Feature: Reinstate appeal

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal

  @reinstate-appeal-ended-appeal-submitted @reinstate-appeal-submitted @RIA-3039
  Scenario: Reinstate appeal after end appeal submitted

    And I switch to be a `Case Officer`
    And I end the appeal
    And I reinstate the appeal

    And I click the `Overview` tab
    Then I should only see the `caseOfficer_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the text `You must review the appeal in the documents tab. If the appeal looks valid, you must tell the respondent to supply their evidence.`
    And I should see the ended appeal reinstate details
    And I should see the ended appeal details
    And I should see the case details

    And I switch to be a `Judge`
    And I end the appeal
    And I reinstate the appeal

    And I click the `Overview` tab
    Then I should only see the `caseOfficer_appealSubmitted` case progress image

    And I switch to be a `Admin Officer`
    And I end the appeal
    And I reinstate the appeal

    And I click the `Overview` tab
    Then I should only see the `caseOfficer_appealSubmitted` case progress image
    And I should see the ended appeal reinstate details
    And I should see the ended appeal details
    And I should see the case details

  @reinstate-appeal-ended-appeal-respondent-evidence @reinstate-appeal-respondent-evidence @RIA-3039
  Scenario: Reinstate appeal after end appeal submitted

    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I end the appeal
    And I reinstate the appeal

    And I click the `Overview` tab
    Then I should only see the `caseOfficer_awaitingRespondentEvidence` case progress image
    And I should see the text `What happens next`
    And I should see the ended appeal reinstate details
    And I should see the ended appeal details
    And I should see the case details

    And I switch to be a `Judge`
    And I end the appeal
    And I reinstate the appeal

    And I click the `Overview` tab
    Then I should only see the `caseOfficer_awaitingRespondentEvidence` case progress image

    And I switch to be a `Admin Officer`
    And I end the appeal
    And I reinstate the appeal

    And I click the `Overview` tab
    Then I should only see the `caseOfficer_awaitingRespondentEvidence` case progress image

    And I switch to be a `Case Officer`
    When I request respondent evidence
    And I click the `Overview` tab
    And I should see `Legally Represented` tag
    Then I should only see the `caseOfficer_awaitingRespondentEvidence_preUpload` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Home Office will prepare their bundle.`
    And I should see the ended appeal reinstate details
    And I should see the ended appeal details
    And I should see the case details

  @reinstate-appeal-ended-appeal-case-building @reinstate-appeal-case-building @RIA-3039
  Scenario: Reinstate appeal after end appeal submitted

    When I switch to be a `Case Officer`
    And I request respondent evidence

    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    And I click the `upload the Home Office bundle` link
    And I add an item to the `Upload Home Office bundle` collection
    And within the `Upload Home Office bundle` collection's first item, I upload `{@Evidence1.pdf}` for the `Upload a file` field
    And within the `Upload Home Office bundle` collection's first item, I type `This is the respondent evidence` for the `Describe the document` field
    And I click the `Continue` button
    And I click the `Upload` button
    And  I click the `Close and Return to case details` button if present

    When I switch to be a `Case Officer`
    And I upload respondent evidence

    And I switch to be a `Admin Officer`
    And I should see the text `What happens next`
    And I should see the text `The appellant will build their case.`
    And I end the appeal
    And I reinstate the appeal

    Then I should only see the `caseOfficer_caseBuilding` case progress image
    And I should see the text `What happens next`
    And I should see the text `The appellant will build their case.`
    And I should see the ended appeal reinstate details
    And I should see the ended appeal details
    And I should see the case details

  @reinstate-appeal-ended-appeal-case-under-review @reinstate-appeal-case-under-review @RIA-3039
  Scenario: Reinstate appeal after end appeal submitted

    When I switch to be a `Case Officer`
    And I request respondent evidence

    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    And I click the `upload the Home Office bundle` link
    And I add an item to the `Upload Home Office bundle` collection
    And within the `Upload Home Office bundle` collection's first item, I upload `{@Evidence1.pdf}` for the `Upload a file` field
    And within the `Upload Home Office bundle` collection's first item, I type `This is the respondent evidence` for the `Describe the document` field
    And I click the `Continue` button
    And I click the `Upload` button
    And  I click the `Close and Return to case details` button if present

    When I switch to be a `Case Officer`
    And I upload respondent evidence

    And I switch to be a `Legal Rep`
    And I build my case

    And I switch to be a `Legal Rep`
    And I submit my case

    When I switch to be a `Judge`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_caseUnderReview` case progress image
    And I end the appeal
    And I reinstate the appeal
    Then I should only see the `caseOfficer_caseUnderReview` case progress image
    And I should see the ended appeal reinstate details
    And I should see the ended appeal details
    And I should see the case details

  @reinstate-appeal-ended-respondent-review @RIA-3039
  Scenario: Reinstate appeal after end appeal submitted

    When I switch to be a `Case Officer`
    And I request respondent evidence

    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    And I click the `upload the Home Office bundle` link
    And I add an item to the `Upload Home Office bundle` collection
    And within the `Upload Home Office bundle` collection's first item, I upload `{@Evidence1.pdf}` for the `Upload a file` field
    And within the `Upload Home Office bundle` collection's first item, I type `This is the respondent evidence` for the `Describe the document` field
    And I click the `Continue` button
    And I click the `Upload` button
    And  I click the `Close and Return to case details` button if present

    When I switch to be a `Case Officer`
    And I upload respondent evidence

    And I switch to be a `Legal Rep`
    And I build my case

    And I switch to be a `Legal Rep`
    And I submit my case

    And I switch to be a `Case Officer`
    And I request respondent review

    When I switch to be a `Judge`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_respondentReviewStarted` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Home Office will review the case submitted by the appellant.`

    And I end the appeal
    And I reinstate the appeal
    Then I should only see the `caseOfficer_respondentReviewStarted` case progress image
    And I should see the ended appeal reinstate details
    And I should see the ended appeal details

  @reinstate-appeal-ended-submit-hearing-requirements @RIA-3039
  Scenario: Reinstate appeal after end appeal submitted

    When I switch to be a `Case Officer`
    And I request respondent evidence

    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    And I click the `upload the Home Office bundle` link
    And I add an item to the `Upload Home Office bundle` collection
    And within the `Upload Home Office bundle` collection's first item, I upload `{@Evidence1.pdf}` for the `Upload a file` field
    And within the `Upload Home Office bundle` collection's first item, I type `This is the respondent evidence` for the `Describe the document` field
    And I click the `Continue` button
    And I click the `Upload` button
    And  I click the `Close and Return to case details` button if present

    When I switch to be a `Case Officer`
    And I upload respondent evidence

    And I switch to be a `Legal Rep`
    And I build my case

    And I switch to be a `Legal Rep`
    And I submit my case

    And I switch to be a `Case Officer`
    And I request respondent review

    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    And I click the `add the Home Office's response` link
    And I select `Decision maintained` for the `Outcome` field
    And I click the `Continue` button
    And I upload `{@AppealResponse.pdf}` for the `Upload the appeal response` field
    And I type `This is the appeal response` for the `Describe the document (Optional)` field
    And I click the `Continue` button
    And I click the `Upload` button
    And I click the `Close and Return to case details` button if present

    And I switch to be a `Case Officer`
    And I request appellant review

    And I switch to be a `Case Officer`
    And I request hearing requirements

    When I switch to be a `Judge`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_submitHearingRequirements` case progress image
    And I should see the text `What happens next`
    And I should see the text `The appellant will submit their hearing requirements.`

    And I end the appeal
    And I reinstate the appeal
    Then I should only see the `caseOfficer_submitHearingRequirements` case progress image
    And I should see the text `What happens next`
    And I should see the text `The appellant will submit their hearing requirements.`
    And I should see the ended appeal reinstate details
    And I should see the ended appeal details

  @reinstate-ended-listing @RIA-3039
  Scenario: Reinstate appeal after end appeal submitted

    When I switch to be a `Case Officer`
    And I request respondent evidence

    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    And I click the `upload the Home Office bundle` link
    And I add an item to the `Upload Home Office bundle` collection
    And within the `Upload Home Office bundle` collection's first item, I upload `{@Evidence1.pdf}` for the `Upload a file` field
    And within the `Upload Home Office bundle` collection's first item, I type `This is the respondent evidence` for the `Describe the document` field
    And I click the `Continue` button
    And I click the `Upload` button
    And  I click the `Close and Return to case details` button if present

    When I switch to be a `Case Officer`
    And I upload respondent evidence

    And I switch to be a `Legal Rep`
    And I build my case

    And I switch to be a `Legal Rep`
    And I submit my case

    And I switch to be a `Case Officer`
    And I request respondent review

    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    And I click the `add the Home Office's response` link
    And I select `Decision maintained` for the `Outcome` field
    And I click the `Continue` button
    And I upload `{@AppealResponse.pdf}` for the `Upload the appeal response` field
    And I type `This is the appeal response` for the `Describe the document (Optional)` field
    And I click the `Continue` button
    And I click the `Upload` button
    And I click the `Close and Return to case details` button if present

    And I switch to be a `Case Officer`
    And I request appellant review

    And I switch to be a `Case Officer`
    And I request hearing requirements

    And I switch to be a `Legal Rep`
    And I submit hearing requirements with all yes

    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_listing` case progress image

    And I should see the text `Do this next`
    And I should see the text `The agreed hearing requirements and dates to avoid are available to view in the Hearing tab.`
    And I should see the text `When the case has been listed in Aria, you should list the case here.`

    And I end the appeal
    And I reinstate the appeal
    Then I should only see the `caseOfficer_listing` case progress image

    And I should see the text `Do this next`
    And I should see the text `The agreed hearing requirements and dates to avoid are available to view in the Hearing tab.`
    And I should see the text `When the case has been listed in Aria, you should list the case here.`
    And I should see the ended appeal reinstate details
    And I should see the ended appeal details

  @reinstate-ended-prepare-for-hearing @RIA-3039
  Scenario: Reinstate appeal after end appeal submitted

    When I switch to be a `Case Officer`
    And I request respondent evidence

    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    And I click the `upload the Home Office bundle` link
    And I add an item to the `Upload Home Office bundle` collection
    And within the `Upload Home Office bundle` collection's first item, I upload `{@Evidence1.pdf}` for the `Upload a file` field
    And within the `Upload Home Office bundle` collection's first item, I type `This is the respondent evidence` for the `Describe the document` field
    And I click the `Continue` button
    And I click the `Upload` button
    And  I click the `Close and Return to case details` button if present

    When I switch to be a `Case Officer`
    And I upload respondent evidence

    And I switch to be a `Legal Rep`
    And I build my case

    And I switch to be a `Legal Rep`
    And I submit my case

    And I switch to be a `Case Officer`
    And I request respondent review

    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    And I click the `add the Home Office's response` link
    And I select `Decision maintained` for the `Outcome` field
    And I click the `Continue` button
    And I upload `{@AppealResponse.pdf}` for the `Upload the appeal response` field
    And I type `This is the appeal response` for the `Describe the document (Optional)` field
    And I click the `Continue` button
    And I click the `Upload` button
    And I click the `Close and Return to case details` button if present

    And I switch to be a `Case Officer`
    And I request appellant review

    And I switch to be a `Case Officer`
    And I request hearing requirements

    And I switch to be a `Legal Rep`
    And I submit hearing requirements with all yes

    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path

    When I switch to be a `Admin Officer`
    And I list the case

    And I click the `Overview` tab

    Then I should only see the `caseOfficer_prepareForHearing` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Notice of Hearing will be sent to all parties.`

    And I end the appeal
    And I reinstate the appeal
    Then I should only see the `caseOfficer_prepareForHearing` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Notice of Hearing will be sent to all parties.`
    And I should see the ended appeal reinstate details
    And I should see the ended appeal details

  @reinstate-ended-final-bundling @RIA-3039
  Scenario: Reinstate appeal after end appeal submitted

    When I switch to be a `Case Officer`
    And I request respondent evidence

    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    And I click the `upload the Home Office bundle` link
    And I add an item to the `Upload Home Office bundle` collection
    And within the `Upload Home Office bundle` collection's first item, I upload `{@Evidence1.pdf}` for the `Upload a file` field
    And within the `Upload Home Office bundle` collection's first item, I type `This is the respondent evidence` for the `Describe the document` field
    And I click the `Continue` button
    And I click the `Upload` button
    And  I click the `Close and Return to case details` button if present

    When I switch to be a `Case Officer`
    And I upload respondent evidence

    And I switch to be a `Legal Rep`
    And I build my case

    And I switch to be a `Legal Rep`
    And I submit my case

    And I switch to be a `Case Officer`
    And I request respondent review

    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    And I click the `add the Home Office's response` link
    And I select `Decision maintained` for the `Outcome` field
    And I click the `Continue` button
    And I upload `{@AppealResponse.pdf}` for the `Upload the appeal response` field
    And I type `This is the appeal response` for the `Describe the document (Optional)` field
    And I click the `Continue` button
    And I click the `Upload` button
    And I click the `Close and Return to case details` button if present

    And I switch to be a `Case Officer`
    And I request appellant review

    And I switch to be a `Case Officer`
    And I request hearing requirements

    And I switch to be a `Legal Rep`
    And I submit hearing requirements with all yes

    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path

    When I switch to be a `Admin Officer`
    And I list the case

    And I switch to be a `Case Officer`
    And I create case summary

    When I switch to be a `Judge`

    Then I should only see the `caseOfficer_finalBundling` case progress image

    And I end the appeal
    And I reinstate the appeal
    Then I should only see the `caseOfficer_finalBundling` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Tribunal Caseworker will generate a hearing bundle for all parties to use at the hearing.`
    And I should see the ended appeal reinstate details
    And I should see the ended appeal details

  @reinstate-ended-pre-hearing @RIA-3039
  Scenario: Reinstate appeal after end appeal submitted

    When I switch to be a `Case Officer`
    And I request respondent evidence

    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    And I click the `upload the Home Office bundle` link
    And I add an item to the `Upload Home Office bundle` collection
    And within the `Upload Home Office bundle` collection's first item, I upload `{@Evidence1.pdf}` for the `Upload a file` field
    And within the `Upload Home Office bundle` collection's first item, I type `This is the respondent evidence` for the `Describe the document` field
    And I click the `Continue` button
    And I click the `Upload` button
    And  I click the `Close and Return to case details` button if present

    When I switch to be a `Case Officer`
    And I upload respondent evidence

    And I switch to be a `Legal Rep`
    And I build my case

    And I switch to be a `Legal Rep`
    And I submit my case

    And I switch to be a `Case Officer`
    And I request respondent review

    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    And I click the `add the Home Office's response` link
    And I select `Decision maintained` for the `Outcome` field
    And I click the `Continue` button
    And I upload `{@AppealResponse.pdf}` for the `Upload the appeal response` field
    And I type `This is the appeal response` for the `Describe the document (Optional)` field
    And I click the `Continue` button
    And I click the `Upload` button
    And I click the `Close and Return to case details` button if present

    And I switch to be a `Case Officer`
    And I request appellant review

    And I switch to be a `Case Officer`
    And I request hearing requirements

    And I switch to be a `Legal Rep`
    And I submit hearing requirements with all yes

    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path

    When I switch to be a `Admin Officer`
    And I list the case

    And I switch to be a `Case Officer`
    And I create case summary
    And I generate the hearing bundle

    When I switch to be a `Judge`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_preHearing` case progress image
    And I end the appeal
    And I reinstate the appeal
    Then I should only see the `caseOfficer_preHearing` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Tribunal Caseworker will set up the Decision and Reasons document.`

  @reinstate-ended-decision @RIA-3039
  Scenario: Reinstate appeal after end appeal submitted

    When I switch to be a `Case Officer`
    And I request respondent evidence

    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    And I click the `upload the Home Office bundle` link
    And I add an item to the `Upload Home Office bundle` collection
    And within the `Upload Home Office bundle` collection's first item, I upload `{@Evidence1.pdf}` for the `Upload a file` field
    And within the `Upload Home Office bundle` collection's first item, I type `This is the respondent evidence` for the `Describe the document` field
    And I click the `Continue` button
    And I click the `Upload` button
    And  I click the `Close and Return to case details` button if present

    When I switch to be a `Case Officer`
    And I upload respondent evidence

    And I switch to be a `Legal Rep`
    And I build my case

    And I switch to be a `Legal Rep`
    And I submit my case

    And I switch to be a `Case Officer`
    And I request respondent review

    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    And I click the `add the Home Office's response` link
    And I select `Decision maintained` for the `Outcome` field
    And I click the `Continue` button
    And I upload `{@AppealResponse.pdf}` for the `Upload the appeal response` field
    And I type `This is the appeal response` for the `Describe the document (Optional)` field
    And I click the `Continue` button
    And I click the `Upload` button
    And I click the `Close and Return to case details` button if present

    And I switch to be a `Case Officer`
    And I request appellant review

    And I switch to be a `Case Officer`
    And I request hearing requirements

    And I switch to be a `Legal Rep`
    And I submit hearing requirements with all yes

    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path

    When I switch to be a `Admin Officer`
    And I list the case

    And I switch to be a `Case Officer`
    And I create case summary
    And I generate the hearing bundle
    And I wait for 10 seconds
    And I reload the Case Overview Page
    And I start decision and reasons

    When I switch to be a `Judge`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_decision` case progress image

    And I end the appeal
    And I reinstate the appeal
    Then I should only see the `caseOfficer_decision` case progress image
    And I should see the text `Do this next`
    And I should see the text `Prepare the Decision and Reasons document`

  @reinstate-ended-adjourned @RIA-3039
  Scenario: Reinstate appeal after end appeal submitted

    When I switch to be a `Case Officer`
    And I request respondent evidence

    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    And I click the `upload the Home Office bundle` link
    And I add an item to the `Upload Home Office bundle` collection
    And within the `Upload Home Office bundle` collection's first item, I upload `{@Evidence1.pdf}` for the `Upload a file` field
    And within the `Upload Home Office bundle` collection's first item, I type `This is the respondent evidence` for the `Describe the document` field
    And I click the `Continue` button
    And I click the `Upload` button
    And  I click the `Close and Return to case details` button if present

    When I switch to be a `Case Officer`
    And I upload respondent evidence

    And I switch to be a `Legal Rep`
    And I build my case

    And I switch to be a `Legal Rep`
    And I submit my case

    And I switch to be a `Case Officer`
    And I request respondent review

    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    And I click the `add the Home Office's response` link
    And I select `Decision maintained` for the `Outcome` field
    And I click the `Continue` button
    And I upload `{@AppealResponse.pdf}` for the `Upload the appeal response` field
    And I type `This is the appeal response` for the `Describe the document (Optional)` field
    And I click the `Continue` button
    And I click the `Upload` button
    And I click the `Close and Return to case details` button if present

    And I switch to be a `Case Officer`
    And I request appellant review

    And I switch to be a `Case Officer`
    And I request hearing requirements

    And I switch to be a `Legal Rep`
    And I submit hearing requirements with all yes

    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path

    When I switch to be a `Admin Officer`
    And I list the case

    When I select the `Adjourn hearing without a date` Next step
    Then I am on the `Adjourn hearing without a date` page
    And I should see the text `Reasons for adjournment`
    And I should see the text `This will be visible to both parties`
    And the `Continue` button is disabled

    When I type `some reasons for adjournment` for the `Reasons for adjournment` field
    And I click the `Continue` button
    Then I am on the `Adjourn hearing without a date` page
    And I should see the text `Check your answers`
    And I should see the text `Reasons for adjournment`
    And I should see the text `some reasons for adjournment`

    When I click the `Adjourn` button
    Then I should see the text `The hearing has been adjourned`
    And I should see the text `A new Notice of Hearing has been generated.`

    When I click the `Close and Return to case details` button if present
    And I should only see the `caseOfficer_hearing_adjourned` case progress image
    And I should see the text `Do this next`
    And I should see the text `The hearing has been adjourned and there is no scheduled date for the hearing. You can view the reasons for this in the hearing tab.`
    And I should see the text `When the hearing is ready to be relisted, you must first restore the appeal to its previous state.`
    And I should see `Adjourned` for the `Appointment date and time` field

    And I end the appeal
    And I reinstate the appeal
    And I should only see the `caseOfficer_hearing_adjourned` case progress image
    And I should see the text `Do this next`
    And I should see the text `The hearing has been adjourned and there is no scheduled date for the hearing. You can view the reasons for this in the hearing tab.`
    And I should see the ended appeal reinstate details
    And I should see the ended appeal details
