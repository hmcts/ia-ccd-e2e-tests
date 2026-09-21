Feature: Progress Internal Lr Detained EU Appeal upto FTPA decided

  Background:
    Given I am signed in as a `Admin Officer`
    And I create a new case
    And I save my initial lr internal EU appeal type without remission and with hearing fee and pay now for an prison facility
    And I click the `Close and Return to case details` button if present
    And I submit my appeal before paying
    And I wait for 2 seconds
    And I mark the appeal as paid
    And I switch to be a `Case Officer`
    And I check the case has been paid for
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Admin Officer`
    And I wait for 2 seconds
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`
    And I wait for 2 seconds
    And I request respondent review
    And I add the appeal response
    And I request Force case - hearing reqs
    And I wait for 5 seconds
    And I switch to be a `Admin Officer`
    And I wait for 2 seconds
    And I submit hearing requirements with all yes when in country
    And I switch to be a `Case Officer`
    And I wait for 2 seconds
    And I record agreed hearing requirements yes path
    
    ##Hearing Request
    And I switch to be a `Admin Officer`
    And I wait for 3 seconds
    When I goto the `Hearings` tab
    And I wait for 8 seconds
    And I click the `Request a hearing` button
    And I wait for 3 seconds
    And I should see the text `Hearing requirements`
    And I should see the text `Any reasonable adjustments on this page will be included in the hearing request.`
    When I click the `Continue` button
    And I wait for 3 seconds
    And I should see the text `Do you require any additional facilities?`
    When I click the `Continue` button
    And I click the `Case Management Review` button
    And I click the `Continue` button
    And I should see the text `Participant attendance`
    And I select how each of the 6 participants will attend the hearing
    And I click the `Continue` button
    And I add the `Glasgow Tribunals Centre` hearing location
    And I click the `Continue` button
    And I should see the text `Do you want a specific judge`
    And I select No for specific judge question with `Tribunal` judge type
    And I click the `Continue` button
    And I should see the text `Do you require a panel for this hearing?`
    And I click the `Continue` button
    And I should see the text `Length, date and priority level of hearing`
    And I click the `Continue` button
    And I should see the text `Will this hearing need to be linked to other hearings?`
    And I click the `Continue` button
    And I should see the text `Enter any additional instructions for the hearing`
    And I click the `Continue` button
    And I should see the text `Check your answers before sending your request`
    And I click the `Submit request` button
    And I should see the text `Hearing request submitted`
    And I click the `view the status of this hearing in the hearings tab` link
    And I wait for 2 seconds
    And I list the case
    And I switch to be a `Case Officer`
    And I wait for 2 seconds
    And I create case summary
    And I generate the hearing bundle
    And I wait for 4 seconds

    When I select the `Start decision and reasons` Next step
    Then I should see the text `Start decision and reasons`

    When I type `some introduction` for the `Introduction (Optional)` field
    And I click the `Continue` button
    Then I should see the text `Add the appellant's case summary`

    When I type `some case summary` for the `Appellant's case summary (Optional)` field
    And I click the `Continue` button
    Then I should see the text `Do both parties agree the immigration history?`

    When I select `Yes` for the `Do both parties agree the immigration history?` field
    When I type `some agreed immigration history` for the `Agreed immigration history (Optional)` field
    And I click the `Continue` button
    Then I see the text `Do both parties agree the schedule of issues?`

    When I select `Yes` for the `Do both parties agree the schedule of issues?` field
    When I type `some schedule of issues` for the `The appellant's schedule of issues (Optional)` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `some introduction` in the `Introduction` field
    When I click the `Save` button
    And I click the `Close and Return to case details` button if present
    Then I should be on the overview page
    And I wait for 2 seconds

    And I prepare decision and reasons
    And I send decision and reasons
    When I switch to be a `Admin Officer`
    And I wait for 2 seconds

  @lrInternalDetained-eu-case @detained-cases
  Scenario: FTPA judge decision - Granted/Dispose of application under rule 31

    Then I apply for appellant FTPA

    When I switch to be a `Judge`
    And I wait for 2 seconds
    And I select the `Decide FTPA application` Next step
    And I select Appellant for the applicant type
    And I click the `Continue` button
    And I select `Permission granted` for the `The outcome of the application` field
    And I click the `Continue` button
    And I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` document field
    And I click the `Continue` button
    And I select `No` for the `Notice of Intention to Set Aside sent?` field
    And I click the `Continue` button
    And I should see `Notes for the Upper Tribunal`
    And I click the `Continue` button
    And I should see `Check your answers`
    And I click the `Submit` button
    And I click the `Close and Return to case details` button if present
    And I should see an alert confirming the case `has been updated with event: Decide FTPA application`
    And I click the `Overview` tab
    And I should see the image `ftpaGranted.png`


    When I switch to be a `Case Officer`
    And I click the `Overview` tab
    And I should see the image `ftpaGranted.png`

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab
    And I should see the image `ftpaGranted.png`

    When I switch to be a `Home Office POU`
    Then I apply for respondent FTPA

    When I switch to be a `Judge`
    And I select the `Decide FTPA application` Next step
    And I select Home Office for the applicant type
    And I click the `Continue` button
    And I select `Dispose of application under rule 31` for the `The outcome of the application` field
    And I click the `Continue` button
    And I type `Judge decide to dispose this application` for the `Explain why the application should be disposed` field
    And I click the `Continue` button
    And I should see `Check your answers`
    And I click the `Submit` button
    And I wait for the spinner
    And I click the `Close and Return to case details` button if present
    And I should see an alert confirming the case `has been updated with event: Decide FTPA application`

    And I click the `Overview` tab
    And I should see the image `ftpaRule31Rule32.svg`


    When I switch to be a `Case Officer`
    And I click the `Overview` tab
    And I should see the image `ftpaRule31Rule32.svg`

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab
    And I should see the image `ftpaRule31Rule32.svg`
