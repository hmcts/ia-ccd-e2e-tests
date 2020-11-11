Feature: New hearing requirements for appeal submitted - FTPA reheard decision (resident judge)

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


  @ftpa-reheard-rule-35 @RIA-3555-reheard35 @RIA-3555-all-fields @RIA-3555
  Scenario: Submit hearing requirements with 'No' options selected - FTPA respondent resident judge decision (Reheard Rule 35)

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
    And I type `Jo Gonz` for the `The appellant (Optional)` field
    And I type `John Kardashian` for the `The appellant's legal representative (Optional)` field
    And I type `Carissa Moore` for the `Home Office representative (Optional)` field

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
    And I click the `Hearing and appointment` tab
    And I should see the `Hearing and appointment` page
    And I should see the text `Previous hearings`
    And within the `Previous hearings` collection's first item, I should see `Judge Judy` for the `The Judge` field
    And within the `Previous hearings` collection's first item, I should see `Jo Gonz` for the `The appellant` field
    And within the `Previous hearings` collection's first item, I should see `Carissa Moore` for the `Home Office Respondent` field
    And within the `Previous hearings` collection's first item, I should see `2` for the `Hours` field
    And within the `Previous hearings` collection's first item, I should see `30` for the `Minutes` field
    And within the `Previous hearings` collection's first item, I should see `LP/12345/2019` for the `Listing reference` field
    And within the `Previous hearings` collection's first item, I should see `Taylor House` for the `Location` field
    And within the `Previous hearings` collection's first item, I should see `{$TODAY+14|D MMM YYYY}, 10:30:00 AM` for the `Date and time` field
    And within the `Previous hearings` collection's first item, I should see `6 hours` for the `Length` field
    And within the `Previous hearings` collection's first item, I should see `Recordings 1` in the `Recordings` field
    And within the `Previous hearings` collection's first item, I should see `Allowed` for the `Decision of appeal` field
    And within the `Previous hearings` collection's first item, I should see `Decision and reason documents 1` in the `Decision and reason documents` field
    And within the `Previous hearings` collection's first item, I should see `Requirements and requests 1` in the `Requirements and requests` field

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab
    Then I should only see the `legalRep_submitHearingRequirements` case progress image
    And I should see the text `Do this next`
    And I should see the text `The appeal is being reheard. If the appellant's hearing requirements have changed, you should submit new requirements.`
    And I should see the `submit new requirements` link
    And I should see the case details
    And I should see the legal representative details

    When I click the `submit new requirements` link
    Then I should see the text `Submit hearing requirements`
    And I should see the text `If the appellant needs interpreter services, step-free access or a hearing loop, these will be provided.`
    And I should see the text `You'll also be able to request additional adjustments based on the appellant's personal circumstances. The tribunal will review these and decide whether a request can be granted.`

    When I click the `Continue` button
    Then I select `No` for the `Will the appellant attend the hearing?` field

    When I click the `Continue` button
    Then I select `No` for the `Will the appellant give oral evidence at the hearing?` field

    When I click the `Continue` button
    Then I select `No` for the `Will any witnesses attend the hearing?` field

    When I click the `Continue` button
    Then I select `No` for the `Do you need interpreter services on the day?` field

    When I click the `Continue` button
    Then I select `No` for the `Do you need a hearing room with step-free access?` field

    When I click the `Continue` button
    Then I select `No` for the `Do you need a hearing loop?` field

    When I click the `Continue` button
    Then I should see the text `Additional requests`
    And I should see the text `You can request additional adjustments based on the appellant's personal circumstances. The Tribunal will review the information you provide and decide whether a request can be granted.`

    When I click the `Continue` button
    Then I select `No` for the `Does the appellant have any physical or mental health issues that may impact them on the day?` field

    When I click the `Continue` button
    Then I select `No` for the `Has the appellant had any past experiences that may impact them on the day?` field

    When I click the `Continue` button
    Then I select `No` for the `Do you have multimedia evidence?` field

    When I click the `Continue` button
    Then I select `No` for the `Does the appellant need a single-sex court?` field

    When I click the `Continue` button
    Then I select `No` for the `Does the appellant need an in camera court?` field

    When I click the `Continue` button
    Then I select `No` for the `Is there anything else you would like to request?` field

    When I click the `Continue` button
    Then I select `No` for the `Are there any dates that the appellant or their on-day representation cannot attend?` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `No` in the `Will the appellant attend the hearing?` field
    And I should see `No` in the `Will the appellant give oral evidence at the hearing?` field
    And I should see `No` in the `Will any witnesses attend the hearing?` field
    And I should see `No` in the `Do you need interpreter services on the day?` field
    And I should see `No` in the `Do you need a hearing room with step-free access?` field
    And I should see `No` in the `Do you need a hearing loop?` field
    And I should see `No` in the `Does the appellant have any physical or mental health issues that may impact them on the day?` field
    And I should see `No` in the `Has the appellant had any past experiences that may impact them on the day?` field
    And I should see `No` in the `Do you have multimedia evidence?` field
    And I should see `No` in the `Does the appellant need a single-sex court?` field
    And I should see `No` in the `Does the appellant need an in camera court?` field
    And I should see `No` in the `Is there anything else you would like to request?` field
    And I should see `No` in the `Are there any dates that the appellant or their on-day representation cannot attend?` field

    When I click the `Submit` button
    Then I should see the text `You've submitted your hearing requirements`
    And I should see the text `What happens next`
    And I should see the text `The Tribunal will review your hearing requirements and any additional requests for adjustments.`
    And I should see the text `We'll notify you when the hearing is listed. You'll then be able to review the hearing requirements.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Submit hearing requirements`

    When I click the `Hearing and appointment` tab
    Then I should see the `Hearing and appointment` page
    And I should see the `Hearing details` field
    And the `Appeal reference` field should be 13 characters long
    And I should see `José González` for the `Appellant name` field
    And I should see the requests for additional adjustments no path
    And I should not see the agreed additional adjustments yes path
    And I should see the hearing requirements no path
    And I should see the `Record of requirements and requests` field
    And within the `Record of requirements and requests` collection's first item, I should see `-Gonzlez-hearing-requirements.PDF` in the `Document` field
    And within the `Record of requirements and requests` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And I should see the text `Previous hearings`
    And within the `Previous hearings` collection's first item, I should see `Judge Judy` for the `The Judge` field
    And within the `Previous hearings` collection's first item, I should see `Jo Gonz` for the `The appellant` field
    And within the `Previous hearings` collection's first item, I should see `Carissa Moore` for the `Home Office Respondent` field
    And within the `Previous hearings` collection's first item, I should see `2` for the `Hours` field
    And within the `Previous hearings` collection's first item, I should see `30` for the `Minutes` field
    And within the `Previous hearings` collection's first item, I should see `LP/12345/2019` for the `Listing reference` field
    And within the `Previous hearings` collection's first item, I should see `Taylor House` for the `Location` field
    And within the `Previous hearings` collection's first item, I should see `{$TODAY+14|D MMM YYYY}, 10:30:00 AM` for the `Date and time` field
    And within the `Previous hearings` collection's first item, I should see `6 hours` for the `Length` field
    And within the `Previous hearings` collection's first item, I should see `Recordings 1` in the `Recordings` field
    And within the `Previous hearings` collection's first item, I should see `Allowed` for the `Decision of appeal` field
    And within the `Previous hearings` collection's first item, I should see `Decision and reason documents 1` in the `Decision and reason documents` field
    And within the `Previous hearings` collection's first item, I should see `Requirements and requests 1` in the `Requirements and requests` field

    When I click the `Overview` tab
    Then I should only see the `legalRep_listing` case progress image
    And I should see the text `Do this next`
    And I should see the text `The case officer is reviewing the hearing requirements.`
    And I should see the text `Once the requirements have been agreed with the Tribunal, the case will be listed and you will receive a notification with the hearing notice.`
    And I should not see the text `These flags are only visible to the Tribunal`
    And I should not see the image `caseFlagSetAsideReheard.svg`

    When I switch to be a `Case Officer`
    Then I should only see the `caseOfficer_listing` case progress image
    And I should see the text `Do this next`
    And I should see the text `You can view the hearing requirements and any requests for additional adjustments in the hearing and appointment tab.`
    And I should see the `hearing and appointment tab` link
    And I should see the text `You should contact the appellant if you need more information.`
    And I should see the text `You should then review and submit the hearing requirements and any additional adjustments.`
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`

    When I click the `hearing and appointment tab` link
    Then I should see the `Hearing and appointment` page
    And I click the `Overview` tab

    When I switch to be a `Admin Officer`
    Then I should only see the `caseOfficer_listing` case progress image
    And I should see the text `What happens next`
    And I should see the text `The appeal is being reheard. A Tribunal Caseworker will review any instructions from the Judge and you will be notified when the case is ready to be listed.`
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`

    When I switch to be a `Judge`
    Then I should only see the `caseOfficer_reviewHearingRequirements` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Tribunal Caseworker will agree what adjustments the Tribunal will make.`
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`
