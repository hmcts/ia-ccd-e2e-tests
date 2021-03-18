Feature: Notice of Change (common component) - Remove Representation by TCW and AO

  Background:

    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I get the most recent case id for removing representation
    And I should see the `Overview` page

  @notice-of-change @noc-remove-representation-by-tcw @RIA-3951
  Scenario: Notice of Change (common component) - Remove representation by case officer

    And I switch to be a `Case Officer`

    When I select the `Remove legal representative` Next step
    Then I should see the `Remove legal representative` page
    And I set the case role id field
    And I should see the text `Client`
    And I should see the text `José González`
    And I should see the text `Once you've submitted this request`
    And I should see the text `The legal representative will no longer have access to this case`
    And I should see the text `If the case has been shared with other legal representatives, they will also lose access`
    And I should see the text `If there are any cases linked to this appeal, they will not be affected`
    And I click the `Continue` button

    And I click the `Submit` button
    And I should see the text `You have removed the legal representative from this appeal`
    And I should see the text `What happens next`
    And I should see the text `All parties will be notified.`
    And I click the `Close and Return to case details` button

    Given I am signed in as a `Legal Org User Rep A`
    When I enter the removed case id in the url
    Then I should see the text `No cases found. Try using different filters.`

  @notice-of-change @noc-remove-representation-by-admin-officer @RIA-3951
  Scenario: Notice of Change (common component) - Remove representation by admin officer

    And I switch to be a `Admin Officer`

    When I select the `Remove legal representative` Next step
    Then I should see the `Remove legal representative` page
    And I set the case role id field
    And I should see the text `Client`
    And I should see the text `José González`
    And I should see the text `Once you've submitted this request`
    And I should see the text `The legal representative will no longer have access to this case`
    And I should see the text `If the case has been shared with other legal representatives, they will also lose access`
    And I should see the text `If there are any cases linked to this appeal, they will not be affected`
    And I click the `Continue` button

    And I click the `Submit` button
    And I should see the text `You have removed the legal representative from this appeal`
    And I should see the text `What happens next`
    And I should see the text `All parties will be notified.`
    And I click the `Close and Return to case details` button

    Given I am signed in as a `Legal Org User Rep A`
    When I enter the removed case id in the url
    Then I should see the text `No cases found. Try using different filters.`
