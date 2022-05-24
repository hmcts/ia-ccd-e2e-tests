Feature: Submit bail application as Admin Officer
 Background:
   Given I am signed in as a `Admin Officer`
   When I create a new bail application
   Then I save my initial application as a `Admin Officer` for a Prison detention with two financial condition supporters and with no Legal Representative

  @submit-bail-application @RIA-5662 @submit-bail-application-admin-officer @bails-nightly
  Scenario: Submit bail application as Admin Officer
    When I select the `Submit the application` Next step
    Then I am on the `Submit the application` page
    And I click the `Submit` button
    Then I should see the text `You have submitted this application`
    When I click the `Close and Return to case details` button
    And I wait for 5 seconds
    Then I should see the text `The case is ready to be listed`