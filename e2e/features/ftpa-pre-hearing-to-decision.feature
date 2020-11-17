Feature: TCW progresses case from pre-hearing to Decision - FTPA reheard decision (resident judge)

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
    And I request hearing requirements
    And I switch to be a `Legal Rep`
    And I submit hearing requirements with all yes
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path
    And I switch to be a `Admin Officer`
    And I list the case
    And I switch to be a `Case Officer`
    And I create case summary
    And I generate the hearing bundle
    And I wait for 10 seconds
    And I reload the Case Overview Page
    And I start decision and reasons
    And I prepare decision and reasons
    And I send decision and reasons


  @ftpa-reheard-feature @RIA-3131-no-path @RIA-3131
  Scenario: TCW progresses case from pre-hearing to Decision - FTPA reheard decision

    When I switch to be a `Admin Officer`
    Then I select the `Upload hearing recording` Next step
    And I add an item to the `Recordings` collection
    And within the `Recordings` collection's first item, I upload `{@HearingRecording.mp3}` for the `Audio file` field
    And within the `Recordings` collection's first item, I type `some description` for the `Describe the file` field
    And I click the `Continue` button
    And I click the `Upload` button
    And I click the `Close and Return to case details` button

    When I switch to be a `Home Office POU`
    Then I apply for respondent FTPA

    When I switch to be a `Admin Officer`
    Then I click the `record the judge's name` link
    And I should see the `Record allocated Judge` page
    And I type `Judge Fudge` for the `Judge assigned to the application` field
    And I click the `Continue` button
    And I click the `Submit` button
    And I click the `Close and Return to case details` button
    And I click the `Overview` tab
    And I select the `Record attendees and duration` Next step
    And I should see the `Record attendees and duration` page
    And I type `Judge Judy` for the `The judge` field
    And I type `2` for the `Hours` field
    And I type `30` for the `Minutes` field
    And I select `All participants at the hearing centre` for the `How was the hearing conducted?` field
    And I click the `Continue` button
    And I click the `Save details` button
    And I click the `Close and Return to case details` button

    When I switch to be a Judge
    Then I select the `Resident judge FTPA decision` Next step
    And I am on the `Resident judge FTPA decision` page
    And I select Home Office for the applicant type
    And I click the `Continue` button
    And I select `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field
    And I click the `Continue` button
    And I type `These are list of objections to the draft Notice` for the `List any objections to the draft Notice from either party (Optional)` field
    And I add an item to the `Notice communication` collection
    And within the `Notice communication` collection's first item, I upload `{@FTPANoticeOfCommunication.pdf}` for the `Document` field
    And within the `Notice communication` collection's first item, I type `This is the ftpa notice of communication` for the `Describe the document` field
    And I click the `Continue` button
    And I type `These are list of instructions` for the `Listing instructions (Optional)` field
    And I click the `Continue` button
    And I click the `Submit` button
    And I click the `Close and Return to case details` button

    When I switch to be a `Case Officer`
    Then I click the `submit any new requirements` link
    And I click the `Continue` button
    And I click the `Send direction` button

    When I switch to be a `Legal Rep`
    And I submit hearing requirements with all no

    When I switch to be a `Case Officer`
    Then I click the `review and submit` link
    And I select `3 hours` for the `Length` field
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Submit` button
    And I click the `Close and Return to case details` button

    When I switch to be a `Admin Officer`
    Then I select the `List the case` Next step
    And I should see the `List the case` page
    And I should see `LP/12345/2019` for the `Listing reference` field
    And I select `Newport` for the `Hearing centre` field
    And I select `1 hour` for the `Length` field
    And I select `{$TODAY+20|DD-MM-YYYY} 09:30:00` for the `Date and time` field
    And I click the `Continue` button
    And I click the `List case` button
    And I click the `Close and Return to case details` button

    When I switch to be a `Case Officer`
    Then I create case summary
    And I generate the hearing bundle
    And I wait for 10 seconds
    And I reload the Case Overview Page
    And I start decision and reasons
    And I prepare decision and reasons

    And I click the `Overview` tab
    And I should only see the `caseOfficer_decision` case progress image
    And I should see the text `What happens next`
    And I should see the text `The judge will complete the Decision and Reasons document and upload it to the service.`
    And I should see the text `Both parties will be notified when it's available to view and download from the Documents tab.`
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`
    And I click the `Documents` tab
    And I should see the `Documents` page
    And I should see the `Reheard hearing documents` field
    And within the `Reheard hearing documents` collection's first item, I should see `-González-reheard-hearing-bundle.pdf` in the `Document` field
    And within the `Reheard hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Reheard hearing documents` collection's second item, I should see `CaseSummary.pdf` in the `Document` field
    And within the `Reheard hearing documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Reheard hearing documents` collection's third item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field
    And within the `Reheard hearing documents` collection's third item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And I should see the `Reheard decision and reason documents` field
    And within the `Reheard decision and reason documents` collection's first item, I should see `-Gonzlez-decision-and-reasons-draft.docx` in the `Document` field
    And within the `Reheard decision and reason documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Legal Rep`
    Then I should only see the `legalRep_decision` case progress image
    And I should see the text `Do this next`
    And I should see the text `The judge is writing the decisions and reasons. You will be notified when it is available to view.`
    And I should not see the text `These flags are only visible to the Tribunal`
    And I should not see the image `caseFlagSetAsideReheard.svg`
    And I click the `Documents` tab
    And I should see the `Documents` page
    And I should see the `Reheard hearing documents` field
    And within the `Reheard hearing documents` collection's first item, I should see `-González-reheard-hearing-bundle.pdf` in the `Document` field
    And within the `Reheard hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Reheard hearing documents` collection's second item, I should see `CaseSummary.pdf` in the `Document` field
    And within the `Reheard hearing documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Reheard hearing documents` collection's third item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field
    And within the `Reheard hearing documents` collection's third item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And I should not see the `Reheard decision and reason documents` field

    When I switch to be a `Judge`
    Then I should only see the `caseOfficer_decision` case progress image
    And I should see the text `Do this next`
    And I should see the text `Go to the Documents tab to download and complete the Decision and Reasons document.`
    And I should see the text `You should then upload and send the completed document.`
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`
    And I click the `Documents` tab
    And I should see the `Documents` page
    And I should see the `Reheard hearing documents` field
    And within the `Reheard hearing documents` collection's first item, I should see `-González-reheard-hearing-bundle.pdf` in the `Document` field
    And within the `Reheard hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Reheard hearing documents` collection's second item, I should see `CaseSummary.pdf` in the `Document` field
    And within the `Reheard hearing documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Reheard hearing documents` collection's third item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field
    And within the `Reheard hearing documents` collection's third item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And I should see the `Reheard decision and reason documents` field
    And within the `Reheard decision and reason documents` collection's first item, I should see `-Gonzlez-decision-and-reasons-draft.docx` in the `Document` field
    And within the `Reheard decision and reason documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Home Office APC`
    Then I should only see the `homeOffice_decision` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Judge is writing up the Decision and Reasons document, you'll be notified when this is ready to view.`
    And I should not see the text `These flags are only visible to the Tribunal`
    And I should not see the image `caseFlagSetAsideReheard.svg`
    And I click the `Documents` tab
    And I should see the `Documents` page
    And I should see the `Reheard hearing documents` field
    And within the `Reheard hearing documents` collection's first item, I should see `-González-reheard-hearing-bundle.pdf` in the `Document` field
    And within the `Reheard hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Reheard hearing documents` collection's second item, I should see `CaseSummary.pdf` in the `Document` field
    And within the `Reheard hearing documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Reheard hearing documents` collection's third item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field
    And within the `Reheard hearing documents` collection's third item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And I should not see the `Reheard decision and reason documents` field

    When I switch to be a `Home Office POU`
    Then I should only see the `homeOffice_decision` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Judge is writing up the Decision and Reasons document, you'll be notified when this is ready to view.`
    And I should not see the text `These flags are only visible to the Tribunal`
    And I should not see the image `caseFlagSetAsideReheard.svg`
    And I click the `Documents` tab
    And I should see the `Documents` page
    And I should see the `Reheard hearing documents` field
    And within the `Reheard hearing documents` collection's first item, I should see `-González-reheard-hearing-bundle.pdf` in the `Document` field
    And within the `Reheard hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Reheard hearing documents` collection's second item, I should see `CaseSummary.pdf` in the `Document` field
    And within the `Reheard hearing documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Reheard hearing documents` collection's third item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field
    And within the `Reheard hearing documents` collection's third item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And I should not see the `Reheard decision and reason documents` field

    When I switch to be a `Home Office LART`
    Then I should only see the `homeOffice_decision` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Judge is writing up the Decision and Reasons document, you'll be notified when this is ready to view.`
    And I should not see the text `These flags are only visible to the Tribunal`
    And I should not see the image `caseFlagSetAsideReheard.svg`
    And I click the `Documents` tab
    And I should see the `Documents` page
    And I should see the `Reheard hearing documents` field
    And within the `Reheard hearing documents` collection's first item, I should see `-González-reheard-hearing-bundle.pdf` in the `Document` field
    And within the `Reheard hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Reheard hearing documents` collection's second item, I should see `CaseSummary.pdf` in the `Document` field
    And within the `Reheard hearing documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Reheard hearing documents` collection's third item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field
    And within the `Reheard hearing documents` collection's third item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And I should not see the `Reheard decision and reason documents` field

    When I switch to be a `Home Office Generic`
    Then I should only see the `homeOffice_decision` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Judge is writing up the Decision and Reasons document, you'll be notified when this is ready to view.`
    And I should not see the text `These flags are only visible to the Tribunal`
    And I should not see the image `caseFlagSetAsideReheard.svg`
    And I click the `Documents` tab
    And I should see the `Documents` page
    And I should see the `Reheard hearing documents` field
    And within the `Reheard hearing documents` collection's first item, I should see `-González-reheard-hearing-bundle.pdf` in the `Document` field
    And within the `Reheard hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Reheard hearing documents` collection's second item, I should see `CaseSummary.pdf` in the `Document` field
    And within the `Reheard hearing documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Reheard hearing documents` collection's third item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field
    And within the `Reheard hearing documents` collection's third item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And I should not see the `Reheard decision and reason documents` field

    When I switch to be a `Admin Officer`
    And I should only see the `caseOfficer_decision` case progress image
    And I should see the text `Do this next`
    And I should see the text `Record the attendees and duration of the hearing.`
    And I should see the `Record attendees and duration` link
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`
    And I click the `Documents` tab
    And I should see the `Documents` page
    And I should see the `Reheard hearing documents` field
    And within the `Reheard hearing documents` collection's first item, I should see `-González-reheard-hearing-bundle.pdf` in the `Document` field
    And within the `Reheard hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Reheard hearing documents` collection's second item, I should see `CaseSummary.pdf` in the `Document` field
    And within the `Reheard hearing documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Reheard hearing documents` collection's third item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field
    And within the `Reheard hearing documents` collection's third item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And I should see the `Reheard decision and reason documents` field
    And within the `Reheard decision and reason documents` collection's first item, I should see `-Gonzlez-decision-and-reasons-draft.docx` in the `Document` field
    And within the `Reheard decision and reason documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And I select the `Record attendees and duration` Next step
    And I should see the `Record attendees and duration` page
    And I type `Judge Judy` for the `The judge` field
    And I type `José González` for the `The appellant (Optional)` field
    And I type `Bob Burnquist` for the `The appellant's legal representative (Optional)` field
    And I type `Tony Hawk` for the `Home Office representative (Optional)` field
    And I type `2` for the `Hours` field
    And I type `30` for the `Minutes` field
    And I select `All participants at the hearing centre` for the `How was the hearing conducted?` field
    And I click the `Continue` button
    And I click the `Save details` button
    And I click the `Close and Return to case details` button
    And I click the `Hearing and appointment` tab
    And I should see the text `Hearing attendance`
    And I should see `José González` for the `The appellant` field
    And I should see `Bob Burnquist` for the `The appellant's legal representative` field
    And I should see `Tony Hawk` for the `Home Office representative` field
    And I should see `2` for the `Hours` field
    And I should see `30` for the `Minutes` field
    And I click the `Overview` tab
    And I should only see the `caseOfficer_decision` case progress image
    And I should see the text `Do this next`
    And I should see the text `You don’t need to do any more on this case.`
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`

    When I switch to be a `Legal Rep`
    Then I should only see the `legalRep_decision` case progress image
    And I should see the text `Do this next`
    And I should see the text `The judge is writing the decisions and reasons. You will be notified when it is available to view.`
    And I should not see the text `These flags are only visible to the Tribunal`
    And I should not see the image `caseFlagSetAsideReheard.svg`

    When I switch to be a `Case Officer`
    And I should only see the `caseOfficer_decision` case progress image
    And I should see the text `What happens next`
    And I should see the text `The judge will complete the Decision and Reasons document and upload it to the service.`
    And I should see the text `Both parties will be notified when it's available to view and download from the Documents tab.`
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`
    And I click the `Hearing and appointment` tab
    And I should see the text `Hearing attendance`
    And I should see `José González` for the `The appellant` field
    And I should see `Bob Burnquist` for the `The appellant's legal representative` field
    And I should see `Tony Hawk` for the `Home Office representative` field
    And I should see `2` for the `Hours` field
    And I should see `30` for the `Minutes` field
    And I click the `Overview` tab

    When I switch to be a `Judge`
    Then I should only see the `caseOfficer_decision` case progress image
    And I should see the text `Do this next`
    And I should see the text `Go to the Documents tab to download and complete the Decision and Reasons document.`
    And I should see the text `You should then upload and send the completed document.`
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`

    When I switch to be a `Home Office APC`
    Then I should only see the `homeOffice_decision` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Judge is writing up the Decision and Reasons document, you'll be notified when this is ready to view.`
    And I should not see the text `These flags are only visible to the Tribunal`
    And I should not see the image `caseFlagSetAsideReheard.svg`

    When I switch to be a `Home Office POU`
    Then I should only see the `homeOffice_decision` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Judge is writing up the Decision and Reasons document, you'll be notified when this is ready to view.`
    And I should not see the text `These flags are only visible to the Tribunal`
    And I should not see the image `caseFlagSetAsideReheard.svg`

    When I switch to be a `Home Office LART`
    Then I should only see the `homeOffice_decision` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Judge is writing up the Decision and Reasons document, you'll be notified when this is ready to view.`
    And I should not see the text `These flags are only visible to the Tribunal`
    And I should not see the image `caseFlagSetAsideReheard.svg`

    When I switch to be a `Home Office Generic`
    Then I should only see the `homeOffice_decision` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Judge is writing up the Decision and Reasons document, you'll be notified when this is ready to view.`
    And I should not see the text `These flags are only visible to the Tribunal`
    And I should not see the image `caseFlagSetAsideReheard.svg`
