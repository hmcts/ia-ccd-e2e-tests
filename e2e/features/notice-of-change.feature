Feature: Notice of Change (common component)

  Background:

    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial EA appeal type without remission and with hearing fee and pay now
    And I click the `Close and Return to case details` button if present
    Then I should be on the overview page
    And I pay for and submit my appeal by Card
    And I get the most recent case id for the notice of change case

  @notice-of-change @noc-incorrect-answers-same-org @noc-incorrect-firstname-same-org @RIA-3745 @nightly-test
  Scenario: NoC request as a user from the same organisation (incorrect firstname anwser)

    When I switch to be a `Legal Org User Rep B`
    And I wait for 10 seconds
    And I click the `Notice of change` link
    Then I should see the `Notice of change` page
    And I enter the latest case id for the online case reference number
    And I click the `Continue` button
    And I should see the `Enter details` page
    And I enter the incorrect firstname answer to the challenge questions
    And I enter the correct lastname answer to the challenge questions
    And I click the `Continue` button
    And I wait for 30 seconds
    And I should see the text `There is a problem`
    And I click the `Back` link
    And I click the `Back` link

  @notice-of-change @noc-incorrect-answers-same-org @noc-incorrect-lastname-same-org @RIA-3745
  Scenario: NoC request as a user from the same organisation (incorrect lastname anwser)

    When I switch to be a `Legal Org User Rep B`
    And I click the `Notice of change` link
    Then I should see the `Notice of change` page
    And I enter the latest case id for the online case reference number
    And I click the `Continue` button
    And I should see the `Enter details` page
    And I enter the correct firstname answer to the challenge questions
    And I enter the incorrect lastname answer to the challenge questions
    And I click the `Continue` button
    And I should see the text `Enter the client details exactly as they’re written on the case, including any mistakes`
    And I click the `Back` link
    And I click the `Back` link

  @notice-of-change @noc-correct-answers-same-org @RIA-3745
  Scenario: NoC request as a user from the same organisation (correct answers)

    When I switch to be a `Legal Org User Rep B`
    And I click the `Notice of change` link
    Then I should see the `Notice of change` page
    And I enter the latest case id for the online case reference number
    And I click the `Continue` button
    And I should see the `Enter details` page
    And I enter the correct answers to the challenge questions
    And I click the `Continue` button
    And I should see the text `Your organisation already has access to this case`
    And I should see the text `You or a colleague are already representing this client on this case`

  @notice-of-change @noc-incorrect-answers-different-org @noc-incorrect-firstname-different-org @RIA-3745
  Scenario: NoC request as a user from a different organisation (incorrect firstname answer)

    When I switch to be a `Legal Org User Rep C`
    And I click the `Notice of change` link
    Then I should see the `Notice of change` page
    And I enter the latest case id for the online case reference number
    And I click the `Continue` button
    And I should see the `Enter details` page
    And I enter the incorrect firstname answer to the challenge questions
    And I enter the correct lastname answer to the challenge questions
    And I click the `Continue` button
    And I should see the text `Enter the client details exactly as they’re written on the case, including any mistakes`
    And I click the `Back` link
    And I click the `Back` link

  @notice-of-change @noc-incorrect-answers-different-org @noc-incorrect-lastname-different-org @RIA-3745
  Scenario: NoC request as a user from a different organisation (incorrect lastname answer)

    When I switch to be a `Legal Org User Rep C`
    And I click the `Notice of change` link
    Then I should see the `Notice of change` page
    And I enter the latest case id for the online case reference number
    And I click the `Continue` button
    And I should see the `Enter details` page
    And I enter the correct firstname answer to the challenge questions
    And I enter the incorrect lastname answer to the challenge questions
    And I click the `Continue` button
    And I should see the text `Enter the client details exactly as they’re written on the case, including any mistakes`
    And I click the `Back` link
    And I click the `Back` link

  @notice-of-change @noc-correct-answers-different-org @RIA-3745 @nightly-test
  Scenario: NoC request as a user from a different organisation (correct answers)

    When I switch to be a `Legal Org User Rep C`
    And I click the `Notice of change` link
    Then I should see the `Notice of change` page
    And I enter the latest case id for the online case reference number
    And I click the `Continue` button
    And I should see the `Enter details` page
    And I enter the correct answers to the challenge questions
    And I click the `Continue` button
    And I select all the submit checkboxes
    And I click the `Submit` button
    And I should see the text `Notice of change successful`
    And I should see the text `You're now representing a client on case`
    And I should see the `View this case` link
    And I should see the `View case list` link
    When I click the `View this case` link
    Then I should see the `Overview` page

    Given I am signed in as a `Legal Org User Rep A`
    When I enter the removed case id in the url
    Then I should see the text `No cases found. Try using different filters.`


