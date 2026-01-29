Feature: Bails Submit bail application as Admin Officer

  Background:
    Given I am signed in as a `Admin Officer Bails`
    When I create a new bail application
    Then I save my initial application manually as a `Admin Officer` for a Prison detention with two financial condition supporters and with a Legal Representative

  @submit-bail-application @RIA-5662 @submit-bail-application-admin-officer @bails-full @bails-regression @bail-nightly-test
  Scenario: Submit bail application as Admin Officer
    When I submit my bail application as a `Admin Officer` without continue
    Then I should see the text `You have submitted this application`
    When I click the `Close and Return to case details` button if present
    Then I should be on the overview page
    And I should see the text `Please Confirm location where Applicant is detained is correct, and they are held on immigration matters, before listing the case for hearing in List Assist.`
