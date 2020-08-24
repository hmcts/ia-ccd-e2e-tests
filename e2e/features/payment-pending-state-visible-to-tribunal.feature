Feature: Pending Payment state visible to Tribunal

  @payment-pending-state-visibility @RIA-3278
  Scenario: Pending Payment state visible for Legal Rep

    Given I am signed in as a `Legal Rep`
    When I go to the `Case List`
    Then I should see the `State` field
    And I should see the option `Pending payment` for the `State` field

  @payment-pending-state-visibility @RIA-3278
  Scenario: Pending payment state visible for Case Officer

    Given I am signed in as a `Case Officer`
    When I go to the `Case List`
    Then I should see the `State` field
    And I should see the option `Pending payment` for the `State` field

  @payment-pending-state-visibility @RIA-3278
  Scenario: Pending payment state visible for Admin Officer

    Given I am signed in as a `Admin Officer`
    When I go to the `Case List`
    Then I should see the `State` field
    And I should see the option `Pending payment` for the `State` field

  @payment-pending-state-visibility @RIA-3278
  Scenario: Pending payment state visible for Judge

    Given I am signed in as a `Judge`
    When I go to the `Case List`
    Then I should see the `State` field
    And I should see the option `Pending payment` for the `State` field

  @payment-pending-state-visibility @RIA-3278
  Scenario: Pending payment state not visible for Home Office APC

    Given I am signed in as a `Home Office APC`
    When I go to the `Case List`
    Then I should see the `State` field
    And I should see the option `Pending payment` for the `State` field

  @payment-pending-state-visibility @RIA-3278
  Scenario: Pending payment state not visible for Home Office LART

    Given I am signed in as a `Home Office LART`
    When I go to the `Case List`
    Then I should see the `State` field
    And I should see the option `Pending payment` for the `State` field

  @payment-pending-state-visibility @RIA-3278
  Scenario: Pending payment state not visible for Home Office POU

    Given I am signed in as a `Home Office POU`
    When I go to the `Case List`
    Then I should see the `State` field
    And I should see the option `Pending payment` for the `State` field

  @payment-pending-state-visibility @RIA-3278
  Scenario: Pending payment state not visible for Home Office Generic

    Given I am signed in as a `Home Office Generic`
    When I go to the `Case List`
    Then I should see the `State` field
    And I should see the option `Pending payment` for the `State` field
