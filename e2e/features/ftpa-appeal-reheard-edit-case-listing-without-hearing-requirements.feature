Feature: Admin Officer edits case listing - FTPA reheard decision (listed without hearing requirements)

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


  @ftpa-reheard-feature @RIA-3683-edit-case-listing-without-hearing-requirements @RIA-3683-edit-case-listing @RIA-3683
  Scenario: Admin Officer edits case listing - FTPA respondent resident judge decision (Reheard Rule 35)

    When I switch to be a `Home Office POU`
    Then I apply for respondent FTPA

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

    And I select the `List without requirements` Next step
    And I am on the `List without requirements` page
    And I select `4 hours` for the `Length` field
    And I click the `Continue` button
    And I am on the `Check your answers` page
    And I should see `4 hours` for the `Length` field
    And I click the `Submit` button
    And I should see the text `You've recorded the agreed hearing adjustments`
    And I should see the text `What happens next`
    And I should see the text `The listing team will now list the case. All parties will be notified when the Hearing Notice is available to view.`

    When I switch to be a `Admin Officer`
    Then I select the `List the case` Next step
    And I should see the `List the case` page
    And I select `Newport` for the `Hearing centre` field
    And I select `1 hour` for the `Length` field
    And I select `{$TODAY+20|DD-MM-YYYY} 09:30:00` for the `Date and time` field
    And I click the `Continue` button
    And I click the `List case` button
    And I click the `Close and Return to case details` button
    And I click the `Documents` tab
    And I should see the `Reheard hearing documents` field
    And within the `Reheard hearing documents` collection's first item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field
    And within the `Reheard hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I select the `Edit case listing` Next step
    And I am on the `Edit case listing` page
    And I select `Manchester` for the `Hearing centre` field
    And I select `3 hours` for the `Length` field
    And I select `{$TODAY+14|DD-MM-YYYY} 12:30:00` for the `Date and time` field
    And I click the `Continue` button

    And I am on the `Check your answers` page
    And I should see `Manchester` for the `Hearing centre` field
    And I should see `3 hours` for the `Length` field
    And I should see `{$TODAY+14|D MMM YYYY}, 12:30:00 PM` for the `Date and time` field
    And I click the `List case` button
    And I should see the text `The case has been re-listed`
    And I should see the text `What happens next`
    And I should see the text `A new Notice of Hearing has been generated. All parties will be notified by email.`
    And I click the `Close and Return to case details` button

    And I click the `Documents` tab
    And I should see the `Reheard hearing documents` field
    And within the `Reheard hearing documents` collection's first item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field
    And within the `Reheard hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Reheard hearing documents` collection's second item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field
    And within the `Reheard hearing documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
