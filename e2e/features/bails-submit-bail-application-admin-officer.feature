Feature: Bails Submit bail application as Admin Officer
 Background:
   Given I am signed in as a `Admin Officer Bails`
   When I create a new bail application
   Then I save my initial application as a `Admin Officer` for a Prison detention with two financial condition supporters and with no Legal Representative

  @submit-bail-application @RIA-5662 @submit-bail-application-admin-officer @bails-full @bails-regression @nightly-test @bail-test
  Scenario: Submit bail application as Admin Officer
    When I select the `Submit the application` Next step
    Then I am on the `Submit the application` page
    And The page is accessible
    And I click the `Submit` button
    Then I should see the text `You have submitted this application`
    When I click the `Close and Return to case details` button if present
    And I wait for 10 seconds
   # Then I should see the text `The case is ready to be listed`
    When I select the `Create Flag` Next step
    And I have created a `Urgent case` Flag in `Case level`
    And I wait for 10 seconds
    When I select the `Create Flag` Next step
    And I wait for 10 seconds
    And I have created a `Language Interpreter` Flag in `Harri Pugh` and language name is `Korean`
    And I wait for 10 seconds
    When I select the `Create Flag` Next step
    And I wait for 10 seconds
    And I have created a `Reasonable adjustment` Flag in `Harri Pugh` and signlanguage name is `British Sign Language (BSL)`
    And I wait for 10 seconds
    When I select the `Create Flag` Next step
    And I wait for 10 seconds
    And I have created a `Language Interpreter` Flag in `John Smith` and language name is `Telugu`
    And I wait for 10 seconds
    When I select the `Create Flag` Next step
    And I wait for 10 seconds
    And I have created a `Reasonable adjustment` Flag in `John Smith` and signlanguage name is `British Sign Language (BSL)`
    And I wait for 10 seconds

##Hearing Request
    And I wait for 3 seconds
    When I goto the `hearings` tab
    And I wait for 8 seconds
    And I click the `Request a hearing` button
    And I wait for 3 seconds
    And I should see the text `Hearing requirements`
    And I should see the text `Any reasonable adjustments on this page will be included in the hearing request.`
    When I click the `Continue` button
    And I wait for 3 seconds
    And I should see the text `Do you require any additional facilities?`
    When I click the `Continue` button
    And I click the `Bails` button
    And I click the `Continue` button
    And I click the `Continue` button
   # And I add the `Hatton Cross` hearing location
    And I click the `Continue` button
    And I should see the text `Do you want a specific judge?`
    And I click the `No` button
    And I click the `Tribunal Judge` button
    And I click the `Continue` button
    And I should see the text `Length, date and priority level of hearing`
    And I click the `Continue` button
    And I should see the text `Enter any additional instructions for the hearing`
    And I click the `Continue` button
    And I click the `Submit request` button
    And I should see the text `Hearing request submitted`