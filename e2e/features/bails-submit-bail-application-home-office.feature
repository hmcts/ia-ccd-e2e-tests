Feature: Bails Submit bail application as Home Office User
 Background:
   Given I am signed in as a `Home Office Bails`
   And I wait for 10 seconds
   When I create a new bail application
   Then I save my initial application as a `Home Office Bails` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative

  @submit-bail-application @RIA-5662 @submit-bail-application-home-office @bails-full @bails-regression
  Scenario: Submit bail application as Home Office
    When I select the `Submit the application` Next step
    Then I am on the `Submit the application` page
    And The page is accessible
    And I click the `Submit` button
    Then I should see the text `You have submitted this application`
    When I click the `Close and Return to case details` button
    And I wait for 5 seconds
    Then I should see the text `The Tribunal will list the case. You will be notified when this happens and the Notice of Hearing will be available in the documents tab.`
