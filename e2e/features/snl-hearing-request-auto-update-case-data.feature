Feature: SnL Flow Auto creation of caseflags

   Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I save my initial HU appeal type without remission and with hearing fee and pay now
    And I go to the overview page for the stored case
    Then I should be on the overview page
    Then I should see `You still need to submit your appeal.`
    And I pay for and submit my appeal by Card
    And I switch to be a `Case Officer`
    # And I request home office data
    And I check the case has been paid for
    And I request respondent evidence
      #"Foreign national offender" / "Unacceptable/disruptive customer behaviour" if we have these one of the case flags we should expect to see "Will additional security be required?" value "Yes" in hearing request
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
      #"PF0013 - Unaccompanied mino" / "CF0007 - Urgent case" if we have these one of the case flags we should expect to see "What is the priority of this hearing?" value "Urgent" in hearing request if we don't have case flags then value is standerd
    When I select the `Create Flag` Next step
    And I have created a `Unaccompanied minor` Flag in `José González`
    And I wait for 3 seconds
    When I goto the `Case flags` tab
    And within the `José González` collection's first item, I should see case flag name `Unacceptable/disruptive customer behaviour` and comments "" creation date `{$TODAY|D MMM YYYY}` last modified ` ` flag status `ACTIVE`
    And within the `José González` collection's first item, I should see case flag name `Unaccompanied minor` and comments "" creation date `{$TODAY|D MMM YYYY}` last modified ` ` flag status `ACTIVE`

  @nightly-test @snl
  Scenario: SnL flow Auto case flags appear in Case flags Tab
    And I switch to be a `Admin Officer`
    And I wait for 3 seconds
    When I goto the `Hearings` tab
    # And I wait for 8 seconds
    # And I click the `Request a hearing` button
    # And I wait for 3 seconds
    # And I should see the text `Hearing requirements`
    # And I should see the text `Any reasonable adjustments on this page will be included in the hearing request.`
    # When I click the `Continue` button
    # And I wait for 3 seconds
    # And I should see the text `Do you require any additional facilities?`
    # When I click the `Continue` button
    # And I click the `Substantive` button
    # And I click the `Continue` button
    # And I click the `Continue` button
    # And I add the `Glasgow Tribunals Centre` hearing location
    # And I click the `Continue` button
    # And I should see the text `Do you want a specific judge?`
    # And I click the `Continue` button
    # And I should see the text `Length, date and priority level of hearing`
    # And I click the `Continue` button
    # And I wait for 10 seconds
    # And I click the `Continue` button
    # And I should see the text `Enter any additional instructions for the hearing`
    # And I click the `Continue` button
    # And I click the `Submit request` button
    # And I should see the text `Hearing request submitted`
    # And I click the `view the status of this hearing in the hearings tab` link
    # And I wait for 10 seconds
