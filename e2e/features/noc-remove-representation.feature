Feature: Notice of Change (common component) - Remove Representation (before listing)

  Background:

    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I get the most recent case id for removing representation
    And I switch to be a `Legal Org User Rep A`
    And I should see the `Overview` page

  @notice-of-change @noc-remove-representation @RIA-3731
  Scenario: Notice of Change (common component) - Remove representation by legal representative (before listing)

    When I select the `Stop representing a client` Next step
    Then I should see the `Stop representing a client` page
    And I set the case role id field
    And I should see the text `Client`
    And I should see the text `José González`
    And I should see the text `Once you've submitted this request`
    And I should see the text `You will no longer have access to this case`
    And I should see the text `If the case has been shared with any colleagues, they will also lose access`
    And I should see the text `Linked appeals are not affected. If you want to stop representing a client on a linked appeal, you need to access the case and repeat this action.`
    And I click the `Continue` button

    And I click the `Submit` button
    And I should see the text `You have stopped representing this client`
    And I should see the text `What happens next`
    And I should see the text `We've sent you an email confirming you're no longer representing this client. You have been removed from this case and no longer have access to it.`
    And I should see the `View case list` link
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    When I enter the removed case id in the url
    Then I should see the text `No cases found. Try using different filters.`
