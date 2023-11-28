Feature: Case Officer edits reheard hearing document - FTPA reheard decision (resident judge)

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


  @ftpa-reheard-feature @RIA-3683-edit-docs @RIA-3683
  Scenario: Admin Officer lists reheard case with 'No' options selected - FTPA respondent resident judge decision (Reheard Rule 35)

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
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    When I switch to be a `Case Officer`
    Then I click the `submit any new requirements` link
    And I click the `Continue` button
    And I click the `Send direction` button

    When I switch to be a `Legal Org User Rep A`
    Then I submit hearing requirements with all no when in country

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
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    When I switch to be a `Admin Officer`
    Then I select the `List the case` Next step
    And I should see the `List the case` page
    And I select `Newport` for the `Hearing centre` field
    And I select `1 hour` for the `Length` field
    And I select `{$TODAY+20|DD-MM-YYYY} 09:30:00` for the `Date and time` field
    And I click the `Continue` button
    And I click the `List case` button
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    And I click the `Documents` tab
    And I should see the `Reheard hearing documents` field
    And within the `Reheard hearing documents` collection's first item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field
    And within the `Reheard hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And I click the `Overview` tab

    When I switch to be a `Case Officer`
    Then I click the `Documents` tab
    And I should see the `Reheard hearing documents` field
    And within the `Reheard hearing documents` collection's first item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field
    And within the `Reheard hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And I select the `Edit documents` Next step
    And I remove the first item from the `Reheard hearing documents (Optional)` collection
    And I click the `Continue` button
    And I should see the text `Reasons for editing or removing the documents`
    And the `Continue` button is disabled
    And I type `some reasons for editing documents` for the `Reasons for editing or removing the documents` field
    And the `Continue` button is enabled
    And I click the `Continue` button
    And I should see the `Submit` button
    And I click the `Submit` button
    And I click the `Case notes` tab
    And I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `A document was edited or deleted` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `reason: some reasons for editing documents` in the `Case note` field
    And within the `Case notes` collection's first item, I should see `Document names: ` in the `Case note` field
    And I click the `Documents` tab
    And I should not see the `Reheard hearing documents` field
