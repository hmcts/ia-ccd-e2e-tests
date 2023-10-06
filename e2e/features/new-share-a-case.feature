Feature: New Share a Case (common component)

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial EA appeal type without remission and with hearing fee and pay now
    And I wait for 10 seconds
    And I click the `Close and Return to case details` button
    Then I should see the text `You still need to submit your appeal.`
    And I pay for and submit my appeal by PBA for a non PA appeal type
    And I wait for 15 seconds
    Then I should see the text `Case record for EA`
    When I get the Appeal Reference
    And I go to the `Case List`
    And I wait for 20 seconds
    And I filter the cases by the Appeal Reference
    And I wait for 30 seconds

  @new-share-a-case @RIA-3845 @nightly-test
  Scenario: Add user to share a case

    And I select the most recent case to share
    Then I should see the `Add recipient` page
    When I get the case id to be shared
    And I wait for 5 seconds
    # For local test
#    When I enter text "ia-law-firm-b-sc@fake.hmcts.net" in user email in share case page
#    And I wait for 2 seconds
#    Then I see a list of users filtered containing text "ia-law-firm-b-sc@fake.hmcts.net"
    And I enter text "ia.legalrep.b.sc@mailnesia.com" in user email in share case page
    And I wait for 2 seconds
    Then I see a list of users filtered containing text "ia.legalrep.b.sc@mailnesia.com"

    When I select a listed user not shared with in the share case page
    And I click Add user button in share case page
    And I click continue in share case page
    And I click the `Confirm` button
    Then I click the `Go back to the case list.` link
    Given I am signed in as a `Legal Org User Rep B`
    And I refresh the page
    And I wait for 20 seconds
    When I filter the cases by the Appeal Reference
    And I wait for 30 seconds
    And I select the most recent case to share
    Then I should see the `Add recipient` page
    When I get the shared case id

    Then I confirm the case has the same case id as the shared case

