Feature: Record length of hearing

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
    And I request appellant review
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
    And I start decision and reasons
    And I prepare decision and reasons
    And I send decision and reasons
    And I switch to be a `Home Office POU`
    And I apply for respondent FTPA

  @record-length-of-hearing @RIA-2272
  Scenario: Record length of hearing - happy path
    # Resident Judge decision reheard rule 35
    When I switch to be a Judge
    And I select the `Resident judge FTPA decision` Next step
    And I am on the `Resident judge FTPA decision` page
    And I select Home Office for the applicant type

    And I click the `Continue` button
    And I select `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field

    And I click the `Continue` button
    And I add an item to the `Notice communication` collection
    And within the `Notice communication` collection's first item, I upload `{@FTPANoticeOfCommunication.pdf}` for the `Document` field
    And within the `Notice communication` collection's first item, I type `This is the ftpa notice of communication` for the `Describe the document` field

    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Submit` button
    And I click the `Close and Return to case details` button

    # record length of hearing tests
    And I switch to be a `Case Officer`
    And I select the `Record length of hearing` Next step

    Then I am on the `Record length of hearing` page

    When I select `6 hours` for the `Length of hearing` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `6 hours` for the `Length of hearing` field

    When I click the `Submit` button

    Then I should see the text `You've recorded`
    And I should see the text `the length of the hearing`
    And I should see the text `What happens next`
    And I should see the text `The listing team will now list the case. All parties will be notified when the Notice of Hearing is available to view.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Record length of hearing`

    When I click the `Overview` tab

    Then I should only see the `caseOfficer_listing` case progress image
    And I should see the text `The agreed hearing requirements and adjustments have been recorded.`
    And I should see the text `The listing team will now list the case.`

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab

    Then I should only see the `appeal_reheard` case progress image
    And I should see the text `Do this next`
    And I should see the text `The case will be reheard. Review any Tribunal notes in FTPA tab and check Hearing tab for any previously agreed hearing requirements. When the case has been listed in Aria, you should list the case here.`

  @record-length-of-hearing-error @RIA-2272
  Scenario: Record length of hearing - wrong decision
    # Resident Judge decision refused
    When I switch to be a Judge
    And I select the `Resident judge FTPA decision` Next step
    And I am on the `Resident judge FTPA decision` page
    And I select Home Office for the applicant type

    And I click the `Continue` button
    And I select `Permission refused` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field

    And I click the `Continue` button
    And I select `Yes` for the `Before this decision, did you send a Notice of Decision set aside and to be reheard in the First-tier under rule 35?` field

    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Submit` button
    And I click the `Close and Return to case details` button

    # record length of hearing tests
    And I switch to be a `Case Officer`
    And I select the `Record length of hearing` Next step

    Then I should see the text `Appeal can only be reheard due to appropriate Judge decision.`