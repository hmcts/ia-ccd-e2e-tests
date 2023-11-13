Feature: Notice of Change (common component) - Remove Representation by TCW and AO (after listing)

  Background:

    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Legal Org User Rep A`
    And I should see the `Overview` page

  @notice-of-change @noc-remove-representation-by-tcw-after-listing @RIA-3951
  Scenario: Notice of Change (common component) - Remove representation by case officer (after listing)

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
    And I click the `Close and Return to case details` button if present

    Given I am signed in as a `Legal Org User Rep A`
    When I enter the removed case id in the url
    Then I should see the text `No cases found. Try using different filters.`

  @notice-of-change @noc-remove-representation-by-admin-officer-after-listing @RIA-3951
  Scenario: Notice of Change (common component) - Remove representation by admin officer (after listing)

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
    And I click the `Close and Return to case details` button if present

    Given I am signed in as a `Legal Org User Rep A`
    When I enter the removed case id in the url
    Then I should see the text `No cases found. Try using different filters.`

