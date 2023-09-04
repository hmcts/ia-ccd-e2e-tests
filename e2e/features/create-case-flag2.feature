Feature: Create and manage Case Flags for TCW

    Background:
        Given I am signed in as a `Legal Org User Rep A`
        And I wait for 30 seconds
        And I create a new case
        And I save my initial EA appeal type without remission and with hearing fee and pay now
        And I wait for 10 seconds
        And I click the `Close and Return to case details` button
        Then I should see the text `You still need to submit your appeal.`
        And I pay for and submit my appeal by Card for a non PA appeal type
        And I wait for 15 seconds

    @nightly-test @caseflag
    Scenario: Create a case Flag
        And I switch to be a `Case Officer`
        When I select the `Create Flag` Next step
        Then I am on the `Create Flag` page
        And I have created a `Complex Case` Flag in `Case level`
        Then I should see an alert confirming the case `has been updated with event: Create Flag`
        When I goto the `Case flags` tab
        Then I should see the text `Case level flags`
        Then I should see the text `Complex Case`

    @nightly-test @caseflag @caseflag
    Scenario: Create a case Flag and make In Active
        And I switch to be a `Case Officer`
        When I select the `Create Flag` Next step
        Then I am on the `Create Flag` page
        And I have created a `Complex Case` Flag in `Case level`
        Then I should see an alert confirming the case `has been updated with event: Create Flag`
        When I select the `Manage Flags` Next step
        And I will make `Complex Case` as In Active
        Then I should see an alert confirming the case `has been updated with event: Manage Flag`

