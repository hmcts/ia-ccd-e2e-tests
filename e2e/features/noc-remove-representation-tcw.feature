Feature: Notice of Change (common component) - Remove Representation by TCW

  Background:

    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I sign back in as a `Legal Org User Rep A`

    # Create a second case (to remove representation)
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I sign back in as a `Legal Org User Rep A`
    And I get the most recent case id for removing representation
    And I should see the `Overview` page

  @notice-of-change @noc-remove-representation @RIA-3751
  Scenario: Notice of Change (common component) - Remove representation by case officer

    When I select the `Stop representing a client` Next step
    Then I should see the `Stop representing a client` page
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
    And I click the `Close and Return to case details` button

    Given I am signed in as a `Legal Org User Rep A`
    When I get the most recent case id after successful remove represenation
    Then I confirm the remove representation case is no longer available
