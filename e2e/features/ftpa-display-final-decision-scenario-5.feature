Feature: Final display for FTPA decision and reasons

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
    And I start decision and reasons
    And I prepare decision and reasons


  @RIA-2919 @RIA-2919-scenario5 @RIA-2919-scenario5a
    # Refused / Refused (Final Decision: Allowed - Scenario 5)
  Scenario: FTPA judge decision - Refused / Refused (Appeal Outcome: Allowed)

    And I send decision and reasons

    When I switch to be a `Legal Rep`
    Then I apply for appellant FTPA

    When I switch to be a Judge
    And I select the `Leadership judge FTPA decision` Next step
    And I am on the `Leadership judge FTPA decision` page
    And I select Appellant for the applicant type
    And I click the `Continue` button
    And I select `Permission refused` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field
    And I click the `Continue` button
    And I am on the `Check your answers` page
    And I click the `Submit` button
    And I should see the text `You've recorded the First-tier permission to appeal decision`
    And I click the `Close and Return to case details` button
    And I should see an alert confirming the case `has been updated with event: Leadership judge FTPA decision`
    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`

    When I switch to be a `Case Officer`
    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`

    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`

    When I switch to be a `Home Office POU`
    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`

    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`

    When I switch to be a `Home Office POU`
    Then I apply for respondent FTPA

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
    And I type `These are list of objections to the draft Notice` for the `List any objections to the draft Notice from either party (Optional)` field
    And I click the `Continue` button
    And I am on the `Check your answers` page
    And I click the `Submit` button
    And I should see the text `You've recorded the First-tier permission to appeal decision`
    And I click the `Close and Return to case details` button
    And I should see an alert confirming the case `has been updated with event: Resident judge FTPA decision`
    And I click the `Overview` tab
    And I should see the image `appeal_allowed.png`
    And I should not see the image `appeal_dismissed.png`

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab
    And I should see the image `appeal_allowed.png`
    And I should not see the image `appeal_dismissed.png`

    When I switch to be a `Case Officer`
    And I click the `Overview` tab
    And I should see the image `appeal_allowed.png`
    And I should not see the image `appeal_dismissed.png`

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab
    And I should see the image `appeal_allowed.png`
    And I should not see the image `appeal_dismissed.png`

    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    And I should see the image `appeal_allowed.png`
    And I should not see the image `appeal_dismissed.png`

    When I switch to be a `Home Office POU`
    And I click the `Overview` tab
    And I should see the image `appeal_allowed.png`
    And I should not see the image `appeal_dismissed.png`

    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    And I should see the image `appeal_allowed.png`
    And I should not see the image `appeal_dismissed.png`


  @RIA-2919 @RIA-2919-scenario5 @RIA-2919-scenario5b
    # Refused / Refused (Final Decision: Dismissed - Scenario 5)
  Scenario: FTPA judge decision - Refused / Refused (Appeal Outcome: Dismissed)

    And I send decision and reasons with dismissed outcome

    When I switch to be a `Legal Rep`
    Then I apply for appellant FTPA

    When I switch to be a Judge
    And I select the `Leadership judge FTPA decision` Next step
    And I am on the `Leadership judge FTPA decision` page
    And I select Appellant for the applicant type
    And I click the `Continue` button
    And I select `Permission refused` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field
    And I click the `Continue` button
    And I am on the `Check your answers` page
    And I click the `Submit` button
    And I should see the text `You've recorded the First-tier permission to appeal decision`
    And I click the `Close and Return to case details` button
    And I should see an alert confirming the case `has been updated with event: Leadership judge FTPA decision`
    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`

    When I switch to be a `Case Officer`
    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`

    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`

    When I switch to be a `Home Office POU`
    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`

    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`

    When I switch to be a `Home Office POU`
    Then I apply for respondent FTPA

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
    And I type `These are list of objections to the draft Notice` for the `List any objections to the draft Notice from either party (Optional)` field
    And I click the `Continue` button
    And I am on the `Check your answers` page
    And I click the `Submit` button
    And I should see the text `You've recorded the First-tier permission to appeal decision`
    And I click the `Close and Return to case details` button
    And I should see an alert confirming the case `has been updated with event: Resident judge FTPA decision`
    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`
    And I should not see the image `appeal_allowed.png`

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`
    And I should not see the image `appeal_allowed.png`

    When I switch to be a `Case Officer`
    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`
    And I should not see the image `appeal_allowed.png`

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`
    And I should not see the image `appeal_allowed.png`

    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`
    And I should not see the image `appeal_allowed.png`

    When I switch to be a `Home Office POU`
    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`
    And I should not see the image `appeal_allowed.png`

    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`
    And I should not see the image `appeal_allowed.png`
