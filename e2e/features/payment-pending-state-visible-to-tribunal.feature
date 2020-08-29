Feature: Payment pending state visible to Tribunal and Home Office


  @payment-pending-state-visibility @RIA-3278
  Scenario: Payment pending state visible for Legal Rep

    Given I am signed in as a `Legal Rep`
    When I go to the `Case List`
    Then I should see the `State` field
    And I should see the option `Payment pending` for the `State` field

  @payment-pending-state-visibility @RIA-3278
  Scenario: Payment pending state visible for Case Officer

    Given I am signed in as a `Case Officer`
    When I go to the `Case List`
    Then I should see the `State` field
    And I should see the option `Payment pending` for the `State` field

  @payment-pending-state-visibility @RIA-3278
  Scenario: Payment pending state visible for Admin Officer

    Given I am signed in as a `Admin Officer`
    When I go to the `Case List`
    Then I should see the `State` field
    And I should see the option `Payment pending` for the `State` field

  @payment-pending-state-visibility @RIA-3278
  Scenario: Payment pending state visible for Admin Officer

    Given I am signed in as a `Judge`
    When I go to the `Case List`
    Then I should see the `State` field
    And I should see the option `Payment pending` for the `State` field

  @payment-pending-state-visibility @RIA-3278 @RIA-3340
  Scenario: Payment pending state visible for Home Office APC

    Given I am signed in as a `Home Office APC`
    When I go to the `Case List`
    Then I should see the `State` field
    And I should see the option `Payment pending` for the `State` field

  @payment-pending-state-visibility @RIA-3278 @RIA-3340
  Scenario: Payment pending state visible for Home Office LART

    Given I am signed in as a `Home Office LART`
    When I go to the `Case List`
    Then I should see the `State` field
    And I should see the option `Payment pending` for the `State` field

  @payment-pending-state-visibility @RIA-3278 @RIA-3340
  Scenario: Payment pending state visible for Home Office POU

    Given I am signed in as a `Home Office POU`
    When I go to the `Case List`
    Then I should see the `State` field
    And I should see the option `Payment pending` for the `State` field

  @payment-pending-state-visibility @RIA-3278 @RIA-3340
  Scenario: Payment pending state visible for Home Office Generic

    Given I am signed in as a `Home Office Generic`
    When I go to the `Case List`
    Then I should see the `State` field
    And I should see the option `Payment pending` for the `State` field
