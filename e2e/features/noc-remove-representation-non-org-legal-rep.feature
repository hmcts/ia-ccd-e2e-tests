Feature: Notice of Change (common component) - Remove Representation

  Background:

    Given I am signed in as a `Legal Rep A`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal

  @notice-of-change @noc-remove-representation-error @RIA-3731
  Scenario: Notice of Change (common component) - Remove representation error message for non-org legal rep

    When I select the `Stop representing a client` Next step
    And I should see the text `Errors`
    And I should see the text `You must have a MyHMCTS organisation account to stop representing a client.`

