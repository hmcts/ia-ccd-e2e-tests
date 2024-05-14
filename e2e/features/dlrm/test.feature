Feature: Test Pa11y report

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And The page is accessible



  @test-pa11y-report
  Scenario: Test Pa11y Report
    Then I wait for 2 seconds
    And The page is accessible
