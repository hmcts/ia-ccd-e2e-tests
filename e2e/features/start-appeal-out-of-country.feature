Feature: Out of Country - Start appeal

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    Then I wait for 10 seconds
    And I create a new case

  @start-appeal-out-of-country-yes @RIA-3876 
  Scenario: Select No for Out of country

    And I save my initial appeal with appellant living in UK `Yes`
    And I click the `Close and Return to case details` button
    When I click the `Appeal` tab
    Then I should see `No` for the `Out of country` field

    When I click the `Overview` tab
    Then I should see `No` for the `Out of country` field

  @start-appeal-out-of-country-no @RIA-3876
  Scenario: Select Yes for Out of country
    And I save my out of country appeal with sponsor given name `Smith` family name `Benett` contactPreference `wantsSms` authorisation `Yes`

    When I click the `Appeal` tab
    Then I should see `Yes` for the `Out of country` field

    When I click the `Overview` tab
    Then I should see `Yes` for the `Out of country` field

  @start-appeal-out-of-country-sponsor @RIA-3851 @nightly-test1
  Scenario: Select sponsor for Out of country
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
