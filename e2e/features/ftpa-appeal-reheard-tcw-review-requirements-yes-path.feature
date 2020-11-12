Feature: Case Officer reviews hearing requirements - FTPA reheard decision (resident judge)

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
    And I submit hearing requirements with all no
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements no path
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


  @ftpa-reheard-feature @RIA-3582-yes-path @RIA-3582
  Scenario: Case Officer reviews hearing requirements with 'Yes' options selected - FTPA respondent resident judge decision (Reheard Rule 35)

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

    When I switch to be a `Legal Rep`
    And I submit hearing requirements with all yes

    When I switch to be a `Case Officer`
    Then I should only see the `caseOfficer_listing` case progress image
    And I should see the text `Do this next`
    And I should see the text `You can view the hearing requirements and any requests for additional adjustments in the hearing and appointment tab.`
    And I should see the `hearing and appointment tab` link
    And I should see the text `You should contact the appellant if you need more information.`
    And I should see the text `You should then review and submit the hearing requirements and any additional adjustments.`
    And I should see the `review and submit` link
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`

    And I click the `review and submit` link
    Then I should see the `Hearing requirements` page

    And I select `3 hours` for the `Length` field
    And I click the `Continue` button

    And I type `Physical or mental health conditions will be reviewed for this reheard case` for the `Adjustments to accommodate vulnerabilities` field
    And I click the `Continue` button

    And I type `Multimedia equipment requirement will be reviewed for this reheard case` for the `Multimedia equipment` field
    And I click the `Continue` button

    And I type `Single sex court requirement will be reviewed for this reheard case` for the `Single-sex court` field
    And I click the `Continue` button

    And I type `Private hearing requirement will be reviewed for this reheard case` for the `In camera court` field
    And I click the `Continue` button

    And I type `Additional adjustments requirement will be reviewed for this reheard case` for the `Other adjustments` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `3 hours` for the `Length` field

    When I click the `Submit` button
    Then I should see the text `You've recorded the agreed hearing adjustments`
    And I should see the text `What happens next`
    And I should see the text `The listing team will now list the case. All parties will be notified when the Hearing Notice is available to view.`
    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Hearing requirements`

    And I click the `Overview` tab
    Then I should only see the `caseOfficer_listing.png` case progress image
    And I should see the text `Do this next`
    And I should see the text `The agreed hearing requirements and adjustments have been recorded.`
    And I should see the text `The listing team will now list the case.`
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`

    And I click the `Hearing and appointment` tab
    Then I should see the `Hearing and appointment` page
    And I should see the `Hearing details` field
    And the `Appeal reference` field should be 13 characters long
    And I should see `José González` for the `Appellant name` field
    And I should see `3 hours` for the `Length` field
    And I should see the text `Agreed additional adjustments`
    And I should see `Physical or mental health conditions will be reviewed for this reheard case` for the `Adjustments to accommodate vulnerabilities` field
    And I should see `Multimedia equipment requirement will be reviewed for this reheard case` for the `Multimedia equipment` field
    And I should see `Single sex court requirement will be reviewed for this reheard case` for the `Single-sex court` field
    And I should see `Private hearing requirement will be reviewed for this reheard case` for the `In camera court` field
    And I should see `Additional adjustments requirement will be reviewed for this reheard case` for the `Other adjustments` field
    And I click the `Overview` tab

    When I switch to be a `Admin Officer`
    Then I should only see the `caseOfficer_listing` case progress image
    And I should see the text `Do this next`
    And I should see the text `The appeal is being reheard. Review any Tribunal notes in the FTPA tab and check the hearing and appointment tab for the agreed hearing requirements.`
    And I should see the text `When the case has been listed in Aria, you should list the case here.`
    And I should see the `FTPA tab` link
    And I should see the `hearing and appointment tab` link
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`

    When I click the `FTPA tab` link
    Then I should see the `FTPA` page
    And I click the `Overview` tab

    When I click the `hearing and appointment tab` link
    Then I should see the `Hearing and appointment` page
