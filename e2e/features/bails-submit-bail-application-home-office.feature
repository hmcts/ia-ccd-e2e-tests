Feature: Bails Submit bail application as Home Office User

  Background:
    Given I am signed in as a `Home Office Bails`
    When I create a new bail application
    Then I save my initial application manually as a `Home Office Bails` for a Immigration removal centre detention with one financial condition supporters and with a Legal Representative

  @submit-bail-application-home-office @bails-full @bails-regression
  Scenario: Submit bail application as Home Office
    When I submit my bail application as a `Home Office Bails` without continue
    Then I should see the text `You have submitted this application`
    When I click the `Close and Return to case details` button if present
    Then I should be on the overview page
