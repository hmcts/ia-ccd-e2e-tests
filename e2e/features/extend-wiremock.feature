Feature: Extended WireMock and Response Transformation

  Background:

  @RIA-3959-org1 @RIA-3959
  Scenario: Share a case as a user from Organisation 1 (with email domain: fake.hmcts.net)

    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial appeal
    When I sign back in as a `Legal Org User Rep A`
    And the `Share Case` button is disabled

    When I select the most recent case to share
    Then I should see the `Add recipient` page
    And I get the case id to be shared

    When I enter text "@" in user email in share case page
    Then I see a list of users filtered containing text "@"
    And I select a listed user not shared with in the share case page
    And I click Add user button in share case page
    And I click continue in share case page
    And I click the `Confirm` button
    And I click the `Go back to the case list.` link

    Given I am signed in as a `Legal Org User Rep Creator`
    When I select the most recent case to share
    Then I should see the `Add recipient` page
    And I get the shared case id

    And I confirm the case has the same case id as the shared case

  @RIA-3959-org2 @RIA-3959
  Scenario: Share a case as a user from Organisation 2 (with email domain: fake2.hmcts.net)

    Given I am signed in as a `Legal Org User Rep C`
    And I create a new case
    And I save my initial appeal
    When I sign back in as a `Legal Org User Rep C`
    And the `Share Case` button is disabled

    When I select the most recent case to share
    Then I should see the `Add recipient` page
    And I get the case id to be shared

    When I enter text "@" in user email in share case page
    Then I see a list of users filtered containing text "@"
    And I select a listed user not shared with in the share case page
    And I click Add user button in share case page
    And I click continue in share case page
    And I click the `Confirm` button
    And I click the `Go back to the case list.` link

    Given I am signed in as a `Legal Org2 User Rep Creator`
    When I select the most recent case to share
    Then I should see the `Add recipient` page
    And I get the shared case id

    And I confirm the case has the same case id as the shared case

