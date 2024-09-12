Feature: Bails Update interpreter details application as Legal Rep
  Background:
    Given I am signed in as a `Legal Org User Rep A Bails`
    When I create a new bail application
    Then I save my initial application as a `Legal Rep` for a Immigration removal centre detention with two financial condition supporters and with a Legal Representative with no files uploaded
    When I select the `Submit the application` Next step
    Then I am on the `Submit the application` page
    And The page is accessible
    When I click the `The applicant has confirmed that the facts stated in this application are true.` label
    And I click the `Submit` button
     And I wait for 10 seconds
    Then I should see the text `You have submitted this application`
    When I click the `Close and Return to case details` button if present
    And I wait for 10 seconds
  @submit-bail-application @RIA-5661 @submit-bail-application-legal-rep @bails-full @bails-regression @xbrowsertestBails @nightly-test
  Scenario: Add Update interpreter details application
    And I switch to be a `Admin Officer Bails`
    And I wait for 5 seconds
    When I select the `Update interpreter details` Next step
    Then I should see the text `Update interpreter details`
    When I Add the interpreter details
    And I click the `Close and Return to case details` button
 @submit-bail-application @RIA-5661 @submit-bail-application-legal-rep @bails-full @bails-regression @xbrowsertestBails @nightly-test
  Scenario: Add Update interpreter status application
    And I switch to be a `Admin Officer Bails`
    And I wait for 5 seconds
    When I select the `Update interpreter status` Next step
    Then I should see the text `Update interpreter status`
    When I update interpreter booking status
    And I click the `Close and Return to case details` button