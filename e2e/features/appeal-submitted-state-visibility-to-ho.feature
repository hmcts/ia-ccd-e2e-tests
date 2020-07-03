Feature: Appeal submitted state visible to Home Office


  @RIA-3340
  Scenario: Appeal submitted state visible to Home Office APC

    Given I am signed in as a `Home Office APC`
    When I go to the `Case List`
    Then I should see the `State` field
    And I should see the option `Appeal submitted` for the `State` field

  @RIA-3340
  Scenario: Appeal submitted state visible to Home Office LART

    Given I am signed in as a `Home Office LART`
    When I go to the `Case List`
    Then I should see the `State` field
    And I should see the option `Appeal submitted` for the `State` field

  @RIA-3340
  Scenario: Appeal submitted state visible to Home Office POU

    Given I am signed in as a `Home Office POU`
    When I go to the `Case List`
    Then I should see the `State` field
    And I should see the option `Appeal submitted` for the `State` field

  @RIA-3340
  Scenario: Appeal submitted state visible to Home Office Generic

    Given I am signed in as a `Home Office Generic`
    When I go to the `Case List`
    Then I should see the `State` field
    And I should see the option `Appeal submitted` for the `State` field

