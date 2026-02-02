Feature: Bails Submit bail application as Legal Rep

  Background:
    Given I am signed in as a `Legal Org User Rep A Bails`
    When I create a new bail application
    Then I save my initial application manually as a `Legal Rep` for a Immigration removal centre detention with two financial condition supporters and with a Legal Representative with no files uploaded

  @submit-bail-application @RIA-5661 @submit-bail-application-legal-rep @bails-full @bails-regression
  Scenario: Submit bail application as Legal Rep
    When I submit my bail application as a `Legal Rep` without continue
    Then I should see the text `You have submitted this application`
    When I click the `Close and Return to case details` button if present
    Then I should be on the overview page
