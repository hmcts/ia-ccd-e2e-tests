Feature: Make new application
  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new bail application
    And I save my initial application as a `Legal Rep` for a Prison detention with one financial condition supporters and with a Legal Representative
    And I submit my bail application as a `Legal Rep`

  @bails-previous-application @bails @RIA-5906 @bails-previous-application-admin-officer
  Scenario: Previous Application as Admin Officer
    When I switch to be a `Admin Officer`
    And I select the `Previous applications` next step
    Then I should see the text `There is no previous application to view`
    When I end the application
    And I select the `Make new application` Next step
    And I make a new application as a `Admin Officer` for a Prison detention with no financial condition supporters and with no Legal Representative
    Then I should see an alert confirming the case `has been updated with event: Make new application`
    And I should see the `Previous applications` tab
    When I click the `Previous applications` tab
    Then I should see the `View previous applications` link

  @bails-previous-application @bails @RIA-5906 @bails-previous-application-legal-rep
  Scenario: Previous Application as Legal Rep
    And I select the `Previous applications` next step
    Then I should see the text `There is no previous application to view`
    When I switch to be a `Admin Officer`
    When I end the application
    And I switch to be a `Legal Org User Rep A`
    And I select the `Make new application` Next step
    And I make a new application as a `Legal Rep` for a Prison detention with no financial condition supporters and with no Legal Representative
    Then I should see an alert confirming the case `has been updated with event: Make new application`
    And I should see the `Previous applications` tab
    When I click the `Previous applications` tab
    Then I should see the `View previous applications` link

  @bails-previous-application @bails @RIA-5906 @bails-previous-application-home-office
  Scenario: Previous Application as Home Office
    And I select the `Previous applications` next step
    Then I should see the text `There is no previous application to view`
    When I switch to be a `Admin Officer`
    When I end the application
    And I switch to be a `Home Office Bails`
    And I select the `Make new application` Next step
    And I make a new application as a `Home Office Bails` for a Prison detention with no financial condition supporters and with no Legal Representative
    Then I should see an alert confirming the case `has been updated with event: Make new application`
    And I should see the `Previous applications` tab
    When I click the `Previous applications` tab
    Then I should see the `View previous applications` link