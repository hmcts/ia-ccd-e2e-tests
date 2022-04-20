Feature: Submit bail application as Home Office User
 Background:
   Given I am signed in as a `Home Officer Generic`
   When I create a new bail application
   Then I save my initial application as a `Home Office` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative

  @submit-bail-application @RIA-5662 @submit-bail-application-home-office
  Scenario: Submit bail application as Home Office

