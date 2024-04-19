Feature: Bails Add a case flag to bails application
    Background:
        Given I am signed in as a `Legal Org User Rep A Bails`
        And I create a new bail application
        And I save my initial application as a `Legal Rep` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative
        And I submit my bail application as a `Legal Rep`
        And I should see the text `What happens next`

    @nightly-test @caseflag @testy-test
    Scenario: Create a case Flag
        And I switch to be a `Admin Officer Bails`
        When I select the `Create Flag` Next step
        Then I am on the `Create Flag` page
        And I have created a `Complex Case` Flag in `Case level`
        Then I should see an alert confirming the case `has been updated with event: Create Flag`
        And I should see the text `There is 1 active flag on this case.`
        When I goto the `Case flags` tab
        Then I should see the text `Case level flags`
        Then I should see the text `Complex Case`

    @nightly-test @caseflag
    Scenario: Create a case Flag and make In Active
        And I switch to be a `Admin Officer Bails`
        When I select the `Create Flag` Next step
        Then I am on the `Create Flag` page
        And I click the `Case level` button
        And I click the `Next` button
        And I wait for 5 second
        And I click the `Complex Case` button
        And I click the `Next` button
        And I type `Test Complex case` from the field with ID `flagComments`
        And I click the `Next` button
        Then I am on the `Review flag details` page
        And I click the `Create Flag` button
        # And I have created a `Complex Case` Flag in `Case level`
        Then I should see an alert confirming the case `has been updated with event: Create Flag`
        And I should see the text `There is 1 active flag on this case.`
        When I select the `Manage Flags` Next step
        And I will make `Complex Case` as In Active
        Then I should see an alert confirming the case `has been updated with event: Manage Flag`