Feature: SnL Flow S94B flag with Type-C facility in hearing request

   Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I wait for 10 seconds
    And I create a new case

  @nightly-test @snl
  Scenario: SnL hearing request in country flow for S94B flag with Type-C facility for PA appeal

    And I save my initial PA appeal type without remission and with hearing fee and pay now
    And I click the `Close and Return to case details` button if present
    And I wait for 5 second
    Then I should see `You still need to submit your appeal.`
    And I pay for and submit my appeal by Card
    And I switch to be a `Case Officer`
    And I check the case has been paid for
    And I request home office data
    And I request respondent evidence
    And I wait for 4 seconds
    When I select the `Update s94b status` Next step
    Then I am on the `Update s94b status` page
    And I will update s94b flag
    And I wait for 4 seconds
      ##"Foreign national offender" / "Unacceptable/disruptive customer behaviour" if we have these one of the case flags we should expect to see "Will additional security be required?" value "Yes" in hearing request
    When I select the `Create Flag` Next step
    And I have created a `Unacceptable/disruptive customer behaviour` Flag in `José González`
    And I wait for 3 seconds
    And I progress case to force request case building
    And I request Force case - case under review
    And I request respondent review
    And I request Force case - hearing reqs
    And I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all yes when in country
    And I switch to be a `Case Officer`
    And I wait for 2 seconds
    And I record agreed hearing requirements yes path
    When I goto the `Case flags` tab
    And within the `José González` collection's first item, I should see case flag name `Unacceptable/disruptive customer behaviour` and comments "" creation date `{$TODAY|D MMM YYYY}` last modified ` ` flag status `ACTIVE`
    And within the `José González` collection's first item, I should see case flag name `Unaccompanied minor` and comments "" creation date `{$TODAY|D MMM YYYY}` last modified ` ` flag status `ACTIVE`

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
    And I click the `Substantive` button
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
    And I wait for 10 seconds

  @nightly-test @snl 
  Scenario: SnL hearing request out off country flow for S94B flag with Type-C facility for PA appeal
    And I save my out of country appeal with sponsor given name `Smith` family name `Benett` contactPreference `wantsSms` authorisation `Yes` for `PA` appeal
    And I wait for 12 seconds
    And I click the `Close and Return to case details` button if present
    And I wait for 5 second
    Then I should see `You still need to submit your appeal.`
    And I pay for and submit my appeal by Card
    And I switch to be a `Case Officer`
    And I check the case has been paid for
    And I request respondent evidence
    And I wait for 4 seconds
    When I select the `Update s94b status` Next step
    Then I am on the `Update s94b status` page
    And I will update s94b flag
    And I wait for 4 seconds
      ##"Foreign national offender" / "Unacceptable/disruptive customer behaviour" if we have these one of the case flags we should expect to see "Will additional security be required?" value "Yes" in hearing request
    When I select the `Create Flag` Next step
    And I have created a `Unacceptable/disruptive customer behaviour` Flag in `José González`
    And I wait for 3 seconds
    And I progress case to force request case building
    And I request Force case - case under review
    And I request respondent review
    And I request Force case - hearing reqs
    And I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all yes when out of country
    And I switch to be a `Case Officer`
    And I wait for 2 seconds
    And I record agreed hearing requirements yes path
    When I goto the `Case flags` tab
    And within the `José González` collection's first item, I should see case flag name `Unacceptable/disruptive customer behaviour` and comments "" creation date `{$TODAY|D MMM YYYY}` last modified ` ` flag status `ACTIVE`
    And within the `José González` collection's first item, I should see case flag name `Unaccompanied minor` and comments "" creation date `{$TODAY|D MMM YYYY}` last modified ` ` flag status `ACTIVE`

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
    And I click the `Substantive` button
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
    And I wait for 10 seconds
