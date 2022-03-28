Feature: Submit bail application as Legal Rep
 Background:
   Given I am signed in as a `Legal Org User Rep A`
   When I create a new bail application
   Then I save my initial application as a `Legal Rep` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative

  @submit-bail-application @RIA-5661 @submit-bail-application-legal-rep
  Scenario: Submit bail application as Legal Rep
