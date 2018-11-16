Feature: Screening questions

  Background:
    Given I am signed in as a Legal Rep
    And I create a new case

  @create-case @alternate @RIA-226
  Scenario: Screening questions must be agreed to before continuing

    Given I am on the screening questions page
    And the Continue button is disabled
    When I click the My client is at least 18 years old label
    And I click the My client is not currently in detention label
    And I click the My client isn't appealing with other people as part of a linked appeal label
    And I click the My client is located in one of these postcodes: BN, CB, CM, HP, IP, ME, N, NR, RH, SE, TN, W, L, LA, M, OL, PR, SK, WA, WN label
    And I click the My client is presently in the UK label
    Then the Continue button is disabled
    When I click the My client is not stateless label
    Then the Continue button is enabled