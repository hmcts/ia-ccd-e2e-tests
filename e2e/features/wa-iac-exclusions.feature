Feature: Work allocation R2 exclusion scenarios
  Background:
    Given I am signed in as a `Legal Org User Rep A`

    And I save my initial HU appeal type without remission and with hearing fee and pay offline
    And I go to the overview page for the stored case
    Then I should be on the overview page
    And I submit my nonpayment appeal

  @legal-Ops @RIA-4923 @legal-ops-exclude-himself @work-allocation-3
  Scenario: Legal-Ops excluding himself(exclude me)

    And  I switch to be a `Legal Ops A`
    When I click the `Roles and access` tab
    And  I wait for 5 seconds
    When I click the `Add` link for Exclusions
    Then I exclude my self from case

  @legal-Ops @RIA-4923 @legal-ops-exclude-another-person @work-allocation-3
  Scenario: Legal-Ops excluding another person(exclude another person)

    And  I switch to be a `Legal Ops A`
    When I click the `Roles and access` tab
    And  I wait for 5 seconds
    When I click the `Add` link for Exclusions
    Then I Exclude another `Legal Ops` from case email text `IAC`

  @judicial @RIA-4923 @judicial-exclude-himself @work-allocation-3
  Scenario: Judicial excluding himself(exclude me)

    And  I switch to be a `Judicial`
    When I click the `Roles and access` tab
    And  I wait for 5 seconds
    When I click the `Add` link for Exclusions
    Then I exclude my self from case

  @judicial @RIA-4923 @judicial-exclude-another-person@work-allocation-3
  Scenario: Judicial excluding another person(exclude another person)

    And  I switch to be a `Judicial`
    When I click the `Roles and access` tab
    And  I wait for 5 seconds
    When I click the `Add` link for Exclusions
    Then I Exclude another `Judicial` from case email text `patel`


  @admin @RIA-4923 @admin-exclude-himself @work-allocation-3
  Scenario: Admin excluding himself(exclude me)

    And  I switch to be a `WaAdmin`
    When I click the `Roles and access` tab
    And  I wait for 5 seconds
    When I click the `Add` link for Exclusions
    Then I exclude my self from case

  @admin @RIA-4923 @admin-exclude-another-person @work-allocation-3
  Scenario: Admin excluding another person(exclude another person)

    And  I switch to be a `Judicial`
    When I click the `Roles and access` tab
    And  I wait for 5 seconds
    When I click the `Add` link for Exclusions
    Then I Exclude another `Admin` from case email text `IAC`

