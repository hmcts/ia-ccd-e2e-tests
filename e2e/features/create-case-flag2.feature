Feature: Create and manage Case Flags

    Background:
    # Given I am signed in as a `Legal Org User Rep A`
    # And I wait for 30 seconds
    # And I create a new case
    # And I save my initial EA appeal type without remission and with hearing fee and pay now
    # And I wait for 10 seconds
    # And I click the `Close and Return to case details` button
    # Then I should see the text `You still need to submit your appeal.`
    # And I pay for and submit my appeal by Card for a non PA appeal type
    # And I wait for 15 seconds

    @nightly-test43210
    Scenario: Create a case Flag
        And I switch to be a `Case Officer`
        When I select the `Create Flag` Next step
        Then I am on the `Create Flag` page
        And I have created a `Complex Case` Flag in `Case level`
        When I goto the `Case flags` tab
        Then I should see the text `Case level flags`
        Then I should see the text `Complex Case`

