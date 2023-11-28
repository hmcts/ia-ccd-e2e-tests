Feature: Email address validation

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal

  @update-legal-rep-email @RIA-3948
  Scenario: Edit a legal rep email

    Then I click the `Appellant` tab
    And I click the `Update representative's details` link
    And I type `ia-law-firm-a@fake` for the `Email` field
    And the `Continue` button is disabled
    
    Then I type `new-ia-law-firm-a@fake.hmcts.net` for the `Email` field
    And I click the `Continue` button

    And I am on the `Check your answers` page
    And I should see `new-ia-law-firm-a@fake.hmcts.net` for the `Email` field
    And I click the `Update` button

    Then I should see the text `You've updated the legal representative's details`
    And I should see the text `The service will be updated. The new details will be used on all future correspondence and documents.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appellant` tab
    And I should see `new-ia-law-firm-a@fake.hmcts.net` for the `Email` field
    
