Feature: Out of Country - Start appeal

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case

  @start-appeal-uk-address-set-hearing-centre @RIA-3761-uk @RIA-3761
  Scenario: Select in country appeal with client address

    And I save my initial appeal with address
    And I submit my nonpayment appeal

    When I click the `Appellant` tab
    And I should see the text `Airborne Studios`
    And I should see the text `52 Newton Street`
    And I should see the text `Manchester`
    And I should see the text `M1 1ED`
    And I should see the text `United Kingdom`

    When I click the `Overview` tab
    Then I should see `Manchester` for the `Hearing centre` field

  @start-appeal-no-address-set-hearing-centre @RIA-3761-uk @RIA-3761
  Scenario: Select in country appeal with no fixed address

    And I save my initial appeal
    And I submit my nonpayment appeal

    When I click the `Appellant` tab
    And I should see `No` in the `Does the appellant have a postal address?` field

    When I click the `Overview` tab
    Then I should see `Taylor House` for the `Hearing centre` field

  @start-appeal-out-of-country-with-sponsor-set-hearing-centre @RIA-3761-ooc @RIA-3761
  Scenario: Select Out of country with sponsor
    And I save my out of country appeal with sponsor given name `Smith` family name `Benett` contactPreference `wantsSms` authorisation `Yes`
    And I submit my nonpayment appeal

    When I click the `Appellant` tab
    Then I should see `Smith Benett` for the `Sponsor name` field
    And I should see the text `2 Hawthorn Drive`
    And I should see the text `Leeds`
    And I should see the text `LS19 7XB`
    And I should see the text `United Kingdom`
    And I should see `07123456789` for the `Sponsor phone number` field
    And I should see `Yes` for the `Does your client give authorisation for the sponsor to access information relating to the appeal?` field

    When I click the `Overview` tab
    Then I should see `Bradford` for the `Hearing centre` field

  @start-appeal-out-of-country-with-out-sponsor-set-hearing-centre @RIA-3761-ooc @RIA-3761
  Scenario: Select Out of country with out sponsor
    And I save my out of country now appeal with decision type `removalOfClient`
    And I submit my nonpayment appeal

    When I click the `Overview` tab
    Then I should see `Taylor House` for the `Hearing centre` field
