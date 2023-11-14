Feature: Remove Set aside - Reheard flag from a reheard case at FTPA decided state

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
    And I switch to be a `Home Office POU`
    And I apply for respondent FTPA
    And I switch to be a Judge
    And I select the `Resident judge FTPA decision` Next step
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


  @ftpa-reheard-feature @remove-ftpa-flag-co @RIA-3651
  Scenario: Remove Set aside - Reheard flag from a case (case officer) at FTPA decided state (Reheard Rule 35)

    And I switch to be a `Case Officer`
    And I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `Do this next`
    And I should see the text `The appeal is being reheard. First check the FTPA tab and follow any instructions the Judge has made to the Tribunal`
    And I should see the text `You should then direct the appellant to submit any new requirements`
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`

    When I select the `Remove a flag` Next step
    Then I am on the `Remove a flag` page
    And I should see the text `Select a flag to remove from the case`

    When I select `Set aside - Reheard` from the `Type of flag` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Set aside - Reheard` in the `Type of flag` field

    When I click the `Remove flag` button
    Then I should see the text `You've removed the flag from this case`
    And I should see the text `What happens next`
    And I should see the text `This flag has been removed from the case. The case will proceed as usual.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Remove a flag`
    And I should see the image `appeal_reheard.png`
    And I should see the text `Do this next`
    And I should see the text `The appeal is being reheard. First check the FTPA tab and follow any instructions the Judge has made to the Tribunal`
    And I should see the text `You should then direct the appellant to submit any new requirements`
    And I should not see the text `These flags are only visible to the Tribunal.`
    And I should not see the image `caseFlagSetAsideReheard.svg`


  @ftpa-reheard-feature @remove-ftpa-flag-ao @RIA-3651
  Scenario: Remove Set aside - Reheard flag from a case (admin officer) at FTPA decided state (Reheard Rule 35)

    When I switch to be a `Admin Officer`
    Then I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `The appeal is being reheard. A Tribunal Caseworker will review any instructions from the Judge and you will be notified when the case is ready to be listed.`
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`

    When I select the `Remove a flag` Next step
    Then I am on the `Remove a flag` page
    And I should see the text `Select a flag to remove from the case`

    When I select `Set aside - Reheard` from the `Type of flag` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Set aside - Reheard` in the `Type of flag` field

    When I click the `Remove flag` button
    Then I should see the text `You've removed the flag from this case`
    And I should see the text `What happens next`
    And I should see the text `This flag has been removed from the case. The case will proceed as usual.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Remove a flag`
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `The appeal is being reheard. A Tribunal Caseworker will review any instructions from the Judge and you will be notified when the case is ready to be listed.`
    And I should not see the text `These flags are only visible to the Tribunal`
    And I should not see the image `caseFlagSetAsideReheard.svg`
