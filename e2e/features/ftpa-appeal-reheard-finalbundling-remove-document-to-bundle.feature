Feature: Case Officer remove document from final bundle for a reheard case

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

  @RIA-3130-remove-document @RIA-3130
  Scenario: Case Officer remove document from a collection

    When I switch to be a `Admin Officer`
    Then I select the `Upload hearing recording` Next step
    And I add an item to the `Recordings` collection
    And within the `Recordings` collection's first item, I upload `{@HearingRecording.mp3}` for the `Audio file` document field
    And within the `Recordings` collection's first item, I type `some description` for the `Describe the file` field
    And I click the `Continue` button
    And I click the `Upload` button
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    When I switch to be a `Home Office POU`
    Then I apply for respondent FTPA

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
    And I type `2` for the `Hours` field
    And I type `30` for the `Minutes` field
    And I select `All participants at the hearing centre` for the `How was the hearing conducted?` field
    And I click the `Continue` button
    And I click the `Save details` button
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    When I switch to be a `Judge`
    Then I select the `Resident judge FTPA decision` Next step
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
    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Home Office` in the `Who made the application?` field
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` in the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` for the `Describe the document` field
    And I should see `These are list of objections to the draft Notice` in the `List any objections to the draft Notice from either party` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` for the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` for the `Describe the document` field
    And I should see `These are list of instructions` in the `Listing instructions` field

    When I click the `Submit` button
    Then I should see the text `You've recorded the First-tier permission to appeal decision`
    And I should see the text `What happens next`
    And I should see the text `Both parties will be notified of the decision. A Caseworker will review any Tribunal`
    And I should see the text `instructions and then relist the case.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    And I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `The appeal is being reheard. A Tribunal Caseworker will review any Tribunal instructions and then the listing team will relist the case.`
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Case Officer`
    Then I click the `submit any new requirements` link
    And I click the `Continue` button
    And I click the `Send direction` button

    When I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all no when in country

    When I switch to be a `Case Officer`
    And I click the `review and submit` link
    And I select `3 hours` for the `Length` field
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Submit` button
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    When I switch to be a `Admin Officer`
    Then I should only see the `caseOfficer_listing` case progress image
    And I should see the text `Do this next`
    And I should see the text `The appeal is being reheard. Review any Tribunal notes in the FTPA tab and check the hearing and appointment tab for the agreed hearing requirements.`
    And I should see the text `When the case has been listed in Aria, you should list the case here.`
    And I should see the `FTPA tab` link
    And I should see the `hearing and appointment tab` link
    And I should see the `list the case here` link
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`
    And I should see the option `List the case` for the `Next step` field

    When I click the `FTPA tab` link
    Then I should see the `FTPA` page
    And I click the `Overview` tab

    When I click the `hearing and appointment tab` link
    Then I should see the `Hearing and appointment` page
    And I click the `Overview` tab


    When I select the `List the case` Next step
    Then I should see the `List the case` page

    And I select `Newport` for the `Hearing centre` field
    And I select `1 hour` for the `Length` field
    And I select `{$TODAY+20|DD-MM-YYYY} 09:30:00` for the `Date and time` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Newport` for the `Hearing centre` field
    And I should see `1 hour` for the `Length` field
    And I should see `{$TODAY+20|D MMM YYYY}, 9:30:00 AM` for the `Date and time` field

    When I click the `List case` button
    Then I should see the text `You have listed the case`
    And I should see the text `What happens next`
    And I should see the text `The hearing notice will be sent to all parties.`
    And I should see the text `You don't need to do any more on this case.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: List the case`

    When I switch to be a `Case Officer`
    And I create case summary

    When I click the `Documents` tab


    When I select the `Customise hearing bundle` Next step
    Then I should see the `Customise hearing bundle` page
    And I should see the `-Gonzlez-Decision-and-reasons-Cover-letter.PDF` link

    When I remove the first item from the `Decisions and reasons documents (Optional)` collection
    Then I should not see the `-Gonzlez-Decision-and-reasons-Cover-letter.PDF` link

    When I click the `Continue` button
    Then I should see the text `Customise hearing bundle`
    And I should see the `Generate` button

    When I click the `Generate` button
    Then I should see the text `The hearing bundle is being generated`
    Then I should see the text `What happens next`
    Then I should see the text `You will soon be able to view the hearing bundle in the documents tab.`
    Then I should see the text `You and the other parties will be notified when the hearing bundle is available.`
    Then I should see the text `If the bundle fails to generate, you will be notified and will need to generate the bundle again.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see the text `The hearing bundle is being generated. You will soon be able to view the hearing bundle in the documents tab.`
    Then I should see the text `You and the other parties will be notified when the hearing bundle is available.`
    Then I should see the text `If the bundle fails to generate, you will be notified and need to generate the bundle again.`

    And I wait for 10 seconds
    And I switch to be a `Legal Org User Rep A`

    When I switch to be a `Case Officer`
    And I click the `Documents` tab

    And within the `Reheard hearing documents` collection's first item, I should see `-González-reheard-hearing-bundle.pdf` in the `Document` field
    And within the `Reheard hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I click the `Documents` tab


