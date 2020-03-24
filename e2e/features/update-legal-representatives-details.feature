Feature: Update legal representatives details

Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence

@update-legal-representatives-details @RIA-1358
Scenario: update legal representatives details
    When I switch to be a `Legal Rep`
    And I click the `Appellant` tab

    And I should see the text `Update representative's details`
    And I should see `IA Legal Services` for the `Company` field
    And I should see `Stephen Fenn` for the `Name` field
    And I should see `ia-law-firm-a@fake.hmcts.net` for the Email field
    And I should see `ia-legal-fenn` for the `Legal representative reference` field

    When I click the `Update representative's details` link
    Then I am on the `Update representative details` page

    And I should see `IA Legal Services` for the `Company` field
    And I should see `Stephen Fenn` for the `Name` field
    And I should see `ia-law-firm-a@fake.hmcts.net` for the `Email` field
    And I should see `ia-legal-fenn` for the `Own reference` field

    And I type `Jane Doe` for the `Name` field
    And I type `jane-doe@example.com` for the `Email` field
    And I type `ia-legal-doe` for the `Own reference` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Jane Doe` for the `Name` field
    And I should see `jane-doe@example.com` for the Email field
    And I should see `ia-legal-doe` for the `Own reference` field

    When I click the `Update` button
    Then I should see the text `You've updated the legal representative's details`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Update representative details`

    When I click the `Appellant` tab
    Then I should see the text `Update representative's details`
    And I should see `IA Legal Services` for the `Company` field
    And I should see `Jane Doe` for the `Name` field
    And I should see `jane-doe@example.com` for the Email field
    And I should see `ia-legal-doe` for the `Legal representative reference` field
