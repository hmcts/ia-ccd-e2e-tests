Feature: Move application to decided after a signed conditional bail decision notice has been uploaded
  Background:
    Given I am signed in as a `Home Office Bails`
    And I create a new bail application
    And I save my initial application as a `Home Office Bails` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative
    And I submit my bail application as a `Home Office Bails`
    And I upload the bail summary
    And I switch to be a `Admin Officer`
    And I record a conditional grant decision with SS consent Yes with no financial condition supporters
    And I upload the signed decision notice for a conditional grant

  @bails-move-application-to-decided @bails @RIA-5759 @bails-move-application-to-decided-admin-officer
  Scenario: Move application to decided as Admin Officer
    When I select the `Move application to decided` Next step
    Then I am on the `Move application to decided` page
    When I should see the text `Click Continue to move this application from the Conditional grant state to the Decided state. Once the application is moved to decided, no further action will be required.`
    And I click the `Continue` button
    Then I should see the `Submit` button
    When I click the `Submit` button
    Then I should see an alert confirming the case `has been updated with event: Move application to decided`
    And I should see the text `This application has been decided. The decision notice is available in the documents tab.`
    And I should only see the `progress_application_decided` case progress image

  @bails-move-application-to-decided @bails @RIA-5759 @bails-move-application-to-decided-judge @bails-regression
  Scenario: Move application to decided as Judge
    When I switch to be a `Judge`
    And I select the `Move application to decided` Next step
    Then I am on the `Move application to decided` page
    When I should see the text `Click Continue to move this application from the Conditional grant state to the Decided state. Once the application is moved to decided, no further action will be required.`
    And I click the `Continue` button
    Then I should see the `Submit` button
    When I click the `Submit` button
    Then I should see an alert confirming the case `has been updated with event: Move application to decided`
    And I should see the text `This application has been decided. The decision notice is available in the documents tab.`
    And I should see the image `progress_application_decided.svg`
