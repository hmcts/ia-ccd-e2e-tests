Feature: Submit bail application as Admin Officer
 Background:
   Given I am signed in as a `Admin Officer`
   When I create a new bail application
   Then I save my initial application as a `Admin Officer` for a Prison detention with two financial condition supporters and with no Legal Representative

  @submit-bail-application @RIA-5662 @submit-bail-application-admin-officer
  Scenario: Submit bail application as Admin Officer
