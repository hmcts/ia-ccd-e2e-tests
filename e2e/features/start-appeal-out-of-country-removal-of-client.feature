Feature: Out of country appeal removal of client

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case


  @start-appeal-out-of-country-removal-of-client @RIA-3877
  Scenario:  Select removal of client for decision type

    And I save my out of country appeal with decision type `removalOfClient`
    And I submit my appeal

    When I switch to be a `Case Officer`
    And I click the `Overview` tab

    And I switch to be a `Legal Rep`
    And I click the `Overview` tab
    And I should see `Yes` for the `Out of country` field

    When I click the `Appeal` tab
    And I should see `Yes` for the `Out of country` field
    And I should see `A decision to remove your client under the Immigration (European Economic Area) Regulations 2016` for the `Out of country decision` field
    And I should see `{$TODAY|D MMM YYYY}` for the `Home Office decision letter received` field





