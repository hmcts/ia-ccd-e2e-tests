Feature: Hearing requirements not submitted - FTPA reheard decision (resident judge)

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Org User Rep A`
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`
    And I request respondent review
    And I add the appeal response
    And I request hearing requirements
    And I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all yes when in country
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


  @ftpa-reheard-feature @RIA-3386-reheard35 @RIA-3386
  Scenario: Hearing requirements not submitted - FTPA respondent resident judge decision (Reheard Rule 35)

    When I switch to be a `Admin Officer`
    Then I select the `Upload hearing recording` Next step
    And I add an item to the `Recordings` collection
    And within the `Recordings` collection's first item, I upload `{@HearingRecording.mp3}` for the `Audio file` document field
    And within the `Recordings` collection's first item, I type `some description` for the `Describe the file` field
    And I click the `Continue` button
    And I click the `Upload` button
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    And I switch to be a `Home Office POU`
    And I apply for respondent FTPA

    When I switch to be a `Admin Officer`
    Then I click the `record the judge's name` link
    And I should see the `Record allocated Judge` page
    And I type `Judge Fudge` for the `Judge assigned to the application` field
    And I click the `Continue` button
    And I click the `Submit` button
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
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
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    When I switch to be a `Judge`
    And I select the `Resident judge FTPA decision` Next step
    And I am on the `Resident judge FTPA decision` page
    And I select Home Office for the applicant type
    And I click the `Continue` button
    And I select `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` document field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field
    And I click the `Continue` button
    And I type `These are list of objections to the draft Notice` for the `List any objections to the draft Notice from either party (Optional)` field
    And I add an item to the `Notice communication` collection
    And within the `Notice communication` collection's first item, I upload `{@FTPANoticeOfCommunication.pdf}` for the `Document` document field
    And within the `Notice communication` collection's first item, I type `This is the ftpa notice of communication` for the `Describe the document` field
    And I click the `Continue` button
    And I type `These are list of instructions` for the `Listing instructions (Optional)` field
    And I click the `Continue` button
    And I click the `Submit` button
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    When I switch to be a `Case Officer`
    Then I click the `submit any new requirements` link
    And I click the `Continue` button
    And I click the `Send direction` button

    When I click the `Overview` tab
    And I should see the image `caseOfficer_submitHearingRequirements.png`
    And I should see the text `What happens next`
    And I should see the text `The appellant has been directed to submit any new hearing requirements`
    And I should see the text `If the appellant does not comply within 5 days of the direction, you should direct the listing team to list without hearing requirements`
    And I should see the `list without hearing requirements` link
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`

    When I click the `list without hearing requirements` link
    Then I am on the `List without requirements` page
    And I click the `Cancel` link

    When I select the `List without requirements` Next step
    Then I am on the `List without requirements` page
    And I select `4 hours` for the `Length` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `4 hours` for the `Length` field

    When I click the `Submit` button
    Then I should see the text `You've recorded the agreed hearing adjustments`
    And I should see the text `What happens next`
    And I should see the text `The listing team will now list the case. All parties will be notified when the Hearing Notice is available to view.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    And I should only see the `caseOfficer_listing` case progress image
    And I should see the text `What happens next`
    And I should see the text `The agreed hearing requirements and adjustments have been recorded.`
    And I should see the text `The listing team will now list the case.`
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`
    And I should not see the option `List without requirements` for the `Next step` field
    And I should not see the text `Hearing details`
    And I should not see the `Listing reference` field
    And I should not see the `Length` field
    And I should not see the `Date and time` field
    When I click the `Hearing and appointment` tab
    Then I should see the `Hearing` page
    And I should see the text `Appeal reference`
    And I should see `José González` for the `Appellant name` field
    And I should see `4 hours` for the `Length` field
    And I should see the reheard hearing requirements yes path
    And I should see the agreed additional adjustments yes path
    And I should see the `Dates to avoid` field
    And I should see the `Record of requirements and requests` field
    And I should see the `Previous hearings` field

    When I switch to be a `Legal Org User Rep A`
    Then I should only see the `progress_legalRep_listing` case progress image
    And I should see the text `What happens next`
    And I should see the text `You have not submitted any hearing requirements on behalf of the appellant.`
    And I should see the text `The case is now being listed without any new hearing requirements and the Notice of Hearing will be sent to both parties.`
    And I should not see the text `These flags are only visible to the Tribunal`
    And I should not see the image `caseFlagSetAsideReheard.svg`
    And I should not see the text `Hearing details`
    And I should not see the `Listing reference` field
    And I should not see the `Length` field
    And I should not see the `Date and time` field
    When I click the `Hearing and appointment` tab
    Then I should see the `Hearing` page
    And I should see the text `Appeal reference`
    And I should see `José González` for the `Appellant name` field
    And I should see `4 hours` for the `Length` field
    And I should see the reheard hearing requirements yes path
    And I should see the agreed additional adjustments yes path
    And I should see the `Dates to avoid` field
    And I should see the `Record of requirements and requests` field
    And I should see the `Previous hearings` field

    When I switch to be a `Admin Officer`
    Then I should only see the `caseOfficer_listing` case progress image
    And I should see the text `Do this next`
    And I should see the text `The appeal is being reheard. Review any Tribunal notes in the FTPA tab and check the hearing and appointment tab for the agreed hearing requirements.`
    And I should see the text `When the case has been listed in Aria, you should list the case here.`
    And I should see the `FTPA tab` link
    And I should see the `hearing and appointment tab` link
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`
    And I should not see the text `Hearing details`
    And I should not see the `Listing reference` field
    And I should not see the `Length` field
    And I should not see the `Date and time` field
    When I click the `Hearing and appointment` tab
    Then I should see the `Hearing` page
    And I should see the text `Appeal reference`
    And I should see `José González` for the `Appellant name` field
    And I should see `4 hours` for the `Length` field
    And I should see the reheard hearing requirements yes path
    And I should see the agreed additional adjustments yes path
    And I should see the `Dates to avoid` field
    And I should see the `Record of requirements and requests` field
    And I should see the `Previous hearings` field

    When I switch to be a `Home Office APC`
    Then I should only see the `homeOffice_listing` case progress image
    And I should see the text `Do this next`
    And I should see the text `check that the Home Office response complies with the Procedural Rules and Practice Directions`
    And I should see the text `inform you of any issues`
    And I should see the text `Providing there are no issues, the response will be shared with the appellant.`
    And I should see the text `All parties will be notified when the Hearing Notice is ready.`
    And I should not see the text `These flags are only visible to the Tribunal`
    And I should not see the image `caseFlagSetAsideReheard.svg`
    And I should not see the text `Hearing details`
    And I should not see the `Listing reference` field
    And I should not see the `Length` field
    And I should not see the `Date and time` field
    When I click the `Hearing and appointment` tab
    Then I should see the `Hearing` page
    And I should see the text `Appeal reference`
    And I should see `José González` for the `Appellant name` field
    And I should see `4 hours` for the `Length` field
    And I should see the reheard hearing requirements yes path
    And I should see the agreed additional adjustments yes path
    And I should see the `Dates to avoid` field
    And I should not see the `Record of requirements and requests` field
    And I should see the `Previous hearings` field

    When I switch to be a `Judge`
    Then I should only see the `caseOfficer_listing` case progress image
    And I should see the text `What happens next`
    And I should see the text `The agreed hearing requirements and adjustments have been recorded.`
    And I should see the text `The listing team will now list the case.`
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`
    And I should not see the text `Hearing details`
    And I should not see the `Listing reference` field
    And I should not see the `Length` field
    And I should not see the `Date and time` field
    When I click the `Hearing and appointment` tab
    Then I should see the `Hearing` page
    And I should see the text `Appeal reference`
    And I should see `José González` for the `Appellant name` field
    And I should see `4 hours` for the `Length` field
    And I should see the reheard hearing requirements yes path
    And I should see the agreed additional adjustments yes path
    And I should see the `Dates to avoid` field
    And I should see the `Record of requirements and requests` field
    And I should see the `Previous hearings` field
