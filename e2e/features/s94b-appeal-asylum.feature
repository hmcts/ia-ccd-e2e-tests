Feature: s94b appeal

    Background:
        Given I am signed in as a `Legal Org User Rep A`
        And I wait for 30 seconds
        And I create a new case

    @regression  @nightly-test
    Scenario: S94B appeal for PA Case
        And I save my initial PA appeal type without remission and with hearing fee and pay now
        And I wait for 12 seconds
        And I click the `Close and Return to case details` button
        And I wait for 5 second
        Then I should see the text `You still need to submit your appeal.`
        And I pay for and submit my appeal by PBA for a PA appeal type
        And I wait for 15 seconds
        And I switch to be a `Case Officer`
        And I should see the `journey_type_appellant_in_person_s94b.svg` image
        When I goto the `Appeal` tab
        And I should see `Yes` in the `S94B appeal` field
        And I switch to be a `Admin Officer`
        And I should see the `journey_type_appellant_in_person_s94b.svg` image
        When I goto the `Appeal` tab
        And I should see `Yes` in the `S94B appeal` field
        And I switch to be a `Judge`
        And I should see the `journey_type_appellant_in_person_s94b.svg` image
        When I goto the `Appeal` tab
        And I should see `Yes` in the `S94B appeal` field

    @regression  @nightly-test
    Scenario: S94B appeal for RP Case
        When I save my initial RP appeal for nonPayment with hearing
        And I wait for 12 seconds
        And I click the `Close and Return to case details` button
        And I wait for 5 second
        Then I should see the text `You still need to submit your appeal.`
        And I wait for 5 seconds
        And I goto the `Overview` tab
        And I select the `Submit your appeal` Next step
        And I agree to the declaration
        When I click the `Submit` button
        Then I should see the text `Your appeal has been submitted`        And I wait for 15 seconds
        And I switch to be a `Case Officer`
        And I should see the `journey_type_appellant_in_person_s94b.svg` image
        When I goto the `Appeal` tab
        And I should see `Yes` in the `S94B appeal` field
        And I switch to be a `Admin Officer`
        And I should see the `journey_type_appellant_in_person_s94b.svg` image
        When I goto the `Appeal` tab
        And I should see `Yes` in the `S94B appeal` field
        And I switch to be a `Judge`
        And I should see the `journey_type_appellant_in_person_s94b.svg` image
        When I goto the `Appeal` tab
        And I should see `Yes` in the `S94B appeal` field
