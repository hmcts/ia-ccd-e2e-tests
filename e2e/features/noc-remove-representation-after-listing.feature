Feature: Notice of Change (common component) - Remove Representation (after listing)

  Background:

    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Legal Org User Rep A`
    And I should be on the overview page

  @notice-of-change @noc-remove-representation-after-listing @RIA-3731
  Scenario: Notice of Change (common component) - Remove representation by legal representative (after listing)

    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Org User Rep A`
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`
    And I request respondent review
    And I add the appeal response
    And I request hearing requirements
    And I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all no when in country
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements no path
    And I switch to be a `Admin Officer`
    And I list the case

    And I switch to be a `Legal Org User Rep A`
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
    Then I should be redirected to the case list page
