Feature: Bails Submit bail application as Legal Rep
 Background:
   Given I am signed in as a `Legal Org User Rep A Bails`
   When I create a new bail application
   Then I save my initial application as a `Legal Rep` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative with no files uploaded

  @submit-bail-application @RIA-5661 @submit-bail-application-legal-rep @bails-full @bails-regression @xbrowsertestBails @nightly-test
  Scenario: Submit bail application as Legal Rep
    When I select the `Submit the application` Next step
    Then I am on the `Submit the application` page
    And The page is accessible
    When I click the `The applicant has confirmed that the facts stated in this application are true.` label
    And I click the `Submit` button
    Then I should see the text `You have submitted this application`
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    And I wait for 5 seconds
    Then I should see the text `The Tribunal will list the case. You will be notified when this happens and the Notice of Hearing will be available in the documents tab.`
