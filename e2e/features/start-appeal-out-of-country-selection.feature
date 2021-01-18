Feature: Out of Country - Start appeal

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case

  @start-appeal-out-of-country-selection @RIA-3876
  Scenario: Select No for Out of country

    And I save my initial appeal with appellant living in UK `Yes`

    When I click the `Appeal` tab
    Then I should see `No` for the `Out of country` field

    When I click the `Overview` tab
    Then I should see `No` for the `Out of country` field

  @start-appeal-out-of-country-selection @RIA-3876
  Scenario: Select Yes for Out of country
    And I save my initial appeal with appellant living in UK `No`

    When I click the `Appeal` tab
    Then I should see `Yes` for the `Out of country` field

    When I click the `Overview` tab
    Then I should see `Yes` for the `Out of country` field

