Feature: Out of Country - Edit appeal after submit

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case

  @edit-appeal-after-submit-in-uk-to-ooc @RIA-4094
  Scenario: Edit In country appeal to Out of country

    And I save my initial appeal with appellant living in UK `Yes`
    And I submit my nonpayment appeal

    And I switch to be a `Case Officer`
    Then I should see `No` for the `Out of country` field

    When I select the `Edit appeal` Next step
    And I edit the appeal after submit with appellant living in UK `No`

  @edit-appeal-after-submit-ooc-to-uk @RIA-4094
  Scenario: Edit out of country appeal to in country

    And I save my out of country appeal with sponsor given name `Smith` family name `Benett` contactPreference `wantsSms` authorisation `Yes`
    And I submit my nonpayment appeal

    And I switch to be a `Case Officer`
    Then I should see `Yes` for the `Out of country` field

    When I select the `Edit appeal` Next step
    And I edit the appeal after submit with appellant living in UK `Yes`

  @edit-appeal-after-submit-in-uk-to-uk @RIA-4094
  Scenario: Edit In country appeal to Out of country

    And I save my initial appeal with appellant living in UK `Yes`
    And I submit my nonpayment appeal

    And I switch to be a `Case Officer`
    Then I should see `No` for the `Out of country` field

    When I select the `Edit appeal` Next step
    And I edit the appeal after submit with appellant living in UK `Yes`

  @edit-appeal-after-submit-ooc-to-ooc @RIA-4094
  Scenario: Edit out of country appeal to in country

    And I save my out of country appeal with sponsor given name `Smith` family name `Benett` contactPreference `wantsSms` authorisation `Yes`
    And I submit my nonpayment appeal

    And I switch to be a `Case Officer`
    Then I should see `Yes` for the `Out of country` field

    When I select the `Edit appeal` Next step
    And I edit the appeal after submit with appellant living in UK `Yes`
