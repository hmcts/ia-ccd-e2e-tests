Feature: Bails Update interpreter details application as Legal Rep
  Background:
    Given I am signed in as a `Legal Org User Rep A Bails`
    Then I save my initial application as a `Legal Rep` for a Immigration removal centre detention with two financial condition supporters and with a Legal Representative with no files uploaded
    And I go to the overview page for the stored case
    And I submit my bail application as a `Legal Rep`

  Scenario: Add Update interpreter details application
    And I switch to be a `Admin Officer Bails`
    And I wait for 5 seconds
    When I select the `Update interpreter details` Next step
    Then I should see the text `Update interpreter details`
    When I Add the bail interpreter details
    And I click the `Close and Return to case details` button if present
 
 @bail-nightly-test
  Scenario: Add Update interpreter status application
    And I switch to be a `Admin Officer Bails`
    When I select the `Update interpreter status` Next step
    Then I should see the text `Update interpreter status`
    When I update interpreter booking status
    And I click the `Close and Return to case details` button if present
