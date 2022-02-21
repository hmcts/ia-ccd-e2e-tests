Feature: New Share a Case (common component)

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I wait for 5 seconds    
    And I create a new case
    And I save my initial PA appeal type without remission and with hearing fee and pay now
    And I wait for 5 seconds
    When I click the `pay for and submit your appeal` link
    And I select `PBA0087535` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button
    And I agree to the declaration
    And I click the `Continue` button
    When I click the `Pay and submit now` button
    Then I should see the text `Your appeal has been paid for and submitted`
    When I sign back in as a `Legal Org User Rep A`
    And the `Share Case` button is disabled
    And I Apply case list filter

  @new-share-a-case @RIA-3845 @nightly-test
  Scenario: Add user to share a case

    When I select the most recent case to share
    Then I should see the `Add recipient` page
    And I get the case id to be shared
    And I wait for 5 seconds
    When I enter text "@" in user email in share case page
    And I wait for 2 seconds
    Then I see a list of users filtered containing text "@"
    And I select a listed user not shared with in the share case page
    And I click Add user button in share case page
    And I click continue in share case page
    And I click the `Confirm` button
    And I click the `Go back to the case list.` link
    Given I am signed in as a `Legal Org User Rep A`
    And I refresh the page
    And I Apply case list filter
    When I select the most recent case to share
    Then I should see the `Add recipient` page
    And I get the shared case id

    And I confirm the case has the same case id as the shared case

