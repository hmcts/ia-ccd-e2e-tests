Feature: Work allocation R2 legal-ops scenarios
Background:
  Given I am signed in as a `Legal Org User Rep A`
  Then I wait for 10 seconds
  And I create a new case

  And I save my initial HU appeal type without remission and with hearing fee and pay offline
  And I click the `Close and Return to case details` button
  Then I wait for 5 seconds
  And I submit my nonpayment appeal
  Then I wait for 10 seconds
  And I switch to be a `Legal Ops A`

  @legal-Ops @RIA-4923 @legal-ops-reserve-to-me @nightly-test
  Scenario: Legal-Ops allocating a role to himself(Reserve to me)

    When I click the `Roles and access` tab
    And  I wait for 5 seconds
    When I click the `Allocate a role` link for Legal Ops
    Then I allocate a role to my self `Case Manager`
    And  I wait for 5 seconds
    Then I should see an alert confirming the case `You've allocated a role`

  @legal-Ops @RIA-4923 @legal-ops-allocate-a-role-to-another-legal-ops 
  Scenario: Legal-Ops allocating a role to another legal ops(Reserve to another user)

    When I click the `Roles and access` tab
    And  I wait for 5 seconds
    When I click the `Allocate a role` link for Legal Ops
    Then I allocate a role to another legal ops user
    Then I should see an alert confirming the case `You've allocated a role`


  @legal-Ops @RIA-4923 @legal-ops-allocate-a-role-to-judicial 
  Scenario: Legal-Ops allocating a role to Judicial user(Reserve to Judicial)

    When I click the `Roles and access` tab
    And  I wait for 5 seconds
    When I click the `Allocate a role` link for Judiciary
    And  I wait for 5 seconds
    Then I allocate a role to another Judiciary user
    And  I wait for 5 seconds
    Then I should see an alert confirming the case `You've allocated a role`