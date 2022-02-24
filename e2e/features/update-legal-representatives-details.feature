Feature: Update legal representatives details

Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I wait for 15 seconds
    And I create a new case
    And I save my initial PA appeal type without remission and with hearing fee and pay now
    And I wait for 5 seconds
    And I click the `Close and Return to case details` button
    And I select the `Pay and submit` Next step
    Then I should see the `Select PBA number` page
    And I select `PBA0087535` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button
    And I agree to the declaration
    And I click the `Continue` button
    When I click the `Pay and submit now` button
    And I wait for 15 seconds
    Then I should see the text `Your appeal has been paid for and submitted`
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
    Then I should see an alert confirming the case `has been updated with event: Update representative details`

    When I click the `Appellant` tab
    Then I should see the text `Update representative's details`
    # And I should see `ia-legal-rep-org456` for the `Company` field
    And I should see `Jane Doe` for the `Name` field
    And I should see `jane-doe@example.com` for the Email field
    And I should see `ia-legal-doe` for the `Legal representative reference` field
