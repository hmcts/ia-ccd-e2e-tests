Feature: Edit documents

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`

  @RIA-2783
  Scenario: Delete a document
    When I select the `Edit documents` Next step
    Then I am on the `Edit documents` page
    When I click the `Continue` button
    Then I should see the text `Reasons for editing or removing the documents`
    And the `Continue` button is disabled
    When I type `some reasons for editing documents` for the `Reasons for editing or removing the documents` field
    Then the `Continue` button is enabled
    When I click the `Continue` button
    Then I am on the `Edit documents` page
    When I click the `Submit` button
    Then I should see the case details
    When I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `Edit documents audit note` for the `Subject` field



