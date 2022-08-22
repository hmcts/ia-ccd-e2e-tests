Feature: Update legal representatives details

Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I wait for 30 seconds
    And I create a new case
    And I save my initial EA appeal type without remission and with hearing fee and pay now
    And I wait for 5 seconds
    And I click the `Close and Return to case details` button
    Then I should see the text `You still need to pay for your appeal. You will soon receive a notification with instructions on how to pay by card online. You need to pay within 14 days of receiving the notification or the Tribunal will end the appeal.`
    And I pay for and submit my appeal by PBA
    And I wait for 5 seconds
    And I switch to be a `Case Officer`
    And I request home office data
    And I request respondent evidence

@update-legal-representatives-details @RIA-1358 @nightly-test
Scenario: update legal representatives details
    When I switch to be a `Legal Org User Rep A`
    And I click the `Appellant` tab
    And I wait for 2 seconds
    And I should see the text `Update representative's details`
    # And I should see `ia-legal-rep-org456` for the `Company` field
    # And I should see `Stephen Fenn` for the `Name` field
    # And I should see `ialegalreporgcreator12@mailinator.com` for the Email field
    # And I should see `ia-legal-fenn` for the `Legal representative reference` field
    When I select the `Update representative details` Next step
    # When I click the `Update representative's details` link
    And I wait for 2 seconds
    Then I am on the `Update representative details` page

    # And I should see `ia-legal-rep-org456` for the `Company` field
    # And I should see `Stephen Fenn` for the `Name` field
    # And I should see `ialegalreporgcreator12@mailinator.com` for the `Email` field
    # And I should see `ia-legal-fenn` for the `Own reference` field
    # And I wait for 2 seconds
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

    When I click the `Appellant` tab
    Then I should see the text `Update representative's details`
    # And I should see `ia-legal-rep-org456` for the `Company` field
    And I should see `Jane Doe` for the `Name` field
    And I should see `jane-doe@example.com` for the Email field
    And I should see `ia-legal-doe` for the `Legal representative reference` field
