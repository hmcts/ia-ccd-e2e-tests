Feature: Work allocation R2 Judicial scenarios
  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case

    And I save my initial HU appeal type without remission and with hearing fee and pay offline
    And I submit my nonpayment appeal
    And I switch to be a `Judicial`

  @Judicial @RIA-4923 @judicial-reserve-to-me @ANIL123
  Scenario: Judicial allocating a role to himself(Reserve to me)

    When I click the `Roles and access` tab
    And  I wait for 5 seconds
    When I click the `Allocate a role` link for Judiciary
    Then I allocate a role to my self `Hearing Judge`
    And  I wait for 5 seconds
    Then I should see an alert confirming the case `You've allocated a role`

  @judicial @RIA-4923 @Judicial-allocate-a-role-to-another-judicial @ANIL123
  Scenario: Judicial allocating a role to another judicial user(Reserve to another user)

    When I click the `Roles and access` tab
    And  I wait for 5 seconds
    When I click the `Allocate a role` link for Judiciary
    And  I wait for 5 seconds
    Then I Allocate a role from Judicial to another Judicial user
    Then I should see an alert confirming the case `You've allocated a role`

  @judicial @RIA-4923 @Judicial-allocate-a-role-to-legal-Ops @ANIL123
  Scenario: Judicial allocating a role to legal ops(Reserve to legal Ops)

    When I click the `Roles and access` tab
    And  I wait for 5 seconds
    When I click the `Allocate a role` link for Legal Ops
    And  I wait for 5 seconds
    Then I Allocate a role from Judicaial to legal ops
    Then I should see an alert confirming the case `You've allocated a role`