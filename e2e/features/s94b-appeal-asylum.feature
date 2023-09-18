Feature: s94b appeal

    Background:
        Given I am signed in as a `Legal Org User Rep A`
        And I wait for 60 seconds
        And I create a new case

    @regression @caseflag @nightly-test
    Scenario: S94B appeal for PA Case
        And I save my initial PA appeal type without remission and with hearing fee and pay now
        And I wait for 12 seconds
        And I click the `Close and Return to case details` button
        And I wait for 5 second
        Then I should see the text `You still need to submit your appeal.`
        And I pay for and submit my appeal by PBA for a PA appeal type
        And I wait for 15 seconds
        And I switch to be a `Case Officer`
        When I select the `Update s94b status` Next step
        Then I am on the `Update s94b status` page
        And I will update s94b flag
        And I should see the image `journey_type_legally_represented_s94b.svg`
        When I goto the `Appeal` tab
        And I should see `Yes` in the `S94B appeal` field
        And I switch to be a `Admin Officer`
        And I should see the image `journey_type_legally_represented_s94b.svg`
        When I goto the `Appeal` tab
        And I should see `Yes` in the `S94B appeal` field
        And I switch to be a `Judge`
        And I should see the image `journey_type_legally_represented_s94b.svg`
        When I goto the `Appeal` tab
        And I should see `Yes` in the `S94B appeal` field

    @regression @caseflag @nightly-test
    Scenario: S94B appeal for RP Case
        And I save my initial EA appeal type without remission and with hearing fee and pay now
        And I wait for 12 seconds
        And I click the `Close and Return to case details` button
        And I wait for 5 second
        Then I should see the text `You still need to submit your appeal.`
        And I pay for and submit my appeal by PBA for a non PA appeal type
        And I wait for 15 seconds
        And I switch to be a `Case Officer`
        And I refresh the page
        When I select the `Update s94b status` Next step
        Then I am on the `Update s94b status` page
        # And I will update s94b flag
        When I select `Yes` for the `Mark appeal as s94b?` field
        And I click the `Continue` button
        Then I am on the `Check your answers` page
        And I should see `Yes` in the `Mark appeal as s94b?` field
        And I click the `Submit` button
        And I wait for 5 seconds
        And I should see the image `journey_type_legally_represented_s94b.svg`
        When I goto the `Appeal` tab
        And I should see `Yes` in the `S94B appeal` field
        And I switch to be a `Admin Officer`
        And I should see the image `journey_type_legally_represented_s94b.svg`
        When I goto the `Appeal` tab
        And I should see `Yes` in the `S94B appeal` field
        And I switch to be a `Judge`
        And I should see the image `journey_type_legally_represented_s94b.svg`
        When I goto the `Appeal` tab
        And I should see `Yes` in the `S94B appeal` field
