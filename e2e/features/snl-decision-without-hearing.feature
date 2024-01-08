Feature: SNL Decision without a hearing from respondent review state

  Background:
  Given I am signed in as a `Legal Org User Rep A`
    And I wait for 10 seconds
    And I create a new case
   
    

  @RIA-2122
  Scenario: SNL flow Case Officer makes a decision without a hearing respondentReview
    And I save my initial EU appeal type without remission and with hearing fee and pay now
    And I wait for 12 seconds
    And I click the `Close and Return to case details` button
    And I wait for 5 second
    Then I should see the text `You still need to submit your appeal.`
    And I pay for and submit my appeal by Card for a non PA appeal type
    And I wait for 15 seconds
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Org User Rep A`
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`
    And I request respondent review
    When I select the `Decision without a hearing` Next step
    Then I am on the `Decision without a hearing` page
    And I click the `Decision` button
    And I should see the text `has been updated with event: Decision without a hearing`

  Scenario: SNL flow Case Officer makes a decision without a hearing Force case flow
    And I save my initial EU appeal type without remission and with hearing fee and pay now
    And I wait for 12 seconds
    And I click the `Close and Return to case details` button
    And I wait for 5 second
    Then I should see the text `You still need to submit your appeal.`
    And I pay for and submit my appeal by Card for a non PA appeal type
    And I wait for 15 seconds
    And I switch to be a `Case Officer`
    And I wait for 10 seconds
    And I request respondent evidence
      ##"Foreign national offender" / "Unacceptable/disruptive customer behaviour" if we have these one of the case flags we should expect to see "Will additional security be required?" value "Yes" in hearing request
    When I select the `Create Flag` Next step
    And I have created a `Unacceptable/disruptive customer behaviour` Flag in `Jose Gonzalez`
    And I wait for 3 seconds
    And I progress case to force request case building
    And I request Force case - case under review
    And I request respondent review
    When I select the `Decision without a hearing` Next step
    Then I am on the `Decision without a hearing` page
    And I click the `Decision` button
    And I should see the text `has been updated with event: Decision without a hearing`
    And I generate the hearing bundle
    And I wait for 30 seconds
    And I refresh the page
    And I wait for 4 seconds
    And I start decision and reasons
    And I switch to be a `Admin Officer`
    Then I should see the text `Submit a hearing request in the`
    And I click the `Hearings tab` link
    And I wait for 4 seconds

  Scenario: SNL flow Case Officer makes a decision without a hearing for out of country flow
    And I save my out of country appeal with sponsor given name `Smith` family name `Benett` contactPreference `wantsSms` authorisation `Yes` for `EU` appeal
    And I wait for 12 seconds
    And I click the `Close and Return to case details` button
    And I wait for 5 second
    Then I should see the text `You still need to submit your appeal.`
    And I pay for and submit my appeal by Card for a non PA appeal type
    And I wait for 15 seconds
    And I switch to be a `Case Officer`
    And I wait for 10 seconds
    And I request respondent evidence
      ##"Foreign national offender" / "Unacceptable/disruptive customer behaviour" if we have these one of the case flags we should expect to see "Will additional security be required?" value "Yes" in hearing request
    When I select the `Create Flag` Next step
    And I have created a `Unacceptable/disruptive customer behaviour` Flag in `Jose Gonzalez`
    And I wait for 3 seconds
    And I progress case to force request case building
    And I request Force case - case under review
    And I request respondent review
    When I select the `Decision without a hearing` Next step
    Then I am on the `Decision without a hearing` page
    And I click the `Decision` button
    And I should see the text `has been updated with event: Decision without a hearing`

    
  Scenario: SNL flow Case Officer makes a decision without a hearing for out of country flow in listing state
    And I save my out of country appeal with sponsor given name `Smith` family name `Benett` contactPreference `wantsSms` authorisation `Yes` for `EU` appeal
    And I wait for 12 seconds
    And I click the `Close and Return to case details` button
    And I wait for 5 second
    Then I should see the text `You still need to submit your appeal.`
    And I pay for and submit my appeal by Card for a non PA appeal type
    And I wait for 15 seconds
    And I switch to be a `Case Officer`
    And I wait for 10 seconds
    And I request respondent evidence
      ##"Foreign national offender" / "Unacceptable/disruptive customer behaviour" if we have these one of the case flags we should expect to see "Will additional security be required?" value "Yes" in hearing request
    When I select the `Create Flag` Next step
    And I have created a `Unacceptable/disruptive customer behaviour` Flag in `Jose Gonzalez`
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
    When I select the `Decision without a hearing` Next step
    Then I am on the `Decision without a hearing` page
    And I click the `Decision` button
    And I should see the text `has been updated with event: Decision without a hearing`